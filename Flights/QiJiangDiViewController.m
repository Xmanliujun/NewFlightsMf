//
//  QiJiangDiViewController.m
//  Flights
//
//  Created by mac on 13-4-7.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "QiJiangDiViewController.h"
#import "ASIHTTPRequest.h"
#import "RemconqueDongTai.h"
#import "DongTai.h"
#import "XiangQingViewController.h"

@interface QiJiangDiViewController ()

@end

@implementation QiJiangDiViewController

@synthesize yy_request,activity,dict1,dict,rzmdict;
@synthesize chufacs,didacs,shijiancs;
@synthesize DoArray,array,mmenItem;
@synthesize start;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    [self httpAsi];
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    leftItem=[UIImage imageNamed:@"back.png"];
    UIButton *leftbtn=[UIButton buttonWithType:UIButtonTypeCustom];
    leftbtn.frame= CGRectMake(0, 0, 35, 25);
    [leftbtn setBackgroundImage:leftItem forState:UIControlStateNormal];
    [leftbtn addTarget:self action:@selector(leftbtnItem:) forControlEvents:UIControlEventTouchUpInside];
    leftItems=[[UIBarButtonItem alloc] initWithCustomView:leftbtn];
    self.navigationItem.leftBarButtonItem =leftItems;
    
    self.dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"CA",@"CA中国国际航空公司",@"3U",@"3U四川航空公司",@"8C",@"8C武汉东星航空",@"8L",@"8L云南祥鹏航空公司",@"BK",@"BK奥凯航空公司",@"CN",@"CN大新华航空公司",@"CZ",@"CZ中国南方航空公司",@"EU",@"EU成都鹰联航空",@"FM",@"FM上海航空公司",@"G5",@"G5恩考尔航空",@"GS",@"GS天津航空",@"HO",@"HO上海吉祥航空",@"HU",@"HU海南航空公司",@"JD",@"JD金鹿航空公司",@"JR",@"JR幸福航空",@"KN",@"KN中国联合航空",@"KY",@"KY昆明航空有限公司",@"MF",@"MF厦门航空公司",@"MU",@"MU中国东方航空公司",@"NS",@"NS河北航空公司",@"PN",@"PN中国西部航空",@"SC",@"SC山东航空公司",@"VD",@"VD河南航空有限公司",@"ZH",@"ZH深圳航空公司", nil];
    
    self.rzmdict = [NSDictionary dictionaryWithObjectsAndKeys:@"3Ua.png",@"四川航空公司",@"all.png",@"云南祥鹏航空公司",@"BKc.png",@"奥凯航空公司",@"CAd.png",@"中国国际航空公司",@"CZe.png",@"中国南方航空公司",@"all.png",@"成都鹰联航空公司",@"FMg.png",@"上海航空公司",@"G5h.png",@"恩考尔航空",@"all.png",@"天津航空",@"HOj.png",@"上海吉祥航空",@"all.png",@"海南航空公司",@"KNl.png",@"中国联合航空",@"MFm.png",@"厦门航空公司",@"MUn.png",@"中国东方航空公司",@"PNo.png",@"中国西部航空",@"SCp.png",@"山东航空公司",@"ZHq.png",@"深圳航空公司",@"KYr.png",@"昆明航空有限公司",@"all.png",@"河北航空公司",@"all.png",@"幸福航空",@"all.png",@"金鹿航空公司",@"CNv.png",@"大新华航空公司",@"VDw.png",@"河南航空有限公司",@"all.png",@"武汉东星航空",@"香港航空.png",@"香港航空公司",@"PNo.png",@"香港快运航空公司",nil];
    
    
    
    CGRect rect=self.view.bounds;
    tabView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, rect.size.height-27) style:UITableViewStylePlain];
    tabView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tabView.delegate = self;
    tabView.dataSource = self;
    [self.view addSubview:tabView];
    

    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
    [activity startAnimating];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.DoArray count] ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 40.0f;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    DongTai * mmD=[self.DoArray objectAtIndex:indexPath.row ];
    
    XiangQingViewController *XQ=[[[XiangQingViewController alloc]init]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:XQ]autorelease];
    
    XQ.str1=mmD.FlightCompany;
    XQ.str2=mmD.FlightNo;
    XQ.str3=mmD.FlightDeptimePlan;
    XQ.str4=mmD.FlightDeptime;
    XQ.str5=mmD.FlightDep;
    XQ.str6=mmD.FlightArrtimePlan;
    XQ.str7=mmD.FlightArrtime;
    XQ.str8=mmD.FlightArr;
    XQ.str9=mmD.FlightTerminal;
    
    
    XQ.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    [tabView deselectRowAtIndexPath:[tabView indexPathForSelectedRow] animated:YES];
    
    
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellID = [NSString stringWithFormat:@"id%d%d",indexPath.section,indexPath.row];
    // NSString * cellID =@"cellID";
    UITableViewCell * cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
    }
    NSLog(@"***** %d",[DoArray count]);
    laa = [[UILabel alloc] initWithFrame:CGRectMake(60, 0, 150, 40)];
    laa.tag = 1000;
    laa.font=[UIFont fontWithName:@"Arial" size:17];
    laa.backgroundColor = [UIColor clearColor];
    laa.textAlignment = NSTextAlignmentLeft;
    [cell.contentView addSubview:laa];
    
    
    
    
    lab = [[UILabel alloc] initWithFrame:CGRectMake(210, 0, 60, 40)];
    lab.tag = 1001;
    lab.font=[UIFont fontWithName:@"Arial" size:15];
    lab.backgroundColor = [UIColor clearColor];
    lab.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:lab];
    
    
    lab2 = [[UILabel alloc] initWithFrame:CGRectMake(270, 0, 50, 40)];
    lab2.tag = 1002;
    lab2.text=@"详情";
    lab2.backgroundColor = [UIColor clearColor];
    lab2.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    lab2.textAlignment = NSTextAlignmentCenter;
    [cell.contentView addSubview:lab2];
    
    
    UIImageView * imgView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 0, 30, 30)];
    imgView.tag = 1005;
    [cell addSubview:imgView];
    [imgView release];
    if ([DoArray count] != 0) {
        //  self.array = [NSMutableArray arrayWithArray:[self.DoArray objectAtIndex:indexPath.row]];
        if ([self.DoArray count] != indexPath.row) {
            
            
            mmenItem = [self.DoArray objectAtIndex:indexPath.row];
            NSLog(@"school  %d",[self.DoArray count]);
            NSLog(@"arry  %d",[self.array count]);
            
            
            UIImageView * image = (UIImageView*)[cell viewWithTag:1005];
            NSString * imger = [NSString stringWithFormat:@"%@",[rzmdict valueForKey:mmenItem.FlightCompany]];
            image.image = [UIImage imageNamed:imger];
            NSLog(@"二字码%@",imger);
            
            laa.text=[NSString stringWithFormat:@"%@",mmenItem.FlightCompany];
            laa.textColor = [UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
            
            lab.text=[NSString stringWithFormat:@"%@",mmenItem.FlightNo];
            lab.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
            
        }
        
    }
    
    
    
    return cell;
}



-(void)httpAsi
{
    
    if (start == YES) {
        
        [activity stopAnimating];
        [yy_request clearDelegatesAndCancel];
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"正在下载请不要重复操作!"
                                                         message:@"返回上一界面重新选择!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
    }else{
        
        [activity startAnimating];
        
        NSString * uid = [NSString stringWithFormat:@"fuL3jIsgEm"];
        
        NSString * strHttp = [NSString stringWithFormat:@"http://www.variflight.com/datainterface/Currentinterface.asp?Uid=%@&vOrg=%@&vDst=%@&vDate=%@",uid,chufacs,didacs,shijiancs];
        
        NSLog(@"asdsdsd%@",strHttp);
        NSURL * urll = [NSURL URLWithString:strHttp];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1000];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
        
        
    }
    
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载完成");
    start = NO;
    
    [activity stopAnimating];
    
    
    NSLog(@"post  is %@",[request responseString]);
    
    NSData * responData = (NSData *)[request responseData];
    int i = [responData length];
    NSLog(@"数据长度 %d",i);
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *utf8str = [[[NSString alloc] initWithData:responData encoding:enc] autorelease];
    utf8str = [utf8str stringByReplacingOccurrencesOfString:@"\"GB2312\"" withString:@"\"utf-8\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0,40)];
    
    self.DoArray = [RemconqueDongTai recommendedParser:utf8str];
    
    NSLog(@"schoolArray 长度 : %d",[DoArray count]);
    
    [tabView reloadData];
    
    
}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    start = NO;
    
    NSError * error = [request error];
    NSLog(@"*********  E %@",error);
    [activity stopAnimating];
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时！"
                                                     message:@"返回上一界面"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
    
}

-(void)leftbtnItem:(id)sender
{
    
    if (start==YES) {
        [yy_request clearDelegatesAndCancel];
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}
-(void)dealloc
{
    [super dealloc];
    
    [laa release];
    [lab release];
    [lab2 release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
