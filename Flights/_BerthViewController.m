//
//  _BerthViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "_BerthViewController.h"
#import "chewangViewController.h"
#import "_ScheduledViewController.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"

@interface _BerthViewController ()

@end

@implementation _BerthViewController

@synthesize myerzim;
@synthesize lov;
@synthesize ssi;
@synthesize qiFeish,diDash,cszima2,cszima,myArray;
@synthesize myNewsIt,myNewPrice,timeStr1,timeStr2;
@synthesize chufaMing,didaMing;
@synthesize jiageArray;
@synthesize myNewSinglePrice;
@synthesize dingDan;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithArray:(NSMutableArray *)array
{
    if (self = [super init]) {
        self.myArray = [NSMutableArray arrayWithArray:array];
        
    }
    return self;
}
-(void)dealloc
{
    [super dealloc];
    
   
    [lable_qw release];
    [lable1_po release];
    [lable2_iu release];
    [lable3_yt release];
    [lable4_kl release];
    [lable5_bn release];
    
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
    [myArray release];
    [myNewPrice release];
  //  [myNewsIt release];
    

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
  
        CGRect rect=self.view.bounds;
    NSLog(@"33333333 %@",myerzim);
        
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
        lable_qw.text=[NSString stringWithFormat:@"%@",self.chufaMing];
        lable_qw.textColor=[UIColor blackColor];
        lable_qw.textAlignment=NSTextAlignmentCenter;
        lable_qw.font=[UIFont fontWithName:@"Arial" size:17];
        [self.view addSubview:lable_qw];
        
        lable1_po=[[UILabel alloc]initWithFrame:CGRectMake(200, 30, 120, 40)];
        lable1_po.backgroundColor=[UIColor clearColor];
        lable1_po.text=[NSString stringWithFormat:@"%@",self.didaMing];
        lable1_po.textColor=[UIColor blackColor];
        lable1_po.textAlignment=NSTextAlignmentCenter;
        lable1_po.font=[UIFont fontWithName:@"Arial" size:17];
        [self.view addSubview:lable1_po];
        
        
        
        

    
        lable2_iu=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        lable2_iu.backgroundColor=[UIColor clearColor];
        lable2_iu.text=[NSString stringWithFormat:@"起飞时间：%@",timeStr1];
        lable2_iu.textColor=[UIColor blackColor];
        lable2_iu.textAlignment=NSTextAlignmentCenter;
        lable2_iu.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable2_iu];
        
    
        
        lable3_yt=[[UILabel alloc]initWithFrame:CGRectMake(200, 100, 120, 20)];
        lable3_yt.backgroundColor=[UIColor clearColor];
        lable3_yt.text=[NSString stringWithFormat:@"抵达时间：%@",timeStr2];
        lable3_yt.textColor=[UIColor blackColor];
        lable3_yt.textAlignment=NSTextAlignmentCenter;
        lable3_yt.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable3_yt];
        
        
        MyNewXmlMolde * mmdate = [myArray objectAtIndex:0];
    
    yy_l = [[UILabel alloc]initWithFrame:CGRectMake(148, 65, 31, 30)];
    yy_l.backgroundColor = [UIColor clearColor];
    yy_l.text = [NSString stringWithFormat:@"%@",mmdate.xAircraft];
    yy_l.textColor = [UIColor blackColor];
    yy_l.textAlignment = NSTextAlignmentCenter;
    yy_l.font = [UIFont fontWithName:@"Arial" size:12];
    [self.view addSubview:yy_l];
    
        
        lable4_kl=[[UILabel alloc]initWithFrame:CGRectMake(0, 125, 120, 20)];
        lable4_kl.backgroundColor=[UIColor clearColor];
        lable4_kl.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable4_kl.textColor=[UIColor blackColor];
        lable4_kl.textAlignment=NSTextAlignmentCenter;
        lable4_kl.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable4_kl];
        
        lable5_bn=[[UILabel alloc]initWithFrame:CGRectMake(200, 125, 120, 20)];
        lable5_bn.backgroundColor=[UIColor clearColor];
        lable5_bn.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable5_bn.textColor=[UIColor blackColor];
        lable5_bn.textAlignment=NSTextAlignmentCenter;
        lable5_bn.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable5_bn];
        
        
        MyNewXmlMolde *kstitle=[myArray objectAtIndex:0];
        
        label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 220, 30)];
        label.text = [NSString stringWithFormat:@"%@ %@",kstitle.xCarrierFullName,kstitle.xFlightNo];
    

        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor blackColor];
        label.backgroundColor = [UIColor clearColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:label];
        [label release];
 
   
    NSLog(@"接收数组的长度 %d",[self.myArray count]);



 
    
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
    

    
    for (int i =1; i<[self.myArray count]; i++)
        
    {
        
        jiageArray = [self.myArray objectAtIndex:i];
        NSLog(@"%@",self.myArray);
        
        myNewsIt = [self.jiageArray objectAtIndex:0];
        
//            myNewsIteme = [self.myArray objectAtIndex:i];
        
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
            int newSinglePrice = mSinglePrice + mTax + mFuel;
            myNewSinglePrice = [NSString stringWithFormat:@"%d",newSinglePrice];
            
            Lb_ale = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90-320, 80, 80, 30)];
            Lb_ale.backgroundColor = [UIColor clearColor];
            Lb_ale.font = [UIFont fontWithName:@"Arial" size:20];
            Lb_ale.textAlignment = NSTextAlignmentCenter;
            Lb_ale.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            Lb_ale.text = [NSString stringWithFormat:@"￥ %@",myNewSinglePrice];
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
        
        
        UIImageView *imgue = [[UIImageView alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 112, 300, 5)];
        imgue.image=[UIImage imageNamed:@"虚线.png"];
        [scrollView_ addSubview:imgue];
        [imgue release];
        
            _lable=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 60, 120, 25)];
            _lable.backgroundColor=[UIColor clearColor];
            _lable.font=[UIFont fontWithName:@"Arial" size:12];
            _lable.textAlignment=NSTextAlignmentLeft;
            _lable.numberOfLines= 0;
            _lable.textColor=[UIColor blackColor];
            _lable.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccSinglePrice];
            [scrollView_ addSubview:_lable];
        
         
        
        yy_lable=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320+70, 60, 70, 25)];
        yy_lable.backgroundColor=[UIColor clearColor];
        yy_lable.font=[UIFont fontWithName:@"Arial" size:12];
        yy_lable.textAlignment=NSTextAlignmentLeft;
        yy_lable.numberOfLines= 0;
        yy_lable.textColor=[UIColor blackColor];
        yy_lable.text = [NSString stringWithFormat:@"%@折",myNewsIt.ccDiscount];
        [scrollView_ addSubview:yy_lable];
            
            _lab=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 85, 120, 25)];
            _lab.backgroundColor=[UIColor clearColor];
            _lab.font=[UIFont fontWithName:@"Arial" size:12];
            _lab.textAlignment=NSTextAlignmentLeft;
            _lab.numberOfLines= 0;
            _lab.textColor=[UIColor blackColor];
            _lab.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccTax];
        [scrollView_ addSubview:_lab];
        
        
        yy_lab=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320+60, 85, 60, 25)];
        yy_lab.backgroundColor=[UIColor clearColor];
        yy_lab.font=[UIFont fontWithName:@"Arial" size:12];
        yy_lab.textAlignment=NSTextAlignmentLeft;
        yy_lab.numberOfLines= 0;
        yy_lab.textColor=[UIColor blackColor];
        yy_lab.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccFuel];
        [scrollView_ addSubview:yy_lab];

        
        
        
        UIImageView *imguw = [[UIImageView alloc]initWithFrame:CGRectMake(i*170+165+i*150+120-320, 70, 30, 31)];
        imguw.image=[UIImage imageNamed:@"箭头.png"];
        [scrollView_ addSubview:imguw];
        [imguw release];
            
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
    
  //  NewsIteme * dingDan = [myArray objectAtIndex:button.tag];
    
    NSMutableArray * yy = [[NSMutableArray alloc] initWithCapacity:0];
    yy = [self.myArray objectAtIndex:button.tag];
    MyNewXmlMolde * ya = [[MyNewXmlMolde alloc] init];
    ya = [self.myArray objectAtIndex:0];
    NSLog(@"xxxxxx  %@",ya.xFlightDate);
  //  MyNewXmlMolde * myy = [yy objectAtIndex:0];
    dingDan = [yy objectAtIndex:0];
    
    NSLog(@"(()()()%@",dingDan.ccName);
    NSLog(@"jjjj  %@",dingDan.ccSinglePrice);
    NSLog(@" 3333333 6666666 %@",dingDan.xCarrier);
    
    _ScheduledViewController *Sche_View=[[[_ScheduledViewController alloc]initWithNewItem:dingDan withTwoItem:ya] autorelease];
    UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:Sche_View ]autorelease];
    Sche_View.str1 = self.timeStr1;//
    Sche_View.str2 = self.timeStr2;//
    Sche_View.sanzima = self.cszima;
    Sche_View.sanzima1 = self.cszima2;
    Sche_View.timeQi = self.qiFeish;
    Sche_View.timeDi = self.diDash;
    Sche_View.zongPrice = self.myNewPrice;
    Sche_View.chuFam = self.chufaMing;//
    Sche_View.diDam = self.didaMing;//
    Sche_View.pop= self.lov;
    Sche_View.she = self.ssi;
    Sche_View.helloezm = self.myerzim;
    

    Sche_View.danCangWei = dingDan.ccName;
    Sche_View.danJiaGe = dingDan.ccSinglePrice;
    Sche_View.danZheKou = dingDan.ccDiscount;
    Sche_View.danJiJian = dingDan.ccTax;
    Sche_View.danRanYou = dingDan.ccFuel;
    Sche_View.danTuiGaiQian = dingDan.ccEi;
    Sche_View.danHangBanHao = ya.xFlightNo;
    Sche_View.danjixing = yy_l.text;
    

    
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
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
