//
//  ScBerthController.m
//  Flights
//
//  Created by XmL on 12-11-15.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "ScBerthController.h"
#import "Sched_NHViewController.h"
#import "_DengLuViewController.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"




@interface ScBerthController ()

@end

@implementation ScBerthController

@synthesize deleArray;
@synthesize jbk;
@synthesize suv;
@synthesize myArray,timeStr1,timeStr2,chufaMing,didaMing;
@synthesize myNewsIt,cszima,cszima2,qiFeish,diDash;
@synthesize berDingItem,myNewPrice;
@synthesize denglu;
@synthesize aString,ccString;
@synthesize jiageArray;
@synthesize danYud;
@synthesize ya;
@synthesize y_danCangWei,y_danDiDa,y_danDiDaTime,y_danJiaGe,y_danJiJian,y_danQiFei,y_danQiFeiTime,y_danRanYou,y_danTuiGaiQian,y_danZheKou,y_danHangBanHao,y_danjixing;

@synthesize st11,st22;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithArray:(NSMutableArray *)array WithNewItem:(MyNewXmlMolde * )newItem withtwoNewItem:(MyNewXmlMolde *)twoItem;
{
    if (self = [super init]) {
        self.myArray = [NSMutableArray arrayWithArray:array];
        

       self.berDingItem = newItem;
        self.ya = twoItem;
        
    }
    return self;
}
-(void)dealloc
{
    [super dealloc];
    
    
    [lable_qw release];
    [lable1_p release];
    [lable2_i release];
    [lable3_y release];
    [lable4_k release];
    [lable5_b release];
    
    
    [myArray release];
    [La_ble release];
    [Lb_ale release];
    [_la_bel release];
    [_la_ble release];
    [_lable release];
    [_lab release];
    [_la release];
    [_lb release];
    [_lc release];
    [_ld release];
    [timeStr1 release];
    [timeStr2 release];
    [chufaMing release];
    [didaMing release];
    [cszima release];
    [cszima2 release];
    [qiFeish release];
    [diDash release];
 
    //[myNewsIt release];
    
    
    
    
    
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
    
    
    
    NSLog(@"单程起飞时间 %@",self.y_danQiFei);
    NSLog(@"单程抵达时间 %@",self.y_danDiDa);
    NSLog(@"单程起飞城市 %@",self.y_danQiFeiTime);
    NSLog(@"单程抵达城市 %@",self.y_danDiDaTime);
    NSLog(@"单程舱位 %@",self.y_danCangWei);
    NSLog(@"单程价格 %@",self.y_danJiaGe);
    NSLog(@"单程折扣 %@",self.y_danZheKou);
    NSLog(@"单程机场建设费 %@",self.y_danJiJian);
    NSLog(@"单程燃油 %@",self.y_danRanYou);
    NSLog(@"单程退改签 %@",self.y_danTuiGaiQian);
    NSLog(@"单程航班号 %@",self.y_danHangBanHao);
    NSLog(@"单程机型 %@",self.y_danjixing);
    
    

    
        CGRect rect=self.view.bounds;
    

     deleArray = [[NSMutableArray alloc] initWithCapacity:0];
      
        
        scrollView_ = [[[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320,rect.size.height-200)] autorelease];
        
        imageView_loup= [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,150)] autorelease];
        [imageView_loup setImage:[UIImage imageNamed:@"机票城市对信息背景.png"]];
        [self.view addSubview:imageView_loup];
        
        UIImageView * img2 = [[UIImageView alloc] initWithFrame:CGRectMake(148,35,31,27)];
        img2.image = [UIImage imageNamed:@"18.png"];
        [imageView_loup addSubview:img2];
        [img2 release];
        
    
        
        lable_qw=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 120, 40)];
        lable_qw.backgroundColor=[UIColor clearColor];
        lable_qw.text=[NSString stringWithFormat:@"%@",self.didaMing];
        lable_qw.textColor=[UIColor blackColor];
        lable_qw.textAlignment=NSTextAlignmentCenter;
        lable_qw.font=[UIFont fontWithName:@"Arial" size:17];
        [self.view addSubview:lable_qw];
        
        lable1_p=[[UILabel alloc]initWithFrame:CGRectMake(200, 30, 120, 40)];
        lable1_p.backgroundColor=[UIColor clearColor];
        lable1_p.text=[NSString stringWithFormat:@"%@",self.chufaMing];
        lable1_p.textColor=[UIColor blackColor];
        lable1_p.textAlignment=NSTextAlignmentCenter;
        lable1_p.font=[UIFont fontWithName:@"Arial" size:17];
        [self.view addSubview:lable1_p];
    
     MyNewXmlMolde * mmd = [myArray objectAtIndex:0];
    NSRange rangN = NSMakeRange(0, 2);
    NSString * nianFen = [mmd.xDepTime substringWithRange:rangN];
    
    NSRange rangN1 = NSMakeRange(2, 2);
    NSString * nianFen1 = [mmd.xDepTime substringWithRange:rangN1];
   st11 = [NSString stringWithFormat:@"%@:%@",nianFen,nianFen1];
    
    
    NSRange rangN2 = NSMakeRange(0, 2);
    NSString * nianFen3 = [mmd.xArrTime substringWithRange:rangN2];
    
    NSRange rangN3 = NSMakeRange(2, 2);
    NSString * nianFen4 = [mmd.xArrTime substringWithRange:rangN3];
   st22 = [NSString stringWithFormat:@"%@:%@",nianFen3,nianFen4];
    
    
        lable2_i=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        lable2_i.backgroundColor=[UIColor clearColor];
        lable2_i.text=[NSString stringWithFormat:@"起飞时间：%@",st11];
        lable2_i.textColor=[UIColor blackColor];
        lable2_i.textAlignment=NSTextAlignmentCenter;
        lable2_i.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable2_i];

    
        
        lable3_y=[[UILabel alloc]initWithFrame:CGRectMake(200, 100, 120, 20)];
        lable3_y.backgroundColor=[UIColor clearColor];
        lable3_y.text=[NSString stringWithFormat:@"抵达时间：%@",st22];
        lable3_y.textColor=[UIColor blackColor];
        lable3_y.textAlignment=NSTextAlignmentCenter;
        lable3_y.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable3_y];
        
        
        MyNewXmlMolde * mmdate = [myArray objectAtIndex:0];
    NSLog(@"ccname is  %@",mmdate.xFlightDate);
    
    yy_l = [[UILabel alloc]initWithFrame:CGRectMake(148, 65, 31, 30)];
    yy_l.backgroundColor = [UIColor clearColor];
    yy_l.text = [NSString stringWithFormat:@"%@",mmdate.xAircraft];
    yy_l.textColor = [UIColor blackColor];
    yy_l.textAlignment = NSTextAlignmentCenter;
    yy_l.font = [UIFont fontWithName:@"Arial" size:12];
    [self.view addSubview:yy_l];
    
        lable4_k=[[UILabel alloc]initWithFrame:CGRectMake(0, 125, 120, 20)];
        lable4_k.backgroundColor=[UIColor clearColor];
        lable4_k.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable4_k.textColor=[UIColor blackColor];
        lable4_k.textAlignment=NSTextAlignmentCenter;
        lable4_k.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable4_k];
        
        lable5_b=[[UILabel alloc]initWithFrame:CGRectMake(200, 125, 120, 20)];
        lable5_b.backgroundColor=[UIColor clearColor];
        lable5_b.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable5_b.textColor=[UIColor blackColor];
        lable5_b.textAlignment=NSTextAlignmentCenter;
        lable5_b.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable5_b];
        
        
        
        MyNewXmlMolde *kstitle=[self.myArray objectAtIndex:0];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 220, 30)];
        label.text = [NSString stringWithFormat:@"%@ %@",kstitle.xCarrierFullName,kstitle.xFlightNo];
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        [label release];

        
    
    NSLog(@" %d",[self.myArray count]);
    
    

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    
    UIButton * btnb_bxo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnb_bxo.frame = CGRectMake(0, 0, 35, 25);
    [btnb_bxo setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnb_bxo addTarget:self action:@selector(btnb_bxoFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkqbtn_ifo = [[[UIBarButtonItem alloc] initWithCustomView:btnb_bxo] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkqbtn_ifo;
    
           
        
        scrollView_ = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320,rect.size.height-220)];
        scrollView_.backgroundColor=[UIColor whiteColor];
        
        scrollView_.backgroundColor=[UIColor whiteColor];
        [scrollView_ setContentSize:CGSizeMake(320 * [myArray count]-320, 240)];
        [scrollView_ setPagingEnabled:YES];
        [scrollView_ setShowsVerticalScrollIndicator:NO];
        [scrollView_ setShowsHorizontalScrollIndicator:YES];
        scrollView_.tag=101;
        [scrollView_ setDelegate:self];
        
        [scrollView_ setIndicatorStyle:UIScrollViewIndicatorStyleDefault];

      NSLog(@"jiageArray  %@",self.myArray);

    for (int i =1; i<[myArray count]; i++)
        
    {
            self.jiageArray = [self.myArray objectAtIndex:i];
        
       
            
            myNewsIt = [self.jiageArray objectAtIndex:0];
        
        NSLog(@"myNewsIt  %@",myNewsIt.ccName);
            
            UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(i*190+190+i*130-320 , 0, 120, 50);
            button.tag = i;
            [button setImage:[UIImage imageNamed:@"预订.png"] forState:UIControlStateNormal];
            [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
            [scrollView_ addSubview:button];
            
            
            La_ble = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90-320, 20, 80, 30)];
            La_ble.backgroundColor = [UIColor clearColor];
            La_ble.font = [UIFont fontWithName:@"Arial" size:30];
            La_ble.textAlignment = NSTextAlignmentCenter;
            La_ble.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            La_ble.text = [NSString stringWithFormat:@"%@ 舱",myNewsIt.ccName];
            [scrollView_ addSubview:La_ble];
        
        
        la3 = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90+80-320, 20, 100, 30)];
        la3.backgroundColor= [UIColor clearColor];
        la3.textAlignment=NSTextAlignmentCenter;
        la3.textColor =[UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
        
        
        [scrollView_ addSubview:la3];
        
        
        
        
        if ([myNewsIt.ccTicketStatus isEqualToString:@"A"]) {
            
            
            
            la3.text = [NSString stringWithFormat:@"充足"];
            
            
            
        }
        else if([myNewsIt.ccTicketStatus isEqualToString:@"0"]||[myNewsIt.ccTicketStatus isEqualToString:@"1"]||[myNewsIt.ccTicketStatus isEqualToString:@"2"]||[myNewsIt.ccTicketStatus isEqualToString:@"3"]||[myNewsIt.ccTicketStatus isEqualToString:@"4"]||[myNewsIt.ccTicketStatus isEqualToString:@"5"]||[myNewsIt.ccTicketStatus isEqualToString:@"6"]||[myNewsIt.ccTicketStatus isEqualToString:@"7"]||[myNewsIt.ccTicketStatus isEqualToString:@"8"]||[myNewsIt.ccTicketStatus isEqualToString:@"9"]){
            
            la3.text = [NSString stringWithFormat:@"%@ 张",myNewsIt.ccTicketStatus];
            
        }else  if ([myNewsIt.ccTicketStatus isEqualToString:@"L"] || [myNewsIt.ccTicketStatus isEqualToString:@"C"] || [myNewsIt.ccTicketStatus isEqualToString:@"S"]|| [myNewsIt.ccTicketStatus isEqualToString:@"X"] || [myNewsIt.ccTicketStatus isEqualToString:@"R"] || [myNewsIt.ccTicketStatus isEqualToString:@"Z"] || [myNewsIt.ccTicketStatus isEqualToString:@"Q"]){
            
            
            
            la3.text = [NSString stringWithFormat:@"暂无"];
            
            
        }

        
        UIImageView *imguy = [[UIImageView alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 52, 300, 5)];
        imguy.image=[UIImage imageNamed:@"虚线.png"];
        [scrollView_ addSubview:imguy];
        [imguy release];
            
            int mSinglePrice = [myNewsIt.ccSinglePrice intValue];
            int mTax = [myNewsIt.ccTax intValue];
            int mFuel = [myNewsIt.ccFuel intValue];
            int newPrice = mSinglePrice + mTax + mFuel;
            myNewPrice = [NSString stringWithFormat:@"%d",newPrice];
            
            Lb_ale = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90-320, 80, 80, 30)];
            Lb_ale.backgroundColor = [UIColor clearColor];
            Lb_ale.font = [UIFont fontWithName:@"Arial" size:20];
            Lb_ale.textAlignment = NSTextAlignmentCenter;
            Lb_ale.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            Lb_ale.text = [NSString stringWithFormat:@"￥ %@",myNewPrice];
            [scrollView_ addSubview:Lb_ale];
            
            
            
            
            
            _la_ble=[[UILabel alloc]initWithFrame:CGRectMake(i*260+100+i*60-320, 60, 60, 25)];
            _la_ble.backgroundColor=[UIColor clearColor];
            _la_ble.font=[UIFont fontWithName:@"Arial" size:13];
            _la_ble.textAlignment=NSTextAlignmentRight;
            _la_ble.textColor=[UIColor blackColor];
            _la_ble.text=@"价        格:";
            [scrollView_ addSubview:_la_ble];
            
            _la_bel=[[UILabel alloc]initWithFrame:CGRectMake(i*260+100+i*60-320, 85, 60, 25)];
            _la_bel.backgroundColor=[UIColor clearColor];
            _la_bel.font=[UIFont fontWithName:@"Arial" size:13];
            _la_bel.textAlignment=NSTextAlignmentLeft;
            _la_bel.textColor=[UIColor blackColor];
            _la_bel.text=@"机建/燃油:";
            [scrollView_ addSubview:_la_bel];
        
        UIImageView *imguw = [[UIImageView alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 112, 300, 5)];
        imguw.image=[UIImage imageNamed:@"虚线.png"];
        [scrollView_ addSubview:imguw];
        [imguw release];
            
            
            _lable=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 60, 120, 25)];
            _lable.backgroundColor=[UIColor clearColor];
            _lable.font=[UIFont fontWithName:@"Arial" size:12];
            _lable.textAlignment=NSTextAlignmentLeft;
            _lable.numberOfLines= 0;
            _lable.textColor=[UIColor blackColor];
            _lable.text = [NSString stringWithFormat:@"￥%@ (%@折)",myNewsIt.ccSinglePrice,myNewsIt.ccDiscount];
            [scrollView_ addSubview:_lable];
            
            _lab=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 85, 120, 25)];
            _lab.backgroundColor=[UIColor clearColor];
            _lab.font=[UIFont fontWithName:@"Arial" size:12];
            _lab.textAlignment=NSTextAlignmentLeft;
            _lab.numberOfLines= 0;
            _lab.textColor=[UIColor blackColor];
            _lab.text = [NSString stringWithFormat:@"￥%@  /  ￥%@",myNewsIt.ccTax,myNewsIt.ccFuel];
            [scrollView_ addSubview:_lab];
        
        UIImageView *imgue = [[UIImageView alloc]initWithFrame:CGRectMake(i*170+165+i*150+120-320, 70, 30, 31)];
        imgue.image=[UIImage imageNamed:@"箭头.png"];
        [scrollView_ addSubview:imgue];
        [imgue release];

            
            _la=[[UILabel alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 170, 80, 30)];
            _la.backgroundColor=[UIColor clearColor];
            _la.text=@"退改签:";
            _la.textAlignment=NSTextAlignmentCenter;
            _la.textColor=[UIColor grayColor];
            [scrollView_ addSubview:_la];
            
            _lb=[[UILabel alloc]initWithFrame:CGRectMake(i*105+100+i*215-320, 120,215 , 110)];
            _lb.backgroundColor=[UIColor clearColor];
            _lb.font=[UIFont fontWithName:@"Arial" size:12];
            _lb.textAlignment=NSTextAlignmentLeft;
            _lb.numberOfLines= 0;
            _lb.textColor=[UIColor blackColor];
            _lb.text = [NSString stringWithFormat:@"%@",myNewsIt.ccEi];
            [scrollView_ addSubview:_lb];
            


            
        }
    
    [self.view addSubview:scrollView_];
    
    [pageControl_ setNumberOfPages:[myArray count]];
    [pageControl_ addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:pageControl_];
    
}
-(void)buttonClick:(UIButton*)button
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * mResurl = [defaults objectForKey:@"result"];
    NSString * mUser = [defaults objectForKey:@"user_Id"];
    
    
    NSLog(@"mResurl is  %@",mResurl);
    NSLog(@"mUser_ID  is %@",mUser);
    
    if ([mResurl isEqualToString:@"SUCCEED"]) {
        
        NSMutableArray * yy = [[NSMutableArray alloc] initWithCapacity:0];
        yy = [self.myArray objectAtIndex:button.tag];
        danYud = [yy objectAtIndex:0];
        NSLog(@"yy %d",[yy count]);
        NSLog(@"yy %@",yy);
        MyNewXmlMolde * wya = [self.myArray objectAtIndex:0];
        NSLog(@"(()()()%@",danYud.ccName);
        
       // NewsIteme * dingDan = [myArray objectAtIndex:button.tag];
       Sched_NHViewController * snh = [[[Sched_NHViewController alloc] initWithOneItem:wya withTwoItem:self.berDingItem withArray:yy withthree:ya] autorelease];
        
        UINavigationController * anv = [[[UINavigationController alloc] initWithRootViewController:snh] autorelease];
        
        snh.chufaming = self.chufaMing;
        snh.didaming = self.didaMing;
        snh.ssr = mUser;
        snh.ssm3 = self.cszima;
        snh.ssm4 = self.cszima2;
        
        
        snh.yy_danQiFei = self.y_danQiFei;
        snh.yy_danDiDa = self.y_danDiDa;
        snh.yy_danQiFeiTime = self.y_danQiFeiTime;
        snh.yy_danDiDaTime = self.y_danDiDaTime;
        snh.yy_danCangWei = self.y_danCangWei;
        snh.yy_danJiaGe = self.y_danJiaGe;
        snh.yy_danZheKou = self.y_danZheKou;
        snh.yy_danJiJian = self.y_danJiJian;
        snh.yy_danRanYou = self.y_danRanYou;
        snh.yy_danTuiGaiQian = self.y_danTuiGaiQian;
        snh.yy_danHangBanHao = self.y_danHangBanHao;
        snh.yy_danjixing = self.y_danjixing;
        
        
        snh.wangQiTime = lable2_i.text;
        snh.wangDiTime = lable3_y.text;
        snh.wangJiaGe = self.danYud.ccSinglePrice;
        snh.wangZheKou = self.danYud.ccDiscount;
        snh.wangJiJian = self.danYud.ccTax;
        snh.wangRanYou = self.danYud.ccFuel;
        snh.wangTuiGaiQian = self.danYud.ccEi;
        snh.wangJiXing = yy_l.text;
        snh.wangCangWei = self.danYud.ccName;
        
        
        NSLog(@"基础价格 %@",self.danYud.ccSinglePrice);
        
        anv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:anv animated:YES completion:NULL];
    }
    
    
   else if ([self.ccString isEqualToString:@"SUCCEED"]) {
       
       
       NSMutableArray * yy = [[NSMutableArray alloc] initWithCapacity:0];
       yy = [self.myArray objectAtIndex:button.tag];
      danYud = [yy objectAtIndex:0];
       
       NSLog(@"(()()()%@",danYud.ccName);

       
       Sched_NHViewController * snh = [[[Sched_NHViewController alloc] initWithOneItem:self.berDingItem withTwoItem:danYud withArray:yy withthree:ya] autorelease];
        UINavigationController * anv = [[[UINavigationController alloc] initWithRootViewController:snh] autorelease];
        
        snh.chufaming = self.chufaMing;
        snh.didaming = self.didaMing;
        snh.ssr = self.aString;
       snh.ssm3 = self.cszima;
       snh.ssm4 = self.cszima2;
       
       snh.yy_danQiFei = self.y_danQiFei;
       snh.yy_danDiDa = self.y_danDiDa;
       snh.yy_danQiFeiTime = self.y_danQiFeiTime;
       snh.yy_danDiDaTime = self.y_danDiDaTime;
       snh.yy_danCangWei = self.y_danCangWei;
       snh.yy_danJiaGe = self.y_danJiaGe;
       snh.yy_danZheKou = self.y_danZheKou;
       snh.yy_danJiJian = self.y_danJiJian;
       snh.yy_danRanYou = self.y_danRanYou;
       snh.yy_danTuiGaiQian = self.y_danTuiGaiQian;
       snh.yy_danHangBanHao = self.y_danHangBanHao;
       snh.yy_danjixing = self.y_danjixing;
       
       snh.wangQiTime = lable2_i.text;
       snh.wangDiTime = lable3_y.text;
       snh.wangJiaGe = self.danYud.ccSinglePrice;
       snh.wangZheKou = self.danYud.ccDiscount;
       snh.wangJiJian = self.danYud.ccTax;
       snh.wangRanYou = self.danYud.ccFuel;
       snh.wangTuiGaiQian = self.danYud.ccEi;
       snh.wangJiXing = yy_l.text;
       snh.wangCangWei = self.danYud.ccName;
       
       NSLog(@"基础价格 %@",self.danYud.ccSinglePrice);

       
        anv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:anv animated:YES completion:NULL];

    }
    else{
        
        _DengLuViewController * dvc = [[[_DengLuViewController alloc]init]autorelease];
        dvc.delegate=self;
        UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:dvc]autorelease];
        dvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }
   

}

-(void)stringWith:(NSString *)string With:(NSString *)User_ID WithArray:(NSMutableArray *)ary
{
    self.ccString = [NSString stringWithFormat:@"%@",string];
    self.aString = [NSString stringWithFormat:@"%@",User_ID];
    self.deleArray=[NSMutableArray arrayWithArray:ary];
}

-(void)btnb_bxoFanHui:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
