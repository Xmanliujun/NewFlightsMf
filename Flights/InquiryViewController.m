//
//  InquiryViewController.m
//  Flights
//
//  Created by mac on 12-10-18.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "InquiryViewController.h"
#import "RootViewController.h"
#import "RiLiBoViewController.h"
#import "CListViewController.h"
#import "CompanyViewController.h"
#import "ChecheViewController.h"
#import "chewangViewController.h"





@interface InquiryViewController ()

@end

@implementation InquiryViewController

@synthesize sten,ster,yueJm;


@synthesize curRow,curSection;
@synthesize str1,str2,str3,str,str21,str22,dict1,dict;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
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

    
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self BUtton];
    
   
    

    self.dict1 = [NSDictionary dictionaryWithObjectsAndKeys:@"CA",@"CA中国国际航空公司",@"3U",@"3U四川航空公司",@"8C",@"8C武汉东星航空",@"8L",@"8L云南祥鹏航空公司",@"BK",@"BK奥凯航空公司",@"CN",@"CN大新华航空公司",@"CZ",@"CZ中国南方航空公司",@"EU",@"EU成都鹰联航空",@"FM",@"FM上海航空公司",@"G5",@"G5恩考尔航空",@"GS",@"GS天津航空",@"HO",@"HO上海吉祥航空",@"HU",@"HU海南航空公司",@"JD",@"JD金鹿航空公司",@"JR",@"JR幸福航空",@"KN",@"KN中国联合航空",@"KY",@"KY昆明航空有限公司",@"MF",@"MF厦门航空公司",@"MU",@"MU中国东方航空公司",@"NS",@"NS河北航空公司",@"PN",@"PN中国西部航空",@"SC",@"SC山东航空公司",@"VD",@"VD河南航空有限公司",@"ZH",@"ZH深圳航空公司", nil];

    self.dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"AAT",@"阿勒泰",@"AKA",@"安康",@"AKU",@"阿克苏",@"AQG",@"安庆",@"BAV",@"包头", @"BDU",@"昌都",@"BHY",@"北海",@"BSD",@"保山",@"CAN",@"广州",@"CGD",@"常德", @"CGO",@"郑州",@"CGQ",@"长春",@"CHG",@"朝阳",@"CIF",@"赤峰",@"CIH",@"长治",@"CKG",@"重庆",@"CSX",@"长沙",@"CTU",@"成都",@"CZX",@"常州",@"DAT",@"大同",@"DAX",@"达县",@"DDG",@"丹东",@"DIG",@"迪庆/香格里拉",@"DLC",@"大连",@"DLU",@"大理",@"DNH",@"敦煌",@"DYG",@"张家界/大庸",@"DSN",@"鄂尔多斯",@"ENH",@"恩施",@"ENY",@"延安",@"FOC",@"福州",@"FUG",@"阜阳", @"GOQ", @"格尔木",@"GYS",@"广元",@"HAK",@"海口",@"HEK",@"黑河",@"HET",@"呼和浩特",@"HFE",@"合肥",@"HGH",@"杭州",@"HKG",@"香港",@"HLD",@"海拉尔",@"HLH",@"呼兰浩特",@"HRB",@"哈尔滨",@"HSN",@"舟山/普陀山",@"HYN",@"黄岩/路桥",@"HZG",@"汉中",@"IQM",@"且末",@"JDZ",@"景德镇",@"JGN",@"嘉峪关",@"JHG",@"西双版纳/景洪",@"JIL",@"吉林",@"JIU",@"九江",@"JJN",@"晋江",@"JMU",@"佳木斯",@"JNZ",@"锦州",@"JUZ",@"衢州",@"JZH",@"九寨沟",@"KCA",@"库车",@"KHG",@"喀什",@"KHH",@"高雄",@"KHN",@"南昌",@"KMG",@"昆明",@"KOW",@"赣州",@"KRL",@"库尔勒",@"KRY",@"克拉玛依",@"KWE",@"贵阳",@"KWL",@"桂林",@"LHW",@"兰州",@"LJG",@"丽江",@"LLF",@"永州",@"LNJ",@"临沧",@"LUM",@"德宏/芒市",@"LUZ",@"庐山",@"LXA",@"拉萨",@"LYA",@"洛阳",@"LYG",@"连云港",@"LYI",@"临沂",@"LZH",@"柳州",@"LZO",@"泸州",@"MDG",@"牡丹江",@"ƒ",@"澳门",@"MIG",@"绵阳",@"MXZ",@"梅县",@"NAO",@"南充",@"NAY",@"南苑",@"NDG",@"齐齐哈尔",@"NGB",@"宁波",@"NKG",@"南京",@"NNG",@"南宁",@"NNY",@"南阳",@"NTG",@"南通",@"PEK",@"北京",@"PZI",@"攀枝花",@"PVG",@"上海浦东",@"SHA",@"上海虹桥",@"SHE",@"沈阳",@"SHP",@"山海关/秦皇岛",@"SHS",@"沙市",@"SIA/XIY",@"西安",@"SJW",@"石家庄",@"SWA",@"汕头",@"SYM",@"思茅",@"SYX",@"三亚",@"SZV",@"苏州",@"SZX",@"深圳",@"TAO",@"青岛",@"TCG",@"塔城",@"TEN",@"铜仁",@"TGO",@"通辽",@"TNA",@"济南",@"TSA/TPE",@"台北",@"TSN",@"天津",@"TXN",@"黄山/屯西",@"TYN",@"太原",@"INC",@"银川",@"URC",@"乌鲁木齐",@"UYN",@"榆林",@"WEF",@"潍坊",@"WEH",@"威海",@"WNZ",@"温州",@"WUH",@"武汉",@"WUS",@"武夷山",@"WUT",@"五台山",@"WUZ",@"梧州",@"WXN",@"万县",@"XFN",@"襄樊",@"XIC",@"西昌",@"XIL",@"锡林浩特",@"XNM",@"厦门/石狮",@"XNN",@"西宁",@"XUZ",@"徐州",@"YBP",@"宜宾",@"YIH",@"宜昌",@"YIN",@"伊宁",@"YIW",@"义乌",@"YNJ",@"延吉",@"YNT",@"烟台",@"ZAT",@"昭通",@"ZHA",@"湛江",@"ZUH",@"珠海", nil];

    
    
}

-(void)viewDidUnload
{
    [super viewDidUnload];
    
}
-(void)dealloc
{
    [super dealloc];
    [oneview release];
    [leftItems release];
   
    
    [_lable release];
    [_lable1 release];
    [_lable2 release];
    [_lable3 release];
    [_lable4 release];
    
    [lable1 release];
    [lable2 release];
    [lable3 release];
    [lable4 release];
    
    [str release];
    [str1 release];
    [str2 release];
    [str3 release];
    [str21 release];
    [str22 release];
    
    
    [labs release];
    [labw release];
    [labe release];
    [labl release];
    
    [myimageView release];

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
    
    
    Onewaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Onewaybtn addTarget:self action:@selector(Onewaybtn:) forControlEvents:UIControlEventTouchUpInside];
    Onewaybtn.tag = 100;
    [self.view addSubview:Onewaybtn];
    
    
    Twowaybtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [Twowaybtn addTarget:self action:@selector(Twowaybtn:) forControlEvents:UIControlEventTouchUpInside];
    Twowaybtn.tag = 101;
    [self.view addSubview:Twowaybtn];
    
    _btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btn1 addTarget:self action:@selector(_btn1pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn1];
    [_btn1 setTitle:nil forState:UIControlStateNormal];
    
    
    _btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btn2 addTarget:self action:@selector(_btn2pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn2];
    
        
    _btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btn3 addTarget:self action:@selector(_btn3pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn3];
    
    
    
    _btn4=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btn4 addTarget:self action:@selector(_btn4pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn4];
    
        
    _btn5=[UIButton buttonWithType:UIButtonTypeCustom];
    [_btn5 addTarget:self action:@selector(_btn5pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_btn5];
    
    

        oneview=[[UIView alloc]initWithFrame:CGRectMake(0, 45, 320, 480)];
        oneview.backgroundColor=[UIColor whiteColor];
        oneview.hidden = YES;
        [self.view addSubview:oneview];
    
   
    
    btn0=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn0 addTarget:self action:@selector(btn0pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn0];
    
        
    btn1=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 addTarget:self action:@selector(btn1pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn1];
    
    
    
    btn2=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 addTarget:self action:@selector(btn2pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn2];
    
        
    btn3=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 addTarget:self action:@selector(btn3pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn3];
    
        
    btn4=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn4 addTarget:self action:@selector(btn4pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn4];
    
       
    btn5=[UIButton buttonWithType:UIButtonTypeCustom];
    [btn5 addTarget:self action:@selector(btn5pressed:) forControlEvents:UIControlEventTouchUpInside];
    [oneview addSubview:btn5];
    
    
        
        Onewaybtn.frame = CGRectMake(79, 3, 81, 42);
        [Onewaybtn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        
        Twowaybtn.frame = CGRectMake(160, 3, 81, 42);
        [Twowaybtn setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
        
        
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 75, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"plan.png"];
        [self.view addSubview:myimageView];
        
    
   
    _btn1.frame=CGRectMake(49, 65, 120, 60);
    _btn1.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
    labs=[[UILabel alloc]initWithFrame:CGRectMake(5, 20, 110, 40)];
    labs.font=[UIFont fontWithName:@"Arial" size:15];
    labs.text=@"长春";
    labs.textAlignment=NSTextAlignmentCenter;
    labs.backgroundColor=[UIColor clearColor];
    labs.textColor=[UIColor blackColor];
    [_btn1 addSubview:labs];
        
        lable1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 110, 20)];
        lable1.font=[UIFont fontWithName:@"Arial" size:12];
        lable1.text=@"出发城市";
        lable1.backgroundColor=[UIColor clearColor];
        lable1.textColor=[UIColor blackColor];
        lable1.textAlignment=NSTextAlignmentCenter;
        [_btn1 addSubview:lable1];
    
    UIImageView *imageV1 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 23, 12, 12)];
    imageV1.image = [UIImage imageNamed:@"01-055.png"];
    [_btn1 addSubview:imageV1];
    [imageV1 release];
    
        _btn2.frame=CGRectMake(170, 65, 120, 60);
        _btn2.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
        labw=[[UILabel alloc]initWithFrame:CGRectMake(5, 20, 110, 40)];
        labw.font=[UIFont fontWithName:@"Arial" size:15];
        labw.text=@"北京";
        labw.textAlignment=NSTextAlignmentCenter;
        labw.backgroundColor=[UIColor clearColor];
        labw.textColor=[UIColor blackColor];
        [_btn2 addSubview:labw];
        
        lable2=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 110, 20)];
        lable2.font=[UIFont fontWithName:@"Arial" size:12];
        lable2.text=@"到达城市";
        lable2.textColor=[UIColor blackColor];
        lable2.textAlignment=NSTextAlignmentCenter;
        [_btn2 addSubview:lable2];
    
    UIImageView *imageV2 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 23, 12, 12)];
    imageV2.image = [UIImage imageNamed:@"01-055.png"];
    [_btn2 addSubview:imageV2];
    [imageV2 release];
    
        
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 165, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"cent.png"];
        [self.view addSubview:myimageView];
        
        _btn3.frame=CGRectMake(79, 155, 220, 60);
        
        lable3=[[UILabel alloc]initWithFrame:CGRectMake(4, 10, 160, 40)];
        lable3.font=[UIFont fontWithName:@"Arial" size:15];
        lable3.backgroundColor=[UIColor whiteColor];
        NSDate *nowData = [NSDate date];
        lable3.text=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:0]];
        lable3.textAlignment=NSTextAlignmentCenter;
        lable3.textColor=[UIColor blackColor];
        [_btn3 addSubview:lable3];
    
    UIImageView *imageV3 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 23, 12, 12)];
    imageV3.image = [UIImage imageNamed:@"01-055.png"];
    [_btn3 addSubview:imageV3];
    [imageV3 release];
        
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 250, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"siet.png"];
        [self.view addSubview:myimageView];
        
        _btn4.frame=CGRectMake(79, 235, 220, 60);
        
        lable4=[[UILabel alloc]initWithFrame:CGRectMake(9, 10, 160, 40)];
        lable4.font=[UIFont fontWithName:@"Arial" size:15];
        lable4.backgroundColor=[UIColor whiteColor];
        lable4.text=@"航空公司（不限）";
        lable4.textAlignment=NSTextAlignmentCenter;
        lable4.textColor=[UIColor blackColor];
        [_btn4 addSubview:lable4];
    
    UIImageView *imageV4 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 23, 12, 12)];
    imageV4.image = [UIImage imageNamed:@"01-055.png"];
    [_btn4 addSubview:imageV4];
    [imageV4 release];

       
        _btn5.frame=CGRectMake(82, 325, 165, 45);
        [_btn5 setImage:[UIImage imageNamed:@"chickel222.png"] forState:UIControlStateNormal];

        
        
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"plan.png"];
        [oneview addSubview:myimageView];
        
        btn0.frame=CGRectMake(49, 20, 120, 60);
        btn0.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
        labe=[[UILabel alloc]initWithFrame:CGRectMake(5, 20, 110, 40)];
        labe.font=[UIFont fontWithName:@"Arial" size:15];
        labe.text=@"长春";
        labe.textColor=[UIColor blackColor];
        labe.textAlignment=NSTextAlignmentCenter;
        labe.backgroundColor=[UIColor clearColor];
        [btn0 addSubview:labe];

        _lable=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 110, 20)];
        _lable.font=[UIFont fontWithName:@"Arial" size:12];
        _lable.text=@"出发城市";
        _lable.textColor=[UIColor blackColor];
        _lable.textAlignment=NSTextAlignmentCenter;
        [btn0 addSubview:_lable];
    
    UIImageView *imageV5 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 23, 12, 12)];
    imageV5.image = [UIImage imageNamed:@"01-055.png"];
    [btn0 addSubview:imageV5];
    [imageV5 release];
        
        btn1.frame=CGRectMake(170, 20, 120, 60);
        btn1.titleLabel.font=[UIFont fontWithName:@"Arial" size:15];
        
        labl=[[UILabel alloc]initWithFrame:CGRectMake(5, 20, 110, 40)];
        labl.font=[UIFont fontWithName:@"Arial" size:15];
        labl.text=@"北京";
        labl.textColor=[UIColor blackColor];
        labl.textAlignment=NSTextAlignmentCenter;
        labl.backgroundColor=[UIColor clearColor];
        [btn1 addSubview:labl];
        
                
        _lable1=[[UILabel alloc]initWithFrame:CGRectMake(5, 0, 110, 20)];
        _lable1.font=[UIFont fontWithName:@"Arial" size:12];
        _lable1.text=@"到达城市";
        _lable1.textColor=[UIColor blackColor];
        _lable1.textAlignment=NSTextAlignmentCenter;
        [btn1 addSubview:_lable1];
    
    UIImageView *imageV6 = [[UIImageView alloc] initWithFrame:CGRectMake(110, 23, 12, 12)];
    imageV6.image = [UIImage imageNamed:@"01-055.png"];
    [btn1 addSubview:imageV6];
    [imageV6 release];

        
      
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 120, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"cent.png"];
        [oneview addSubview:myimageView];
        
        btn2.frame=CGRectMake(70, 110, 106, 60);
        btn2.titleLabel.font = [UIFont systemFontOfSize:16];
        
        _lable2=[[UILabel alloc]initWithFrame:CGRectMake(5, 10, 80 , 40)];
        _lable2.font=[UIFont fontWithName:@"Arial" size:15];
        _lable2.text=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:0]];
        _lable2.backgroundColor=[UIColor clearColor];
        _lable2.textColor=[UIColor blackColor];
        _lable2.textAlignment=NSTextAlignmentCenter;
        [btn2 addSubview:_lable2];
    
    UIImageView *imageV7 = [[UIImageView alloc] initWithFrame:CGRectMake(90, 23, 12, 12)];
    imageV7.image = [UIImage imageNamed:@"01-055.png"];
    [btn2 addSubview:imageV7];
    [imageV7 release];
    
        
        btn3.frame=CGRectMake(185, 110, 130, 60);
        btn3.titleLabel.font = [UIFont systemFontOfSize:16];
        
        _lable3=[[UILabel alloc]initWithFrame:CGRectMake(5, 10, 80 , 40)];
        _lable3.font=[UIFont fontWithName:@"Arial" size:15];
        _lable3.text=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:1]];
        _lable3.backgroundColor=[UIColor whiteColor];
        _lable3.textColor=[UIColor blackColor];
        _lable3.textAlignment=NSTextAlignmentCenter;
        [btn3 addSubview:_lable3];

    UIImageView *imageV8 = [[UIImageView alloc] initWithFrame:CGRectMake(95, 23, 12, 12)];
    imageV8.image = [UIImage imageNamed:@"01-055.png"];
    [btn3 addSubview:imageV8];
    [imageV8 release];
        
        
        myimageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 205, 40, 40)];
        myimageView.image = [UIImage imageNamed:@"siet.png"];
        [oneview addSubview:myimageView];
        
        btn4.frame=CGRectMake(79, 190, 220, 60);
        
        _lable4=[[UILabel alloc]initWithFrame:CGRectMake(9, 10, 160, 40)];
        _lable4.font=[UIFont fontWithName:@"Arial" size:15];
        _lable4.text=@"航空公司（不限）";
        _lable4.backgroundColor=[UIColor whiteColor];
        _lable4.textColor=[UIColor blackColor];
        _lable4.textAlignment=NSTextAlignmentCenter;
        [btn4 addSubview:_lable4];
    
    UIImageView *imageV9 = [[UIImageView alloc] initWithFrame:CGRectMake(200, 23, 12, 12)];
    imageV9.image = [UIImage imageNamed:@"01-055.png"];
    [btn4 addSubview:imageV9];
    [imageV9 release];

    
        btn5.frame=CGRectMake(82, 280, 165, 45);
        [btn5 setImage:[UIImage imageNamed:@"chickel222.png"] forState:UIControlStateNormal];
        
        CGRect rect=self.view.bounds;
        
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, rect.size.height-71, 320, 27)];
        imageView.image = [UIImage imageNamed:@"buttmn320.png"];
        [self.view addSubview:imageView];

   

}

-(void)leftbtnItem:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)Onewaybtn:(UIButton*)btn
{
    
    oneview.hidden = YES;
    
        
        [Onewaybtn setImage:[UIImage imageNamed:@"2.png"] forState:UIControlStateNormal];
        [Twowaybtn setImage:[UIImage imageNamed:@"3.png"] forState:UIControlStateNormal];
    
        
}

-(void)Twowaybtn:(UIButton*)btn
{
    
    oneview.hidden = NO;
    
        [Onewaybtn setImage:[UIImage imageNamed:@"1.png"] forState:UIControlStateNormal];
        [Twowaybtn setImage:[UIImage imageNamed:@"4.png"] forState:UIControlStateNormal];

    
}

-(void)_btn1pressed:(id)sender
{
    CListViewController * cityListView = [[[CListViewController alloc] init] autorelease];
    cityListView.tag = @"btntwo";
    cityListView.delegate = self;
    cityListView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cityListView animated:YES completion:NULL];

}
-(void)_btn2pressed:(id)sender
{
    CListViewController * cityListView = [[[CListViewController alloc] init] autorelease];
    cityListView.tag = @"btnthree";
    cityListView.delegate = self;
    cityListView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cityListView animated:YES completion:NULL];
}
-(void)_btn3pressed:(id)sender
{
    RiLiBoViewController *Dvc=[[[RiLiBoViewController alloc]init]autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:Dvc] autorelease];

    Dvc.delegate = self;
    Dvc.tag = @"Dvc";
    Dvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
   

}
-(void)_btn4pressed:(id)sender
{
    
    CompanyViewController * CompanyView = [[[CompanyViewController alloc] init] autorelease];
    CompanyView.tag = @"four";
    CompanyView.delegate = self;
    CompanyView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:CompanyView animated:YES completion:NULL];
}
-(void)_btn5pressed:(id)sender
{
    
    ChecheViewController *che=[[[ChecheViewController alloc]init]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:che]autorelease];
    che.hkgscz = lable4.text;
    che.cscz = [NSString stringWithFormat:@"%@",[dict valueForKey:labs.text]];
    che.cscz2 = [NSString stringWithFormat:@"%@",[dict valueForKey:labw.text]];
    che.rqcz = lable3.text;
    che.erZim = self.str21;
    che.chuFa = labs.text;
    che.diDa = labw.text;
    
    
    che.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}

-(void)btn0pressed:(id)sender
{
    detailViewController = [[CListViewController alloc] initWithNibName:@"CityListViewController" bundle:nil];
    detailViewController.delegate = self;
    detailViewController.curSection =self.curSection;
    detailViewController.curRow = self.curRow;
    detailViewController.tag = @"btnzero";
    detailViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:detailViewController animated:YES completion:NULL];
    [detailViewController release];

    
}

- (void) citySelectionUpdate:(NSString *)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag
{
    self.curRow= newRow;
    self.curSection =newSection;
    NSLog(@"%d%d",newSection,newRow);
    
    if ([tag isEqualToString:@"btnzero"]) {
        labe.text=selectedCity;
        
    }else if([tag isEqualToString:@"btnone"]){
        labl.text=selectedCity;
      
    }else if ([tag isEqualToString:@"btntwo"]){
         labs.text =selectedCity;
    
        
    }else if ([tag isEqualToString:@"btnthree"]){
        labw.text = selectedCity;
       
    }else if ([tag isEqualToString:@"four"]){
        lable4.text = selectedCity;
    }
    
     self.str22 = [NSString stringWithFormat:@"%@",[self.dict valueForKey:selectedCity]];
    
   
    
    
}
-(void)companySelectionUpdate:(NSString *)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag
{

    if ([tag isEqualToString:@"four"]) {
       lable4.text = selectedCity;
    }else if ([tag isEqualToString:@"wangfan"]){
    
        _lable4.text = selectedCity;
    }
    
    
  
  self.str21 = [NSString stringWithFormat:@"%@",[self.dict1 valueForKey:selectedCity]];
    NSLog(@"%@",self.str21);

    
    
    

}
- (NSString*) getDefaultCity
{
   
    return @"444";
}

-(void)btn1pressed:(id)sender
{
    CListViewController * cityListView = [[[CListViewController alloc] init] autorelease];
    cityListView.tag = @"btnone";
    cityListView.delegate = self;
    cityListView.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cityListView animated:YES completion:NULL];
   
    
}
-(void)btn2pressed:(id)sender
{
        
    RiLiBoViewController *Dvc2=[[[RiLiBoViewController alloc]init]autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:Dvc2] autorelease];
    Dvc2.delegate = self;
    Dvc2.tag = @"Dvc2";
    Dvc2.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];


}
-(void)btn3pressed:(id)sender
{
    RiLiBoViewController *Dvc3=[[[RiLiBoViewController alloc]init]autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:Dvc3] autorelease];

    Dvc3.delegate = self;
    Dvc3.tag = @"Dvc3";
    Dvc3.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
}


-(void)btn4pressed:(id)sender
{

    NSLog(@"4");
    CompanyViewController * cm = [[[CompanyViewController alloc] init] autorelease];
    cm.tag = @"wangfan";
    cm.delegate = self;
    cm.modalTransitionStyle=UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:cm animated:YES completion:NULL];
    
    
    

}

-(void)btn5pressed:(id)sender
{
    chewangViewController *che_View=[[[chewangViewController alloc]init]autorelease];
    UINavigationController *naav=[[[UINavigationController alloc]initWithRootViewController:che_View]autorelease];
    che_View.hkgscz =_lable4.text;
    che_View.cscz = [NSString stringWithFormat:@"%@",[dict valueForKey:labe.text]];
    che_View.cscz2 = [NSString stringWithFormat:@"%@",[dict valueForKey:labl.text]];
    che_View.rqcz = _lable2.text;
    che_View.erZim = self.str21;
    che_View.chuFa = labe.text;
    che_View.diDa = labl.text;
    che_View.dRqca = _lable3.text;
    
    
    
    che_View.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:naav animated:YES completion:NULL];
    
}


-(void)chuanzhiString:(NSString *)strNian withStrt:(NSString *)strYue withStr:(NSString *)strDay withTag:(NSString *)tag
{
    self.str1 = strNian;
       
    
    int strY = [strYue intValue];
    int strD = [strDay intValue];
    
    if (strY <=9) {
        
        self.str2 = [NSString stringWithFormat:@"%d%d",0,strY];
    }else {
        self.str2 = [NSString stringWithFormat:@"%d",strY];
        
    }
    
    if (strD <= 9){
        
        self.str3 = [NSString stringWithFormat:@"%d%d",0,strD];
    } else{
        
        self.str3 = [NSString stringWithFormat:@"%d",strD];
        
    }
    
    
    self.str = [NSString stringWithFormat:@"%@.%@.%@",self.str1,self.str2,self.str3];
    NSLog(@"%@",str);
    
   
    if ([tag isEqualToString:@"Dvc"]) {
        lable3.text= self.str;
        NSLog(@"%@",str);
   
       
    }else if ([tag isEqualToString:@"Dvc2"]){
    
        _lable2.text = self.str;
    }else if ([tag isEqualToString:@"Dvc3"]){
        _lable3.text=self.str;
    }else if ([tag isEqualToString:@"CompanyView"]){
        lable4.text=self.str;
    }
    
    
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
    
}

@end
