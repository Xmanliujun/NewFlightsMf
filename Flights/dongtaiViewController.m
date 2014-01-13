//
//  dongtaiViewController.m
//  Flights
//
//  Created by mac on 13-2-19.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "dongtaiViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "DongTai.h"
#import "RemconqueDongTai.h"
#import "CListViewController.h"
#import "QiJiangDiViewController.h"



@interface dongtaiViewController ()

@end

@implementation dongtaiViewController
@synthesize start;
@synthesize str;
@synthesize str22,dict;
@synthesize curRow,curSection;
@synthesize la1;
@synthesize yy_request;
@synthesize activity;
@synthesize DoArray;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)httpAsi
{
    
    
    
    NSString * uid = [NSString stringWithFormat:@"fuL3jIsgEm"];
    
    NSString * strHttp = [NSString stringWithFormat:@"http://www.variflight.com/datainterface/Currentinterface.asp?Uid=%@&vDate=%@&vNum=%@",uid,la1.text,tf_3.text];
    
    strHttp = [strHttp stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"asdsdsd%@",strHttp);
    NSURL * urll = [NSURL URLWithString:strHttp];
    
    yy_request = [ASIHTTPRequest requestWithURL:urll];
    [yy_request setTag:1000];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    tf_3.text=@"";
    
    start = YES;
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载完成");
    
    [activity stopAnimating];
    
  
    
    NSDate * senddate=[NSDate date];
    NSDateFormatter *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HHmm"];
    NSString * locationString=[dateformatter stringFromDate:senddate];
    NSLog(@"时间 is :%@",locationString);
    
    
    NSLog(@"post  is %@",[request responseString]);
    
    NSData * responData = (NSData *)[request responseData];
    int i = [responData length];
    NSLog(@"数据长度 %d",i);
    
    NSStringEncoding enc = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *utf8str = [[[NSString alloc] initWithData:responData encoding:enc] autorelease];
    utf8str = [utf8str stringByReplacingOccurrencesOfString:@"\"GB2312\"" withString:@"\"utf-8\"" options:NSCaseInsensitiveSearch range:NSMakeRange(0,40)];
    
    DoArray = [RemconqueDongTai recommendedParser:utf8str];
    
    NSLog(@"schoolArray 长度 : %d",[DoArray count]);
    
   
    
    
    
    if ([DoArray count] !=0) {
        DongTai * doo = [DoArray objectAtIndex:0];
        NSRange range = NSMakeRange(0, 2);
        NSString * strNum = [doo.FlightArrtimePlan substringWithRange:range];
        NSLog(@"######  %@",strNum);
        
        NSRange range1 = NSMakeRange(3, 2);
        NSString * strNum1 = [doo.FlightArrtimePlan substringWithRange:range1];
        NSLog(@"######  %@",strNum1);
        
        NSString * strNum2 = [NSString stringWithFormat:@"%@%@",strNum,strNum1];
        NSLog(@" &&&&&& %@",strNum2);
        
        int k =[strNum2 intValue];
        
        
        NSLog(@"kkkkkk is %d",k);
        
        NSString * ssy=[NSString stringWithFormat:@"%@",locationString];
        int j=[ssy integerValue];
        NSLog(@"jjjjjjjj is %d",j);
        
        start = NO;
        
        if (k < j) {
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"此航班已降落!"
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
        }else{
            
            
            [self newView];
            start = NO;
            [activity stopAnimating];
            
        }

    }
    else {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请填写航班号"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        [activity stopAnimating];
    }
    

    

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

    DoArray=[[NSMutableArray alloc]initWithCapacity:0];
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self BUtton];
    
    self.dict = [NSDictionary dictionaryWithObjectsAndKeys:
                 @"AAT",@"阿勒泰",@"AKA",@"安康",@"AKU",@"阿克苏",@"AQG",@"安庆",@"BAV",@"包头", @"BDU",@"昌都",@"BHY",@"北海",@"BSD",@"保山",@"CAN",@"广州",@"CGD",@"常德", @"CGO",@"郑州",@"CGQ",@"长春",@"CHG",@"朝阳",@"CIF",@"赤峰",@"CIH",@"长治",@"CKG",@"重庆",@"CSX",@"长沙",@"CTU",@"成都",@"CZX",@"常州",@"DAT",@"大同",@"DAX",@"达县",@"DDG",@"丹东",@"DIG",@"迪庆/香格里拉",@"DLC",@"大连",@"DLU",@"大理",@"DNH",@"敦煌",@"DYG",@"张家界/大庸",@"DSN",@"鄂尔多斯",@"ENH",@"恩施",@"ENY",@"延安",@"FOC",@"福州",@"FUG",@"阜阳", @"GOQ", @"格尔木",@"GYS",@"广元",@"HAK",@"海口",@"HEK",@"黑河",@"HET",@"呼和浩特",@"HFE",@"合肥",@"HGH",@"杭州",@"HKG",@"香港",@"HLD",@"海拉尔",@"HLH",@"呼兰浩特",@"HRB",@"哈尔滨",@"HSN",@"舟山/普陀山",@"HYN",@"黄岩/路桥",@"HZG",@"汉中",@"IQM",@"且末",@"JDZ",@"景德镇",@"JGN",@"嘉峪关",@"JHG",@"西双版纳/景洪",@"JIL",@"吉林",@"JIU",@"九江",@"JJN",@"晋江",@"JMU",@"佳木斯",@"JNZ",@"锦州",@"JUZ",@"衢州",@"JZH",@"九寨沟",@"KCA",@"库车",@"KHG",@"喀什",@"KHH",@"高雄",@"KHN",@"南昌",@"KMG",@"昆明",@"KOW",@"赣州",@"KRL",@"库尔勒",@"KRY",@"克拉玛依",@"KWE",@"贵阳",@"KWL",@"桂林",@"LHW",@"兰州",@"LJG",@"丽江",@"LLF",@"永州",@"LNJ",@"临沧",@"LUM",@"德宏/芒市",@"LUZ",@"庐山",@"LXA",@"拉萨",@"LYA",@"洛阳",@"LYG",@"连云港",@"LYI",@"临沂",@"LZH",@"柳州",@"LZO",@"泸州",@"MDG",@"牡丹江",@"ƒ",@"澳门",@"MIG",@"绵阳",@"MXZ",@"梅县",@"NAO",@"南充",@"NAY",@"南苑",@"NDG",@"齐齐哈尔",@"NGB",@"宁波",@"NKG",@"南京",@"NNG",@"南宁",@"NNY",@"南阳",@"NTG",@"南通",@"PEK",@"北京",@"PZI",@"攀枝花",@"PVG",@"上海浦东",@"SHA",@"上海虹桥",@"SHE",@"沈阳",@"SHP",@"山海关/秦皇岛",@"SHS",@"沙市",@"SIA/XIY",@"西安",@"SJW",@"石家庄",@"SWA",@"汕头",@"SYM",@"思茅",@"SYX",@"三亚",@"SZV",@"苏州",@"SZX",@"深圳",@"TAO",@"青岛",@"TCG",@"塔城",@"TEN",@"铜仁",@"TGO",@"通辽",@"TNA",@"济南",@"TSA/TPE",@"台北",@"TSN",@"天津",@"TXN",@"黄山/屯西",@"TYN",@"太原",@"INC",@"银川",@"URC",@"乌鲁木齐",@"UYN",@"榆林",@"WEF",@"潍坊",@"WEH",@"威海",@"WNZ",@"温州",@"WUH",@"武汉",@"WUS",@"武夷山",@"WUT",@"五台山",@"WUZ",@"梧州",@"WXN",@"万县",@"XFN",@"襄樊",@"XIC",@"西昌",@"XIL",@"锡林浩特",@"XNM",@"厦门/石狮",@"XNN",@"西宁",@"XUZ",@"徐州",@"YBP",@"宜宾",@"YIH",@"宜昌",@"YIN",@"伊宁",@"YIW",@"义乌",@"YNJ",@"延吉",@"YNT",@"烟台",@"ZAT",@"昭通",@"ZHA",@"湛江",@"ZUH",@"珠海", nil];
    
    
    
    
}

-(void)BUtton
{

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
    
    
    btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"chickel222.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame=CGRectMake(79, 242, 162, 40);
    [self.view addSubview:btn];
    
    
    oneview=[[UIView alloc]initWithFrame:CGRectMake(0, 90, 320, 480)];
    oneview.backgroundColor=[UIColor whiteColor];
    oneview.hidden = YES;
    [self.view addSubview:oneview];
    
    _btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    _btn1.frame=CGRectMake(55, 20, 100, 60);
    _btn1.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
    [_btn1 addTarget:self action:@selector(_btn1pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:_btn1];
    labs=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 40)];
    labs.font=[UIFont fontWithName:@"Arial" size:15];
    labs.backgroundColor=[UIColor clearColor];
    labs.text=@"长春";
    labs.textAlignment=NSTextAlignmentCenter;
    labs.backgroundColor=[UIColor clearColor];
    labs.textColor=[UIColor blackColor];
    [_btn1 addSubview:labs];
    
    lable1=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    lable1.font=[UIFont fontWithName:@"Arial" size:12];
    lable1.backgroundColor=[UIColor clearColor];
    lable1.text=@"出发城市";
    lable1.textColor=[UIColor grayColor];
    lable1.textAlignment=NSTextAlignmentCenter;
    [_btn1 addSubview:lable1];
    
    _btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    _btn2.frame=CGRectMake(165, 20, 100, 60);
    _btn2.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
    [_btn2 addTarget:self action:@selector(_btn2pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:_btn2];
    
    labw=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, 100, 40)];
    labw.font=[UIFont fontWithName:@"Arial" size:15];
    labw.text=@"北京";
    labw.textAlignment=NSTextAlignmentCenter;
    labw.backgroundColor=[UIColor clearColor];
    labw.textColor=[UIColor blackColor];
    [_btn2 addSubview:labw];
    
    lable2=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 20)];
    lable2.font=[UIFont fontWithName:@"Arial" size:12];
    lable2.backgroundColor=[UIColor clearColor];
    lable2.text=@"到达城市";
    lable2.textColor=[UIColor grayColor];
    lable2.textAlignment=NSTextAlignmentCenter;
    [_btn2 addSubview:lable2];
    
    la=[[UILabel alloc]initWithFrame:CGRectMake(79, 100, 170, 40)];
    la.backgroundColor=[UIColor clearColor];
    NSDate *nowData = [NSDate date];
    la.text=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:0]];
    la.textAlignment=NSTextAlignmentCenter;
    [oneview addSubview:la];
    [la release];
    
    btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setImage:[UIImage imageNamed:@"chickel222.png"] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btn1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    btn1.frame=CGRectMake(79, 152, 162, 40);
    [oneview addSubview:btn1];
    
    
    
    UILabel *lable=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    lable.backgroundColor=[UIColor grayColor];
    lable.text=@"航班动态查询";
    lable.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:lable];
    [lable release];
    
    b1=[UIButton buttonWithType:UIButtonTypeCustom];
    b1.frame=CGRectMake(79, 50, 81, 42);
    [b1 addTarget:self action:@selector(b1btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [b1 setImage:[UIImage imageNamed:@"航班号_on.png"] forState:UIControlStateNormal];
    [self.view addSubview:b1];
    
    b2=[UIButton buttonWithType:UIButtonTypeCustom];
    b2.frame=CGRectMake(160, 50, 81, 42);
    [b2 addTarget:self action:@selector(b2btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [b2 setImage:[UIImage imageNamed:@"其降地_off.png"] forState:UIControlStateNormal];
    [self.view addSubview:b2];
    
    la1=[[UILabel alloc]initWithFrame:CGRectMake(79, 102, 162, 40)];
    la1.backgroundColor=[UIColor clearColor];
    la1.text=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:0]];
    la1.textAlignment=NSTextAlignmentCenter;
    
    [self.view addSubview:la1];
    
    
    image1= [[UIImageView alloc] initWithFrame:CGRectMake(79, 162, 162, 40)];
    [image1 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image1];
    [image1 release];

    
    tf_3=[[UITextField alloc]initWithFrame:CGRectMake(79, 162, 162, 40)];
    //tf_3.borderStyle=UITextBorderStyleRoundedRect;
    tf_3.placeholder=@"请输入航班号";
    tf_3.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf_3.keyboardType=UIKeyboardTypeNamePhonePad;
    tf_3.returnKeyType = UIReturnKeyDone;
    tf_3.tag=555;
    tf_3.delegate=self;
    [self.view addSubview:tf_3];
    
    
    
  
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activity];

}

-(void)_btn1pressed:(id)sender
{
    NSLog(@"出发城市");
    
    CListViewController * cityListView = [[[CListViewController alloc] init] autorelease];
    cityListView.tag = @"btntwo";
    cityListView.delegate = self;
    cityListView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cityListView animated:YES completion:NULL];
}
-(void)_btn2pressed:(id)sender
{
    NSLog(@"到达城市");
    
    CListViewController * cityListView = [[[CListViewController alloc] init] autorelease];
    cityListView.tag = @"btnthree";
    cityListView.delegate = self;
    cityListView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cityListView animated:YES completion:NULL];
    
}
- (void) citySelectionUpdate:(NSString *)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag
{
    self.curRow= newRow;
    self.curSection =newSection;
    NSLog(@"%d%d",newSection,newRow);
    
    if ([tag isEqualToString:@"btntwo"]) {
        labs.text=selectedCity;
        
    }else if([tag isEqualToString:@"btnthree"]){
        labw.text=selectedCity;
        
    }
    self.str22 = [NSString stringWithFormat:@"%@",[self.dict valueForKey:selectedCity]];
    
    NSLog(@"测试城市%@",self.str22);
    
    
}
- (NSString*) getDefaultCity
{
    
    return @"444";
}

-(void)b1btnPressed:(id)sender
{
    NSLog(@"123---");
    
    oneview.hidden = YES;
    la1.hidden = NO;
    tf_3.hidden = NO;
    image1.hidden = NO;
    
    [b1 setImage:[UIImage imageNamed:@"航班号_on.png"] forState:UIControlStateNormal];
    [b2 setImage:[UIImage imageNamed:@"其降地_off.png"] forState:UIControlStateNormal];
    
    
    
}

-(void)b2btnPressed:(id)sender
{
    NSLog(@"234---");
    
    oneview.hidden = NO;
    la1.hidden = YES;
    tf_3.hidden = YES;
    image1.hidden = YES;
    
    [b1 setImage:[UIImage imageNamed:@"航班号_off.png"] forState:UIControlStateNormal];
    [b2 setImage:[UIImage imageNamed:@"起降地_on.png"] forState:UIControlStateNormal];
    
}

-(void)newView
{
    awardBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 104, 320, 349)];
    awardBackGroundView.tag = 10003;
    awardBackGroundView.backgroundColor = [UIColor whiteColor];
    
    
    aWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    [aWindow addSubview:awardBackGroundView];
    [awardBackGroundView release];
    
    UIButton *_btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
     _btn.frame=CGRectMake(110, 310, 100, 40);
    [_btn addTarget:self action:@selector(_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [_btn setImage:[UIImage imageNamed:@"返回.png"] forState:UIControlStateNormal];
    [awardBackGroundView addSubview:_btn];
    
       if ([self.DoArray count] != 0) {
           

        DongTai * doo=[[[DongTai alloc] init] autorelease];
        NSLog(@"8989898 长度%d",[DoArray count]);
        doo=[self.DoArray objectAtIndex:0];

           
        UILabel *_la1=[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 50)];
        _la1.backgroundColor=[UIColor clearColor];
        _la1.text=[NSString stringWithFormat:@"%@   %@",doo.FlightCompany,doo.FlightNo];
        _la1.textAlignment=NSTextAlignmentCenter;
        _la1.textColor=[UIColor colorWithRed: 67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [awardBackGroundView addSubview:_la1];
        [_la1 release];
        
        
        UILabel *_la2=[[UILabel alloc] initWithFrame:CGRectMake(0, 50, 280, 50)];
        _la2.backgroundColor=[UIColor clearColor];
        _la2.text=[NSString stringWithFormat:@"出发城市: %@",doo.FlightDep];
        _la2.textAlignment=NSTextAlignmentCenter;
        _la2.textColor=[UIColor colorWithRed: 67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [awardBackGroundView addSubview:_la2];
        [_la2 release];
        
        UILabel *_la2a=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 280, 50)];
        _la2a.backgroundColor=[UIColor clearColor];
           if ([doo.FlightDeptime isEqualToString:@"false"]) {
               _la2a.text=[NSString stringWithFormat:@"计划 : %@     实际 : 无",doo.FlightDeptimePlan];

           }else{
               _la2a.text=[NSString stringWithFormat:@"计划 : %@     实际 : %@",doo.FlightDeptimePlan,doo.FlightDeptime];

           }
           
           
          
           
        _la2a.textAlignment=NSTextAlignmentCenter;
        _la2a.textColor=[UIColor colorWithRed: 67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [awardBackGroundView addSubview:_la2a];
        [_la2a release];
        
        UILabel *_la3=[[UILabel alloc] initWithFrame:CGRectMake(0, 150, 280, 50)];
        _la3.backgroundColor=[UIColor clearColor];
        _la3.text=[NSString stringWithFormat: @"抵达城市: %@",doo.FlightArr];
        _la3.textAlignment=NSTextAlignmentCenter;
        _la3.textColor=[UIColor colorWithRed: 67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [awardBackGroundView addSubview:_la3];
        [_la3 release];
        
        
        
        UILabel *_la4=[[UILabel alloc] initWithFrame:CGRectMake(0, 200, 280, 50)];
        _la4.backgroundColor=[UIColor clearColor];
        
           if ([doo.FlightArrtime isEqualToString:@"false"]) {
               _la4.text=[NSString stringWithFormat:@"计划 : %@     实际 : 无",doo.FlightArrtimePlan];
           }else{
               
               _la4.text=[NSString stringWithFormat:@"计划 : %@     实际 : %@",doo.FlightArrtimePlan,doo.FlightArrtime];
           }
           
           
        _la4.textAlignment=NSTextAlignmentCenter;
        _la4.textColor=[UIColor colorWithRed: 67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [awardBackGroundView addSubview:_la4];
        [_la4 release];

    }
    
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return ");
    
    if (textField.tag == 555) {
        NSString * text = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录:%@",text);
        NSLog(@"333");
        NSLog(@"%@",tf_3.text);
        tf_3.frame= CGRectMake(79, 162, 162, 40);
        image1.frame = CGRectMake(79, 162, 162, 40);
        [tf_3 resignFirstResponder];
        
    }
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"123123");
    if (textField.tag == 555) {
        
        
        tf_3.frame= CGRectMake(79, 102, 162, 40);
        image1.frame = CGRectMake(79, 102, 162, 40);
        
    }
    
}


-(void)_btnPressed:(id)sender
{
    awardBackGroundView.hidden=YES;
}

-(void)btnPressed:(id)sender
{
    NSLog(@"---");

   
      [activity startAnimating];
    
    NSLog(@"text  is  %@",tf_3.text);
    if (tf_3.text.length == 0 || [tf_3.text isEqualToString:@"(null)"]) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请填写航班号"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        [activity stopAnimating];
        
    }else{
        
        [self httpAsi];
    }
    
    
}

-(void)btn1Pressed:(id)sender
{
    NSLog(@"+++");
    
    QiJiangDiViewController *qjo=[[[QiJiangDiViewController alloc]init]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:qjo]autorelease];
    
    
    qjo.chufacs = [NSString stringWithFormat:@"%@",[dict valueForKey:labs.text]];
    qjo.didacs = [NSString stringWithFormat:@"%@",[dict valueForKey:labw.text]];
    qjo.shijiancs = la.text;
    
    
    qjo.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}

-(void)leftbtnItem:(id)sender;
{
    if (start==YES) {
        [yy_request clearDelegatesAndCancel];
    }
    awardBackGroundView.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(void)dealloc
{
    
    [super dealloc];
    [leftItems release];
    [tf_3 release];
    [oneview release];
    [labs release];
    [lable1 release];
    [labw release];
    [lable2 release];
    [la1 release];
    [imageView release];
    
    
}
-(NSString *)GetTomorrowDay:(NSDate *)aDate WithDay:(int)howDay
{
    NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+howDay)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[[NSDateFormatter alloc] init] autorelease];
    [dateday setDateFormat:@"yyyy.MM.dd"];
    return [dateday stringFromDate:beginningOfWeek];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
