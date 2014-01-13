//
//  ZhouGJiuDViewController.m
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "ZhouGJiuDViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "RecomXMlParser.h"
#import "ConXMLzhModel.h"
#import "UIImageView+WebCache.h"
#import "YuDingViewController.h"
#import "DengLuViewController.h"



@interface ZhouGJiuDViewController ()

@end

@implementation ZhouGJiuDViewController

@synthesize aString,ccString,denglu,deleArray;
@synthesize ruDishi,liDishi,sanZiMa,jiuDaim,addRess,schoolArray,httpStat;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dealloc
{
    [super dealloc];
    [deleArray release];
    [schoolArray release];
    
    if (httpStat == YES) {
        [formDataRequest clearDelegatesAndCancel];
        
    }
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载完成");
    if (request.tag==1001) {
        
        NSData * responData = [request responseData];
        
        NSString *stringxx = [[NSString alloc] initWithData:responData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",stringxx);
        
        
        
        self.schoolArray = [RecomXMlParser recommendedParser:stringxx];
        [stringxx release];
       
        httpStat = NO;
        
        if ([self.schoolArray count] > 0) {
            ConXMLzhModel * cont = [self.schoolArray objectAtIndex:0];
            NSLog(@"%@",cont.RoomTypeName);
            if ([cont.RoomTypeName isEqualToString:@"(null)"]||cont.RoomTypeName == nil) {
                UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"该酒店房间已满！"
                                                                 message:@"返回上一界面"
                                                                delegate:self
                                                       cancelButtonTitle:@"确定"
                                                       otherButtonTitles:nil];
                [alertView show];
                [alertView release];
            }else{
                [newTableView reloadData];
                
            }
           
           
            
            
        }else{
            [activity stopAnimating];
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时"
                                                             message:@"返回上一界面"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
            
            
            
        }

       
        [activity stopAnimating];
    }
     
   
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSError * error = [request error];
    NSLog(@"%@",error);
    [activity stopAnimating];
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时"
                                                     message:@"返回上一界面"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
    
}

-(void)httpStar
{
    NSString * strHttp = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_iphone?hotelCode=%@",jiuDaim,nil];
    
    
    
    NSLog(@"%@",strHttp);
    NSURL * url = [NSURL URLWithString:strHttp];


    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1001];
    [formDataRequest setPostValue:strHttp forKey:@"request"];
    [formDataRequest setTimeOutSeconds:100];
    [formDataRequest setDelegate:self];
    [formDataRequest startAsynchronous];
    
 
    httpStat = YES;
}


-(void)btnFanHui:(UIButton * )button
{
    if (httpStat == YES) {
        [formDataRequest clearDelegatesAndCancel];
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

	// Do any additional setup after loading the view.
    CGRect rect = self.view.bounds;

    
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 35, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkbtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    UIImageView * imagevi = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"通栏背景.png"]];
    imagevi.frame = CGRectMake(0, 0, 320, 40);
    
    UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    la.textAlignment = NSTextAlignmentCenter;
    la.backgroundColor = [UIColor clearColor];
    la.font = [UIFont fontWithName:@"Arial" size:15];
    la.text = [NSString stringWithFormat:@"酒店地址:%@",addRess];
    la.textColor = [UIColor whiteColor];
    la.numberOfLines = 0;
    [imagevi addSubview:la];
    [la release];
    
    [self.view addSubview:imagevi];
    [imagevi release];
    


    
    
    
    newTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 41, 320, rect.size.height -100) style:UITableViewStylePlain];
    newTableView.delegate = self;
    newTableView.dataSource = self;
    
    [self.view addSubview:newTableView];
    [newTableView release];
    
    
    
   
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 220)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];

    
    [activity startAnimating];
    
    
    [self httpStar];
    
    
     NSLog(@"%@  %@  %@",ruDishi,liDishi,jiuDaim);
    
}

-(void)stringWith:(NSString *)string With:(NSString *)User_ID WithArray:(NSMutableArray *)ary
{
    self.ccString = [NSString stringWithFormat:@"%@",string];
    self.aString = [NSString stringWithFormat:@"%@",User_ID];
    self.deleArray = [NSMutableArray arrayWithArray:ary];
}

-(void)yuDingbtn:(UIButton *)btn
{
    
    
    NSLog(@"btn tag %d",btn.tag);
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * mResurl = [defaults objectForKey:@"result"];
    NSString * mUser = [defaults objectForKey:@"user_Id"];
    
    
    NSLog(@"mResurl is  %@",mResurl);
    NSLog(@"mUser_ID  is %@",mUser);
    
    if ([mResurl isEqualToString:@"SUCCEED"]) {
        
        ConXMLzhModel * yuDingXML = [self.schoolArray objectAtIndex:btn.tag];
        
        YuDingViewController * newYuding = [[[YuDingViewController alloc] initWithTag:@"zhBian" WithArray:self.deleArray] autorelease];
        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:newYuding] autorelease];
        NSLog(@"%@",yuDingXML.RoomStay);
        newYuding.startDate = yuDingXML.RoomStay;
        newYuding.cSanZim = yuDingXML.CityCode;
        newYuding.roomName = yuDingXML.RoomTypeName;
        newYuding.amountPrice = yuDingXML.TolAmPic;
        newYuding.endDate = yuDingXML.RoomEndDate;
        newYuding.hotelName = yuDingXML.HotelName;
        newYuding.hotelEnName = self.addRess;
        newYuding.vendorCode = yuDingXML.VendorCode;
        newYuding.vendorName = yuDingXML.VendorName;
        newYuding.ratePlanCode = yuDingXML.RoomRatePlanCode;
        newYuding.hotelCode = yuDingXML.BasicProperty;
        newYuding.roomTypeCode = yuDingXML.RoomTypeCode;
        newYuding.payMent = yuDingXML.Payment;
        
        
        newYuding.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];

        

        
        
        
    }
    
    
    
    else if ([self.ccString isEqualToString:@"SUCCEED"]) {
        ConXMLzhModel * yuDingXML = [self.schoolArray objectAtIndex:btn.tag];
        
        YuDingViewController * newYuding = [[[YuDingViewController alloc] initWithTag:@"zhBian" WithArray:self.deleArray] autorelease];
         UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:newYuding] autorelease];
        NSLog(@"%@",yuDingXML.RoomStay);
        newYuding.startDate = yuDingXML.RoomStay;
        newYuding.cSanZim = yuDingXML.CityCode;
        newYuding.roomName = yuDingXML.RoomTypeName;
        newYuding.amountPrice = yuDingXML.TolAmPic;
        newYuding.endDate = yuDingXML.RoomEndDate;
        newYuding.hotelName = yuDingXML.HotelName;
        newYuding.hotelEnName = self.addRess;
        newYuding.vendorCode = yuDingXML.VendorCode;
        newYuding.vendorName = yuDingXML.VendorName;
        newYuding.ratePlanCode = yuDingXML.RoomRatePlanCode;
        newYuding.hotelCode = yuDingXML.BasicProperty;
        newYuding.roomTypeCode = yuDingXML.RoomTypeCode;
        newYuding.payMent = yuDingXML.Payment;
        
        
        newYuding.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
    }else {
        
        DengLuViewController * dvc = [[[DengLuViewController alloc]init]autorelease];
        dvc.delegate=self;
        UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:dvc] autorelease];
        dvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }

}



-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * CellID = @"cellid";
    UITableViewCell *  cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
    if (cell != nil) {

        
        UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(15, 5, 80, 30)];
        la.tag = 1001;
        la.font = [UIFont fontWithName:@"Arial" size:15];
        la.backgroundColor = [UIColor clearColor];
        la.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:la];
        [la release];
        
        UILabel * la2 = [[UILabel alloc] initWithFrame:CGRectMake(95, 5, 150, 30)];
        la2.tag = 1002;
        la2.font = [UIFont fontWithName:@"Arial" size:15];
        la2.backgroundColor = [UIColor clearColor];
        la2.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:la2];
        [la2 release];
        

        
        yuDingbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        yuDingbtn.frame = CGRectMake(240, 5, 80, 30);
        [yuDingbtn setImage:[UIImage imageNamed:@"预订按钮.png"] forState:UIControlStateNormal];
        yuDingbtn.tag = indexPath.row;
        [yuDingbtn addTarget:self action:@selector(yuDingbtn:) forControlEvents:UIControlEventTouchUpInside];
        [cell addSubview:yuDingbtn];
        
        
        UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(10,40, 80, 60)];
        imageview.image = [UIImage imageNamed:@"酒店照片背景1.png"];
        
        [cell addSubview:imageview];
        [imageview release];
        
        UIImageView * imview = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 74, 54)];
        imview.tag = 1004;
        [imageview addSubview:imview];
        [imview release];
        
        UILabel * la3 = [[UILabel alloc] initWithFrame:CGRectMake(95, 32, 200, 80)];
        la3.tag = 1003;
        la3.font = [UIFont fontWithName:@"Arial" size:12];
        la3.numberOfLines = 0;
        la3.backgroundColor = [UIColor clearColor];
        la3.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:la3];
        [la3 release];
        
        
        
    }
    if (self.schoolArray != nil) {
        
    
    ConXMLzhModel * conme = [self.schoolArray objectAtIndex:indexPath.row];
    
    UILabel * laa = (UILabel * )[cell viewWithTag:1001];
    laa.text = [NSString stringWithFormat:@"￥%@", conme.RateAmountPrice];
    
    
    UILabel * lab = (UILabel * )[cell viewWithTag:1002];
    lab.text = conme.RoomTypeName;
    
    UILabel * lac = (UILabel *)[cell viewWithTag:1003];
    lac.text = conme.RoomTypeDesc;
    
    UIImageView * imagevv = (UIImageView *)[cell viewWithTag:1004];
    [imagevv setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://media.sohoto.com/market/images/hotelimages%@",conme.URL]] placeholderImage:nil];
    
    
    
    
    
    cell.selectionStyle = UITableViewCellAccessoryNone;
    }
    return cell;
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.schoolArray count];
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    return 125;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
