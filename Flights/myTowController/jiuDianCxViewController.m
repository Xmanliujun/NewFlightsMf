//
//  jiuDianCxViewController.m
//  jiudian
//
//  Created by XmL on 12-10-16.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "jiuDianCxViewController.h"

#import "RiLiBoViewController.h"
#import "MySliderViewController.h"
#import "ChangChaXunViewController.h"
#import "ZhouBianXunViewController.h"

@interface jiuDianCxViewController ()

@property (retain, nonatomic)  UITextField *cityText;
@property (retain, nonatomic)  UILabel * label;
@property (strong, nonatomic) NSString *areaValue, *cityValue;
@property (retain, nonatomic)  UITextField *riQiText;
@property (retain, nonatomic)  UITextField *zhuDSHText;

@end

@implementation jiuDianCxViewController

@synthesize chengshiming,jiudianming,jiageXing,ruZhuri,zhuJwan,cityText,riQiText,zhuDSHText,label,areaValue = _areaValue,cityValue = _cityValue,fanHui,str1,str2,str3,str,nextDay,mlat,mlog,loctiStart;

@synthesize curRow,curSection,chengshiMing,xingJim,chCJiGe,chCJiGe1,zhJcLi;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) getCurPosition
{
  
    if (locationManager==nil)
    {
       
        locationManager =[[CLLocationManager alloc] init];
    }
    
    
    if ([CLLocationManager locationServicesEnabled])
    {
        locationManager.delegate=self;
        locationManager.desiredAccuracy=kCLLocationAccuracyBest;
        locationManager.distanceFilter=10.0f;
        [locationManager startUpdatingLocation];
    }
}


- (void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation
            fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"kkkkkkkkkknewLocation:%@",[newLocation description]);
   
    curLocation=newLocation.coordinate;
    self.mlat = [NSString stringWithFormat:@"%f",curLocation.latitude];
    self.mlog = [NSString stringWithFormat:@"%f",curLocation.longitude];
   
    
    
}
-(void)leftButon:(UIButton*)btn
{
    if (loctiStart == YES) {
        
      
         [locationManager stopUpdatingLocation];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
        loctiStart = NO;
        
    }else{
        
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    }
    
    

}

-(void)rightButon:(UIButton*)btn
{
    NSLog(@"添加");


}

-(void)chaXun:(UIButton*)btn
{
    if (loctiStart == YES) {
        
     
        [locationManager stopUpdatingLocation];
        
        loctiStart = NO;
        
    }
    
    viewOne.hidden = YES;
     [chaxun setImage:[UIImage imageNamed:@"常规查询-on.png"] forState:UIControlStateNormal];
    [zhoubian setImage:[UIImage imageNamed:@"周边查询1-off.png"] forState:UIControlStateNormal];


    //25dfe70613d826083f89f03556065d477b20c25d 陈
    //9bde3a4bb750ed4f8620c66db73046a3802e72fb 严
    
}

-(void)zhoubian:(UIButton*)btn
{
    
    if (loctiStart == NO) {
      
      
        [self getCurPosition];
        loctiStart = YES;
    }
  
    viewOne.hidden = NO;
     [chaxun setImage:[UIImage imageNamed:@"常规查询-off.png"] forState:UIControlStateNormal];
    [zhoubian setImage:[UIImage imageNamed:@"周边查询1-on.png"] forState:UIControlStateNormal];
   
    
}
-(void)chengshimi:(UIButton*)btn
{

    
    
    detailViewCTwo = [[CityListViewController alloc] initWithNibName:@"CityListViewController" bundle:nil];
    detailViewCTwo.delegate = self;
    detailViewCTwo.curSection =self.curSection;
    detailViewCTwo.curRow = self.curRow;
    detailViewCTwo.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    detailViewCTwo.tag = @"changgui";
    [self presentViewController:detailViewCTwo animated:YES completion:NULL];
    [detailViewCTwo release];


}



-(void)ruZhuriqi:(UIButton*)btn
{
    
    
    RiLiBoViewController * riLiBo = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:riLiBo] autorelease];

    riLiBo.delegate = self;
    riLiBo.tag = @"riLiBo";
    riLiBo.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
 
    
}

-(void)zhuJiwan:(UIButton*)btn
{

    
    
    RiLiBoViewController * riLiBo1 = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:riLiBo1] autorelease];

    riLiBo1.delegate = self;
    riLiBo1.tag = @"riLiBo1";
    riLiBo1.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}

-(void)zhRuzhushi:(UIButton*)button
{
    
    
    RiLiBoViewController * zhRiLi = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:zhRiLi] autorelease];

    zhRiLi.tag = @"zhoubianRuz";
    zhRiLi.delegate = self;
    zhRiLi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}
-(void)zhLiDianSh:(UIButton * )button
{
    
   
    RiLiBoViewController * zhLiDian = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:zhLiDian] autorelease];
    zhLiDian.delegate = self;
    zhLiDian.tag = @"zhlidian";
    zhLiDian.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
}



-(void)jiageXingji:(UIButton*)btn
{

    
    MySliderViewController * mySlider = [[[MySliderViewController alloc] init] autorelease];
    mySlider.delegate = self;
    mySlider.tag = @"CHjiemian";
    mySlider.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:mySlider animated:YES completion:NULL];
   
    
    

}
-(void)zhongChaXun:(UIButton*)btn
{
    
    ChangChaXunViewController * changGui = [[[ChangChaXunViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:changGui] autorelease];
    changGui.ruZhuri = chLabel2.text;
    changGui.liDianri = chLabel4.text;
    changGui.chengShiM = self.chengshiMing;
    changGui.xingJi = xingJim;
    changGui.canJig = chCJiGe;
    changGui.canJig1 = chCJiGe1;
    changGui.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav  animated:YES completion:NULL];
    
    self.chCJiGe = nil;
    self.chCJiGe1 = nil;
    self.xingJim = nil;
    
    chLabel5.text = @"价格范围";
    chLabel6.text = @"星级范围";
    
}




- (void) citySelectionUpdate:(NSString *)selectedCity withSection:(NSUInteger)newSection withRow:(NSUInteger)newRow withTag:(NSString *)tag
{
    self.curRow= newRow;
    self.curSection =newSection;
    NSLog(@"%d%d",newSection,newRow);
   
    if ([tag isEqualToString:@"zhoubian"]) {
        self.chengshiMing = selectedCity;
        zhLabel.text = self.chengshiMing;
        NSLog(@"%@",self.chengshiMing);
    }else if ([tag isEqualToString:@"changgui"]){
        self.chengshiMing = selectedCity;
        label.text = self.chengshiMing;
    
    }
    
}

- (NSString*) getDefaultCity
{
   
   
    return nil;
}


-(void)zhoubianChaXun:(UIButton*)btn
{
    

   
    
    ZhouBianXunViewController * zhoub = [[[ZhouBianXunViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:zhoub] autorelease];
    
    zhoub.ruZhuri = zhLabel6.text;
    zhoub.liDianri = zhLabel4.text;
    zhoub.chengShiM = label.text;
    zhoub.canJig = self.chCJiGe;
    zhoub.canJig1 = self.chCJiGe1;
    zhoub.xingJi = xingJim;
    zhoub.jvLizh = self.zhJcLi;
    zhoub.lat = self.mlat;
    zhoub.log = self.mlog;
    zhoub.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    self.chCJiGe = nil;
    self.chCJiGe1 = nil;
    self.xingJim = nil;

    
    [locationManager stopUpdatingLocation];
    loctiStart = NO;
   

    
    zhLabel5.text = @"价格/星级";
    zhLabel.text = @"周边距离设置";
    zhSlider.value = 0;
    
}


-(void)zhuDiJiaGe:(UIButton *)button
{

    
    
    MySliderViewController * zhSlideraa = [[[MySliderViewController alloc] init] autorelease];
    zhSlideraa.delegate = self;
    zhSlideraa.tag = @"ZHjiemian";
    zhSlideraa.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:zhSlideraa animated:YES completion:NULL];
    
    

}


-(void)sliderJvLi:(UISlider *)slider
{

    int val = slider.value;
    
    zhLabel.text = [NSString stringWithFormat:@"周边%d公里",val];
    self.zhJcLi = [NSString stringWithFormat:@"%d",val];

}

-(NSString* )GetTomorrowDay:(NSDate *)date withDay:(int)day
{
    
    NSCalendar * gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents * comp = [gregorian components:NSWeekCalendarUnit | NSYearCalendarUnit|NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    [comp setDay:([comp day] + 1)];
    
    NSDate * beginWeek = [gregorian dateFromComponents:comp];
    NSDateFormatter * dateDay = [[[NSDateFormatter alloc] init] autorelease];
    [dateDay setDateFormat:@"yyyy-MM-dd"];
    
    return [dateDay stringFromDate:beginWeek];
    
    
}
-(void)myButton
{
    
    NSDateFormatter * taFormater = [[[NSDateFormatter alloc] init] autorelease];
    NSDate * tadayDate =[NSDate date];
    [taFormater setDateFormat:@"yyyy-MM-dd"];
    NSString * taTime = [taFormater stringFromDate:tadayDate];
    NSLog(@"tadayDate %@",taTime);
 
    
    
    
    CGRect rect = self.view.bounds;
       
    ltbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    ltbtn.frame = CGRectMake(10, 5, 35, 30);
    [ltbtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [ltbtn addTarget:self action:@selector(leftButon:) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationController.navigationBar addSubview:ltbtn];
    
    
    chaxun = [UIButton buttonWithType:UIButtonTypeCustom];
    chaxun.frame = CGRectMake(55, 10, 110, 50);
    [chaxun setImage:[UIImage imageNamed:@"常规查询-on.png"] forState:UIControlStateNormal];
    [chaxun addTarget:self action:@selector(chaXun:) forControlEvents:UIControlEventTouchUpInside];
    chaxun.tag = 200;
    [self.view addSubview:chaxun];
    
    zhoubian = [UIButton buttonWithType:UIButtonTypeCustom];
    zhoubian.frame = CGRectMake(160, 10, 110, 50);
    [zhoubian setImage:[UIImage imageNamed:@"周边查询1-off.png"] forState:UIControlStateNormal];
    [zhoubian addTarget:self action:@selector(zhoubian:) forControlEvents:UIControlEventTouchUpInside];
    zhoubian.tag = 201;
    [self.view addSubview:zhoubian];
    
    
    
    
    [viewOne release];

   
    chengshiM = [UIButton buttonWithType:UIButtonTypeCustom];
    chengshiM.frame = CGRectMake(60, 70, 200, 50);
    [chengshiM setTitle:nil forState:UIControlStateNormal];
    [chengshiM addTarget:self action:@selector(chengshimi:) forControlEvents:UIControlEventTouchUpInside];
    [chengshiM setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:chengshiM];
    
    label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)] autorelease];
    label.font = [UIFont fontWithName:@"Arial" size:20];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor clearColor];
    label.text = @"长春";
    [chengshiM addSubview:label];

//*******************************************
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n03.png"]];
    imageView.frame = CGRectMake(20, 80, 30, 30);
    [self.view addSubview:imageView];
    [imageView release];
    
    UIImageView * image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image.frame =CGRectMake(280, 90, 12, 12);
    [self.view addSubview:image];
    [image release];
    

    
    UIImageView * imageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-02.png"]];
    imageView2.frame = CGRectMake(17, 170, 30, 30);
    [self.view addSubview:imageView2];
    [imageView2 release];
    
    UIImageView * image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image3.frame = CGRectMake(280, 180, 12, 12);
    [self.view addSubview:image3];
    [image3 release];
    
    UIImageView * imageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n05.png"]];
    imageView3.frame = CGRectMake(17, 250, 30, 30);
    [self.view addSubview:imageView3];
    [imageView3 release];
    
    UIImageView * image4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image4.frame = CGRectMake(280, 260, 12, 12);
    [self.view addSubview:image4];
    [image4 release];
    
    
   
    ruRiQi = [UIButton buttonWithType:UIButtonTypeCustom];
    ruRiQi .frame = CGRectMake(55, 160, 100, 50);
    [ruRiQi setTitle:nil forState:UIControlStateNormal];
    [ruRiQi addTarget:self action:@selector(ruZhuriqi:) forControlEvents:UIControlEventTouchUpInside];
    [ruRiQi setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:ruRiQi];
    
    chLabel = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)] autorelease];
    chLabel.font = [UIFont fontWithName:@"Arial" size:15];
    chLabel.textAlignment = NSTextAlignmentCenter;
    chLabel.backgroundColor = [UIColor clearColor];
    chLabel.text = @"入住日期";
    [ruRiQi addSubview:chLabel];
    
    chLabel2 = [[[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 30)] autorelease];
    chLabel2.font = [UIFont fontWithName:@"Arial" size:17];
    chLabel2.textAlignment = NSTextAlignmentCenter;
    chLabel2.backgroundColor = [UIColor clearColor];
    chLabel2.text = [NSString stringWithFormat:@"%@",taTime];
    [ruRiQi addSubview:chLabel2];

    UIImageView * image5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image5.frame = CGRectMake(155, 180, 12, 12);
    [self.view addSubview:image5];
    [image5 release];
    

    zJWan = [UIButton buttonWithType:UIButtonTypeCustom];
    zJWan .frame = CGRectMake(165, 160, 100, 50);
    [zJWan setTitle:nil forState:UIControlStateNormal];
    [zJWan addTarget:self action:@selector(zhuJiwan:) forControlEvents:UIControlEventTouchUpInside];
    [zJWan setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:zJWan];
    
    chLabel3 = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 20)] autorelease];
    chLabel3.font = [UIFont fontWithName:@"Arial" size:15];
    chLabel3.textAlignment = NSTextAlignmentCenter;
    chLabel3.backgroundColor = [UIColor clearColor];
    chLabel3.text = @"离店日期";
    [zJWan addSubview:chLabel3];
    
    chLabel4 = [[[UILabel alloc] initWithFrame:CGRectMake(0, 20, 100, 30)] autorelease];
    chLabel4.font = [UIFont fontWithName:@"Arial" size:17];
    chLabel4.textAlignment = NSTextAlignmentCenter;
    chLabel4.backgroundColor = [UIColor clearColor];
    chLabel4.text = [NSString stringWithFormat:@"%@",[self GetTomorrowDay:tadayDate withDay:1]];
    [zJWan addSubview:chLabel4];
    
        

    jiaGe = [UIButton buttonWithType:UIButtonTypeCustom];
    jiaGe .frame = CGRectMake(60, 240, 250, 50);
    [jiaGe setTitle:nil forState:UIControlStateNormal];
    [jiaGe addTarget:self action:@selector(jiageXingji:) forControlEvents:UIControlEventTouchUpInside];
    [jiaGe setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:jiaGe];
    
    chLabel5 = [[[UILabel alloc] initWithFrame:CGRectMake(0, 10, 120, 30)] autorelease];
    chLabel5.font = [UIFont fontWithName:@"Arial" size:17];
    chLabel5.textAlignment = NSTextAlignmentCenter;
    chLabel5.backgroundColor = [UIColor clearColor];
    chLabel5.text = @"价格范围";
    [jiaGe addSubview:chLabel5];
    
    chLabel6 = [[[UILabel alloc] initWithFrame:CGRectMake(120, 10, 70, 30)] autorelease];
    chLabel6.font = [UIFont fontWithName:@"Arial" size:17];
    chLabel6.textAlignment = NSTextAlignmentLeft;
    chLabel6.backgroundColor = [UIColor clearColor];
    chLabel6.text = @"星级范围";
    [jiaGe addSubview:chLabel6];
    
    

    zChaXun = [UIButton buttonWithType:UIButtonTypeCustom];
    zChaXun .frame = CGRectMake(80, 330, 160, 45);

    [zChaXun setImage:[UIImage imageNamed:@"chick.png"] forState:UIControlStateNormal];
    [zChaXun addTarget:self action:@selector(zhongChaXun:) forControlEvents:UIControlEventTouchUpInside];
    [zChaXun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:zChaXun];

    
    viewOne = [[UIView alloc] initWithFrame:CGRectMake(0, 70, 320, rect.size.height - 110)];
    viewOne.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:viewOne];
    viewOne.hidden = YES;

   
   
    
    
    zhLabel = [[[UILabel alloc] initWithFrame:CGRectMake(60, 10, 200, 20)] autorelease];
    zhLabel.font = [UIFont fontWithName:@"Arial" size:20];
    zhLabel.textAlignment = NSTextAlignmentCenter;
    zhLabel.backgroundColor = [UIColor clearColor];
    zhLabel.text = @"周边距离设置";
    [viewOne addSubview:zhLabel];
    
    zhSlider = [[UISlider alloc] initWithFrame:CGRectMake(60, 20, 200, 30)];
    zhSlider.minimumValue = 0;
    zhSlider.maximumValue = 10;
    zhSlider.value = 0;
    [zhSlider setThumbImage:[UIImage imageNamed:@"handle_highlight.png"] forState:UIControlStateHighlighted];
    [zhSlider setThumbImage:[UIImage imageNamed:@"筛选滑块.png"] forState:UIControlStateNormal];
    [zhSlider addTarget:self action:@selector(sliderJvLi:) forControlEvents:UIControlEventValueChanged];
    [viewOne addSubview:zhSlider];
    [zhSlider release];

    UIImageView * zhImangView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n03.png"]];
    zhImangView.frame = CGRectMake(20, 20, 30, 30);
    [viewOne addSubview:zhImangView];
    [zhImangView release];
    
    UIImageView * zhImageView1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n入住.png"]];
    zhImageView1.frame = CGRectMake(20, 90, 30, 30);
    [viewOne addSubview:zhImageView1];
    [zhImageView1 release];
    
    UIImageView * zhImageView2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n退房.png"]];
    zhImageView2.frame = CGRectMake(17, 160, 30, 30);
    [viewOne addSubview:zhImageView2];
    [zhImageView2 release];
    
    UIImageView * zhImageView3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"n05.png"]];
    zhImageView3.frame = CGRectMake(17, 230, 30, 30);
    [viewOne addSubview:zhImageView3];
    [zhImageView3 release];
    
    zhChaXun = [UIButton buttonWithType:UIButtonTypeCustom];
    zhChaXun .frame = CGRectMake(80, 300, 160, 45);
        [zhChaXun setImage:[UIImage imageNamed:@"chick.png"] forState:UIControlStateNormal];
    [zhChaXun addTarget:self action:@selector(zhoubianChaXun:) forControlEvents:UIControlEventTouchUpInside];
    [zhChaXun setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [viewOne addSubview:zhChaXun];
    

    
    UIImageView * image8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image8.frame = CGRectMake(280, 100, 12, 12);
    [viewOne addSubview:image8];
    [image8 release];
    
    
    zhRuZShi = [UIButton buttonWithType:UIButtonTypeCustom];
    zhRuZShi.frame = CGRectMake(60, 80, 200, 50);
    [zhRuZShi setTitle:nil forState:UIControlStateNormal];
    [zhRuZShi addTarget:self action:@selector(zhRuzhushi:) forControlEvents:UIControlEventTouchUpInside];
    [viewOne addSubview:zhRuZShi];
    
    UIImageView * image9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image9.frame = CGRectMake(280, 170, 12, 12);
    [viewOne addSubview:image9];
    [image9 release];
    
    
    zhLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 50)];
    zhLabel2.font = [UIFont fontWithName:@"Arial" size:15];
    zhLabel2.textAlignment = NSTextAlignmentCenter;
    zhLabel2.backgroundColor = [UIColor clearColor];
    zhLabel2.text =@"入住日期：";
    [zhRuZShi addSubview:zhLabel2];
    
    zhLabel6 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 120, 50)];
    zhLabel6.font = [UIFont fontWithName:@"Arial" size:17];
    zhLabel6.textAlignment = NSTextAlignmentLeft;
    zhLabel6.backgroundColor = [UIColor clearColor];
    zhLabel6.text = [NSString stringWithFormat:@"%@",taTime];

    [zhRuZShi addSubview:zhLabel6];
    


    
    zhLiDShi = [UIButton buttonWithType:UIButtonTypeCustom];
    zhLiDShi.frame = CGRectMake(60, 150, 200, 50);
    [zhLiDShi setTitle:nil forState:UIControlStateNormal];
    [zhLiDShi addTarget:self action:@selector(zhLiDianSh:) forControlEvents:UIControlEventTouchUpInside];
    [viewOne addSubview:zhLiDShi];
    
    zhLabel3 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 80, 50)];
    zhLabel3.font = [UIFont fontWithName:@"Arial" size:15];
    zhLabel3.textAlignment = NSTextAlignmentCenter;
    zhLabel3.backgroundColor = [UIColor clearColor];
    zhLabel3.text =@"离店日期：";
    [zhLiDShi addSubview:zhLabel3];
    
    zhLabel4 = [[UILabel alloc] initWithFrame:CGRectMake(100, 0, 120, 50)];
    zhLabel4.font = [UIFont fontWithName:@"Airal" size:17];
    zhLabel4.textAlignment = NSTextAlignmentLeft;
    zhLabel4.backgroundColor = [UIColor clearColor];
    zhLabel4.text = [NSString stringWithFormat:@"%@",[self GetTomorrowDay:tadayDate withDay:1]];
    [zhLiDShi addSubview:zhLabel4];
    
    zhJiGe = [UIButton buttonWithType:UIButtonTypeCustom];
    zhJiGe.frame = CGRectMake(60, 220, 200, 50);
    [zhJiGe setTitle:nil forState:UIControlStateNormal];
    [zhJiGe addTarget:self action:@selector(zhuDiJiaGe:) forControlEvents:UIControlEventTouchUpInside];
    [viewOne addSubview:zhJiGe];
    
    UIImageView * image10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image10.frame = CGRectMake(280, 240, 12, 12);
    [viewOne addSubview:image10];
    [image10 release];
    
    zhLabel5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)];
    zhLabel5.font = [UIFont fontWithName:@"Airal" size:20];
    zhLabel5.textAlignment = NSTextAlignmentCenter;
    zhLabel5.backgroundColor = [UIColor clearColor];
    zhLabel5.text = @"价格/星级";
    [zhJiGe addSubview:zhLabel5];
    
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
    
    
    self.str = [NSString stringWithFormat:@"%@-%@-%@",self.str1,self.str2,self.str3];
    NSLog(@"%@",self.str);

    
    if ([tag isEqualToString:@"riLiBo"]) {
        chLabel2.text= self.str;
    }else if ([tag isEqualToString:@"riLiBo1"]){
        
        chLabel4.text= self.str;
    
    }else if ([tag isEqualToString:@"zhoubianRuz"]){
    
        zhLabel6.text = self.str;
        NSLog(@"%@",zhLabel6.text);
    }else if ([tag isEqualToString:@"zhlidian"]){
    
        zhLabel4.text = self.str;
        NSLog(@"%@",zhLabel4.text);
    }
    
    
   
}

-(void)sliderString:(NSString *)str11 withStrt:(NSString *)str22 withStr:(NSString *)str33 withTag:(NSString *)tag
{
    
   
    if ([tag isEqualToString:@"CHjiemian"]) {
        chLabel5.text = [NSString stringWithFormat:@"(%@-%@)/",str11,str22];
        self.chCJiGe = str11;
        self.chCJiGe1 = str22;
        chLabel6.text = [NSString stringWithFormat:@"%@星级",str33];
        self.xingJim = str33;
    }else if ([tag isEqualToString:@"ZHjiemian"]){
        zhLabel5.text = [NSString stringWithFormat:@"(%@-%@)/%@",str11,str22,str33];
        self.chCJiGe = str11;
        self.chCJiGe1 = str22;
        self.xingJim = str33;
    
    }


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

    self.view.backgroundColor = [UIColor whiteColor];
   UIImageView* myimageView = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView];
    [myimageView release];
    loctiStart = NO;
    
       [self myButton];
   

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



-(void)dealloc
{
    
   
    [chengshiming release];
    [jiudianming release];
    [ruZhuri release];
    [jiageXing release];
    [zhuJwan release];
    [fanHui release];
    [str1 release];
    [str2 release];
    [str3 release];
    [xingJim release];
    [chCJiGe release];
    [chCJiGe1 release];
    
 
    [zhLabel1 release];
    [zhLabel2 release];
    [zhLabel3 release];
    [zhLabel4 release];
    [zhLabel5 release];
    [zhLabel6 release];
    [zhJcLi release];
    [chengshiMing release];
    [super dealloc];
}
@end
