//
//  BerthViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "BerthViewController.h"
#import "ChecheViewController.h"
#import "ScheduledViewController.h"
#import "DengLuViewController.h"
#import "DengLuXML.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"






@interface BerthViewController ()

@end

@implementation BerthViewController


@synthesize hbh;
@synthesize myArray,timeStr1,timeStr2,chufaMing,didaMing;
@synthesize myNewSinglePrice;
@synthesize myNewsIt;
@synthesize danYud;
@synthesize denglu;
@synthesize aString,ccString;
@synthesize deleArray;
@synthesize jiageArray;
@synthesize csszm,csszm2;






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithArray:(NSMutableArray *)arry
{
    if (self = [super init]) {
        self.myArray = [NSMutableArray arrayWithArray:arry];
        
       
        
    }
    return self;
}



-(void)dealloc
{

    
    [_scrollView release];
    
    [lable release];
    [lable1 release];
    [lable4 release];
    [lable5 release];
    [lable6 release];
    [lable7 release];
    [imageView release];
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
    [deleArray release];
    
    
    [super dealloc];
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

    deleArray = [[NSMutableArray alloc] initWithCapacity:0];
    
           CGRect rect=self.view.bounds;

    
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320,rect.size.height-200)];
        
        imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,150)];
        [imageView setImage:[UIImage imageNamed:@"机票城市对信息背景.png"]];
        [self.view addSubview:imageView];
        
        UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(148, 35, 31, 27)];
        img.image = [UIImage imageNamed:@"18.png"];
        [imageView addSubview:img];
        [img release];
    
   
        
    
        lable=[[UILabel alloc]initWithFrame:CGRectMake(0, 30, 120, 40)];
        lable.backgroundColor=[UIColor clearColor];
        lable.text=[NSString stringWithFormat:@"%@",self.chufaMing];
        lable.textColor=[UIColor blackColor];
        lable.textAlignment=NSTextAlignmentCenter;
        lable.font=[UIFont fontWithName:@"Arial" size:20];
        [self.view addSubview:lable];
        
        lable1=[[UILabel alloc]initWithFrame:CGRectMake(200, 30, 120, 40)];
        lable1.backgroundColor=[UIColor clearColor];
        lable1.text=[NSString stringWithFormat:@"%@",self.didaMing];
        lable1.textColor=[UIColor blackColor];
        lable1.textAlignment=NSTextAlignmentCenter;
        lable1.font=[UIFont fontWithName:@"Arial" size:20];
        [self.view addSubview:lable1];
    
        
        
        lable4=[[UILabel alloc]initWithFrame:CGRectMake(0, 100, 120, 20)];
        lable4.backgroundColor=[UIColor clearColor];
        lable4.text=[NSString stringWithFormat:@"起飞时间:%@",timeStr1];
        lable4.textColor=[UIColor blackColor];
        lable4.textAlignment=NSTextAlignmentCenter;
        lable4.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable4];

    
        
        lable5=[[UILabel alloc]initWithFrame:CGRectMake(200, 100, 120, 20)];
        lable5.backgroundColor=[UIColor clearColor];
        lable5.text=[NSString stringWithFormat:@"抵达时间:%@",timeStr2];
        lable5.textColor=[UIColor blackColor];
        lable5.textAlignment=NSTextAlignmentCenter;
        lable5.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable5];
    
        
        MyNewXmlMolde * mmdate = [myArray objectAtIndex:0];
    
    
    yy_l = [[UILabel alloc]initWithFrame:CGRectMake(148, 65, 31, 30)];
    yy_l.backgroundColor = [UIColor clearColor];
    yy_l.text = [NSString stringWithFormat:@"%@",mmdate.xAircraft];
    yy_l.textColor = [UIColor blackColor];
    yy_l.textAlignment = NSTextAlignmentCenter;
    yy_l.font = [UIFont fontWithName:@"Arial" size:12];
    [self.view addSubview:yy_l];
        
        lable6=[[UILabel alloc]initWithFrame:CGRectMake(0, 125, 120, 20)];
        lable6.backgroundColor=[UIColor clearColor];
        lable6.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable6.textColor=[UIColor blackColor];
        lable6.textAlignment=NSTextAlignmentCenter;
        lable6.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable6];
        
        lable7=[[UILabel alloc]initWithFrame:CGRectMake(200, 125, 120, 20)];
        lable7.backgroundColor=[UIColor clearColor];
        lable7.text=[NSString stringWithFormat:@"%@",mmdate.xFlightDate];
        lable7.textColor=[UIColor blackColor];
        lable7.textAlignment=NSTextAlignmentCenter;
        lable7.font=[UIFont fontWithName:@"Arial" size:15];
        [self.view addSubview:lable7];
        
        MyNewXmlMolde *kstitle=[myArray objectAtIndex:0];
        
        UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(50, 0, 220, 30)];
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
    
    UIButton * btnb = [UIButton buttonWithType:UIButtonTypeCustom];
    btnb.frame = CGRectMake(0, 0, 35, 25);
    [btnb setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnb addTarget:self action:@selector(btnbFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkqbtn = [[[UIBarButtonItem alloc] initWithCustomView:btnb] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkqbtn;
    
        
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 150, 320,rect.size.height-220)];
        _scrollView.backgroundColor=[UIColor whiteColor];
        [_scrollView setContentSize:CGSizeMake(320 * [myArray count]-320, 240)];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setShowsVerticalScrollIndicator:NO];
        [_scrollView setShowsHorizontalScrollIndicator:YES];
        _scrollView.tag=101;
        [_scrollView setDelegate:self];
        
        [_scrollView setIndicatorStyle:UIScrollViewIndicatorStyleDefault];
    

   

    for (int i =1; i<[self.myArray count]; i++)
        
    {
        
        
        jiageArray = [self.myArray objectAtIndex:i];
        
        myNewsIt = [self.jiageArray objectAtIndex:0];
        
      
        
            
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i*190+190+i*130-320 , 0, 120, 50);
        button.tag = 0 + i;
        [button setImage:[UIImage imageNamed:@"预订.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            
        [_scrollView addSubview:button];
            
        
        La_ble = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90-320, 20, 80, 30)];
        La_ble.backgroundColor = [UIColor clearColor];
        La_ble.font = [UIFont fontWithName:@"Arial" size:30];
        La_ble.textAlignment = NSTextAlignmentCenter;
        La_ble.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
        La_ble.text = [NSString stringWithFormat:@"%@ 舱",myNewsIt.ccName];
        [_scrollView addSubview:La_ble];
        
        
        
        
               
        la3 = [[UILabel alloc] initWithFrame:CGRectMake(i*230+10+i*90+80-320, 20, 100, 30)];
        la3.backgroundColor= [UIColor clearColor];
        la3.textAlignment=NSTextAlignmentCenter;
        la3.textColor =[UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
       
        
        [_scrollView addSubview:la3];
        
        
        
        
                if ([myNewsIt.ccTicketStatus isEqualToString:@"A"]) {
        
                
                    
                    la3.text = [NSString stringWithFormat:@"充足"];
                    
                   
        
                }
                else if([myNewsIt.ccTicketStatus isEqualToString:@"0"]||[myNewsIt.ccTicketStatus isEqualToString:@"1"]||[myNewsIt.ccTicketStatus isEqualToString:@"2"]||[myNewsIt.ccTicketStatus isEqualToString:@"3"]||[myNewsIt.ccTicketStatus isEqualToString:@"4"]||[myNewsIt.ccTicketStatus isEqualToString:@"5"]||[myNewsIt.ccTicketStatus isEqualToString:@"6"]||[myNewsIt.ccTicketStatus isEqualToString:@"7"]||[myNewsIt.ccTicketStatus isEqualToString:@"8"]||[myNewsIt.ccTicketStatus isEqualToString:@"9"]){
                   
                    la3.text = [NSString stringWithFormat:@"%@ 张",myNewsIt.ccTicketStatus];
        
                }
 

        
        UIImageView *imguy = [[UIImageView alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 52, 300, 5)];
        imguy.image=[UIImage imageNamed:@"虚线.png"];
        [_scrollView addSubview:imguy];
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
        [_scrollView addSubview:Lb_ale];
            
            
            
            
            
        _la_ble=[[UILabel alloc]initWithFrame:CGRectMake(i*260+100+i*60-320, 60, 60, 25)];
        _la_ble.backgroundColor=[UIColor clearColor];
        _la_ble.font=[UIFont fontWithName:@"Arial" size:13];
        _la_ble.textAlignment=NSTextAlignmentRight;
        _la_ble.textColor=[UIColor blackColor];
        _la_ble.text=@"价        格:";
        [_scrollView addSubview:_la_ble];
            
        _la_bel=[[UILabel alloc]initWithFrame:CGRectMake(i*260+100+i*60-320, 85, 60, 25)];
        _la_bel.backgroundColor=[UIColor clearColor];
        _la_bel.font=[UIFont fontWithName:@"Arial" size:13];
        _la_bel.textAlignment=NSTextAlignmentLeft;
        _la_bel.textColor=[UIColor blackColor];
        _la_bel.text=@"机建/燃油:";
        [_scrollView addSubview:_la_bel];
        
        UIImageView *imguw = [[UIImageView alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 112, 300, 5)];
        imguw.image=[UIImage imageNamed:@"虚线.png"];
        [_scrollView addSubview:imguw];
        [imguw release];
            
            
        _lable=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 60, 70, 25)];
        _lable.backgroundColor=[UIColor clearColor];
        _lable.font=[UIFont fontWithName:@"Arial" size:12];
        _lable.textAlignment=NSTextAlignmentLeft;
        _lable.numberOfLines= 0;
        _lable.textColor=[UIColor blackColor];
        _lable.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccSinglePrice];
        [_scrollView addSubview:_lable];
        
        yy_lable=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320+70, 60, 70, 25)];
        yy_lable.backgroundColor=[UIColor clearColor];
        yy_lable.font=[UIFont fontWithName:@"Arial" size:12];
        yy_lable.textAlignment=NSTextAlignmentLeft;
        yy_lable.numberOfLines= 0;
        yy_lable.textColor=[UIColor blackColor];
        yy_lable.text = [NSString stringWithFormat:@"%@折",myNewsIt.ccDiscount];
        [_scrollView addSubview:yy_lable];

        
   
            
        _lab=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320, 85, 60, 25)];
        _lab.backgroundColor=[UIColor clearColor];
        _lab.font=[UIFont fontWithName:@"Arial" size:12];
        _lab.textAlignment=NSTextAlignmentLeft;
        _lab.numberOfLines= 0;
        _lab.textColor=[UIColor blackColor];
        _lab.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccTax];
        [_scrollView addSubview:_lab];
        
        yy_lab=[[UILabel alloc]initWithFrame:CGRectMake(i*170+165+i*150-320+60, 85, 60, 25)];
        yy_lab.backgroundColor=[UIColor clearColor];
        yy_lab.font=[UIFont fontWithName:@"Arial" size:12];
        yy_lab.textAlignment=NSTextAlignmentLeft;
        yy_lab.numberOfLines= 0;
        yy_lab.textColor=[UIColor blackColor];
        yy_lab.text = [NSString stringWithFormat:@"￥%@",myNewsIt.ccFuel];
        [_scrollView addSubview:yy_lab];

        
        
        UIImageView *imgue = [[UIImageView alloc]initWithFrame:CGRectMake(i*170+165+i*150+120-320, 70, 30, 31)];
        imgue.image=[UIImage imageNamed:@"箭头.png"];
        [_scrollView addSubview:imgue];
        [imgue release];
            
        _la=[[UILabel alloc]initWithFrame:CGRectMake(i*220+10+i*100-320, 170, 80, 30)];
        _la.backgroundColor=[UIColor clearColor];
        _la.text=@"退改签:";
        _la.textAlignment=NSTextAlignmentCenter;
        _la.textColor=[UIColor grayColor];
        [_scrollView addSubview:_la];
            
        _lb=[[UILabel alloc]initWithFrame:CGRectMake(i*105+100+i*215-320, 120,215 , 110)];
        _lb.backgroundColor=[UIColor clearColor];
        _lb.font=[UIFont fontWithName:@"Arial" size:12];
        _lb.textAlignment=NSTextAlignmentLeft;
        _lb.numberOfLines= 0;
        _lb.textColor=[UIColor blackColor];
        _lb.text = [NSString stringWithFormat:@"%@",myNewsIt.ccEi];
        [_scrollView addSubview:_lb];
            
       
         
    }
    [self.view addSubview:_scrollView];

    
    [_pageControl setNumberOfPages:[myArray count]];
    [_pageControl addTarget:self action:@selector(changePage:) forControlEvents:UIControlEventValueChanged];
   

    [self.view addSubview:_pageControl];

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
  
        NSLog(@"(()()()%@",danYud.ccName);
        ScheduledViewController *Sche_View=[[[ScheduledViewController alloc]initWithOneItem:danYud WithArray:self.deleArray withtwoArray:self.myArray] autorelease];
        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:Sche_View ]autorelease];
        Sche_View.chufaming = self.chufaMing;
        Sche_View.didaming = self.didaMing;
        Sche_View.y_sto = danYud.ccName;
        Sche_View.cssanzm = csszm;
        Sche_View.cssanzm2 = csszm2;
        Sche_View.ssr = mUser;
        
        //新传值的
        Sche_View.yy_ZheKou =  danYud.ccDiscount;
        Sche_View.yy_Qi = self.timeStr1;
        Sche_View.yy_Di = self.timeStr2;
        Sche_View.yy_Jia = danYud.ccSinglePrice ;
        Sche_View.yy_Ji = danYud.ccTax;
        Sche_View.yy_Ran = danYud.ccFuel;
        Sche_View.yy_Tui =  danYud.ccEi;
        Sche_View.jixing = yy_l.text;
        
        NSLog(@"1111111111111111111基础价格 %@",danYud.ccSinglePrice);
      
        
        
        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
    }
    
    
   else if ([self.ccString isEqualToString:@"SUCCEED"]) {
       
       NSMutableArray *yy = [[NSMutableArray alloc]initWithCapacity:0];
        yy = [self.myArray objectAtIndex:button.tag];
       danYud = [yy objectAtIndex:0];

        ScheduledViewController *Sche_View=[[[ScheduledViewController alloc]initWithOneItem:danYud WithArray:self.deleArray withtwoArray:self.myArray] autorelease];
        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:Sche_View ]autorelease];
       Sche_View.chufaming = self.chufaMing;
       Sche_View.didaming = self.didaMing;
       Sche_View.y_stp = danYud.ccName;
       Sche_View.cssanzm = csszm;
       Sche_View.cssanzm2 = csszm2;
       Sche_View.ssr = self.aString;
      
       
       Sche_View.yy_ZheKou =  yy_lable.text;
       Sche_View.yy_Qi = self.timeStr1;
       Sche_View.yy_Di = self.timeStr2;
       Sche_View.yy_Jia = _lable.text;
       Sche_View.yy_Ji = _lab.text;
       Sche_View.yy_Ran = yy_lab.text;
       Sche_View.yy_Tui =  _lb.text;
       Sche_View.jixing = yy_l.text;
       
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
    }
    else  {
        
        DengLuViewController * dvc = [[[DengLuViewController alloc]init]autorelease];
        dvc.delegate=self;
        UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:dvc] autorelease];
        dvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }
    
    
}

-(void)stringWith:(NSString *)string With:(NSString *)User_ID WithArray:(NSMutableArray *)ary
{
    self.ccString = [NSString stringWithFormat:@"%@",string];
    NSLog(@"bbbbbbbbbbbb %@",string);
    
    self.aString = [NSString stringWithFormat:@"%@",User_ID];
    NSLog(@"nnnnnnnnnnn %@",User_ID);
    
    self.deleArray = [NSMutableArray arrayWithArray:ary];
    NSLog(@"mmmmmmmmmmm %@",ary);
}
-(void)btnbFanHui:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
