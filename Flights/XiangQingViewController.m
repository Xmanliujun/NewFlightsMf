//
//  XiangQingViewController.m
//  Flights
//
//  Created by mac on 13-4-7.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "XiangQingViewController.h"
#import <QuartzCore/QuartzCore.h> 

@interface XiangQingViewController ()

@end

@implementation XiangQingViewController

@synthesize str1,str2,str3,str4,str5,str6,str7,str8,str9;

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
    
    [self helloView];

}

-(void)helloView
{
    
     if (self.view.bounds.size.height > 460.0f) {
         
         
         
     
         
         UILabel *lla=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
         lla.text=[NSString stringWithFormat:@"%@    %@",str1,str2];
         lla.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lla.backgroundColor=[UIColor whiteColor];
         lla.textAlignment=NSTextAlignmentCenter;
         lla.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lla];
         [lla release];
         
         UILabel *laa=[[UILabel alloc]initWithFrame:CGRectMake(0, 42, 98, 194)];
         laa.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         [self.view addSubview:laa];
         [laa release];
         UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(28, 122, 40, 40)];
         img.image = [UIImage imageNamed:@"起飞.png"];
         [self.view addSubview:img];
         [img release];
         
         UILabel *lbb=[[UILabel alloc]initWithFrame:CGRectMake(0, 238, 98, 194)];
         lbb.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         [self.view addSubview:lbb];
         [lbb release];
         UIImageView * img2 = [[UIImageView alloc] initWithFrame:CGRectMake(28, 318, 40, 40)];
         img2.image = [UIImage imageNamed:@"降落.png"];
         [self.view addSubview:img2];
         [img2 release];
         
         UILabel *lcc=[[UILabel alloc]initWithFrame:CGRectMake(0, 434, 98, 68)];
         lcc.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         [self.view addSubview:lcc];
         [lcc release];
         UIImageView * img3 = [[UIImageView alloc] initWithFrame:CGRectMake(28, 447, 40, 40)];
         img3.image = [UIImage imageNamed:@"站台图标.png"];
         [self.view addSubview:img3];
         [img3 release];
         

         
         UILabel *lle=[[UILabel alloc]initWithFrame:CGRectMake(100, 42, 100, 65)];
         lle.text=@"计划起飞时间";
         lle.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lle.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         lle.textAlignment=NSTextAlignmentCenter;
         lle.numberOfLines=0;
         lle.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lle];
         [lle release];
         
         
         UILabel *llc=[[UILabel alloc]initWithFrame:CGRectMake(100, 109, 100, 65)];
         llc.text=@"实际起飞时间";
         llc.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llc.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         llc.textAlignment=NSTextAlignmentCenter;
         llc.numberOfLines=0;
         llc.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llc];
         [llc release];
         
         UILabel *lld=[[UILabel alloc]initWithFrame:CGRectMake(100, 176, 100, 60)];
         lld.text=@"出发城市";
         lld.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lld.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         lld.textAlignment=NSTextAlignmentCenter;
         lld.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lld];
         [lld release];
         
         UILabel *llb=[[UILabel alloc]initWithFrame:CGRectMake(100, 238, 100, 65)];
         llb.text=@"计划到达时间";
         llb.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llb.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llb.textAlignment=NSTextAlignmentCenter;
         llb.numberOfLines=0;
         llb.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llb];
         [llb release];
         
         UILabel *llf=[[UILabel alloc]initWithFrame:CGRectMake(100, 305, 100, 65)];
         llf.text=@"实际到达时间";
         llf.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llf.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llf.textAlignment=NSTextAlignmentCenter;
         llf.numberOfLines=0;
         llf.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llf];
         [llf release];
         
         UILabel *llg=[[UILabel alloc]initWithFrame:CGRectMake(100, 372, 100, 60)];
         llg.text=@"到达城市";
         llg.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llg.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llg.textAlignment=NSTextAlignmentCenter;
         llg.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llg];
         [llg release];
         
         UILabel *llh=[[UILabel alloc]initWithFrame:CGRectMake(100, 434, 100, 68)];
         llh.text=@"站台";
         llh.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llh.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         llh.textAlignment=NSTextAlignmentCenter;
         llh.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llh];
         [llh release];
         
         UILabel *ll1=[[UILabel alloc]initWithFrame:CGRectMake(202, 42, 118, 65)];
         ll1.text=[NSString stringWithFormat:@"%@",str3];
         ll1.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll1.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll1.textAlignment=NSTextAlignmentCenter;
         ll1.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll1];
         [ll1 release];
         
         UILabel *ll2=[[UILabel alloc]initWithFrame:CGRectMake(202, 109, 118, 65)];
         
         
         if ([str4 isEqualToString:@"false"]) {
             ll2.text=[NSString stringWithFormat:@"无"];
             
         }else{
             ll2.text=[NSString stringWithFormat:@"%@",str4];
         }
         
         
         ll2.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll2.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll2.textAlignment=NSTextAlignmentCenter;
         ll2.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll2];
         [ll2 release];
         
         UILabel *ll3=[[UILabel alloc]initWithFrame:CGRectMake(202, 176, 118, 60)];
         ll3.text=[NSString stringWithFormat:@"%@",str5];
         ll3.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll3.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll3.textAlignment=NSTextAlignmentCenter;
         ll3.numberOfLines=0;
         ll3.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll3];
         [ll3 release];
         
         UILabel *ll4=[[UILabel alloc]initWithFrame:CGRectMake(202, 238, 118, 65)];
         ll4.text=[NSString stringWithFormat:@"%@",str6];
         ll4.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll4.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll4.textAlignment=NSTextAlignmentCenter;
         ll4.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll4];
         [ll4 release];
         
         UILabel *ll5=[[UILabel alloc]initWithFrame:CGRectMake(202, 305, 118, 65)];
         ll5.text=[NSString stringWithFormat:@"%@",str7];
         
         if ([str7 isEqualToString:@"false"]) {
             ll5.text=[NSString stringWithFormat:@"无"];
         }else{
             ll5.text=[NSString stringWithFormat:@"%@",str7];
         }
         
         ll5.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll5.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll5.textAlignment=NSTextAlignmentCenter;
         ll5.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll5];
         [ll5 release];
         
         UILabel *ll6=[[UILabel alloc]initWithFrame:CGRectMake(202, 372, 118, 60)];
         ll6.text=[NSString stringWithFormat:@"%@",str8];
         ll6.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll6.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll6.textAlignment=NSTextAlignmentCenter;
         ll6.numberOfLines=0;
         ll6.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll6];
         [ll6 release];
         
         UILabel *ll7=[[UILabel alloc]initWithFrame:CGRectMake(202, 434, 118, 68)];
         ll7.text=[NSString stringWithFormat:@"%@",str9];
         ll7.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll7.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         ll7.textAlignment=NSTextAlignmentCenter;
         ll7.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll7];
         [ll7 release];
         


         
     }else{
         
         
         UILabel *lla=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 320, 40)];
         lla.text=[NSString stringWithFormat:@"%@    %@",str1,str2];
         lla.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lla.backgroundColor=[UIColor clearColor];
         lla.textAlignment=NSTextAlignmentCenter;
         lla.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lla];
         [lla release];
         
         UILabel *la=[[UILabel alloc]initWithFrame:CGRectMake(0, 42, 98, 164)];
         la.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         [self.view addSubview:la];
         [la release];
         UIImageView * img = [[UIImageView alloc] initWithFrame:CGRectMake(28, 107, 40, 40)];
         img.image = [UIImage imageNamed:@"起飞.png"];
         [self.view addSubview:img];
         [img release];
         
         
         UILabel *lb=[[UILabel alloc]initWithFrame:CGRectMake(0, 208, 98, 164)];
         lb.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         [self.view addSubview:lb];
         [lb release];
         UIImageView * img2 = [[UIImageView alloc] initWithFrame:CGRectMake(28, 272, 40, 40)];
         img2.image = [UIImage imageNamed:@"降落.png"];
         [self.view addSubview:img2];
         [img2 release];
         
         
         UILabel *lc=[[UILabel alloc]initWithFrame:CGRectMake(0, 374, 98, 40)];
         lc.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         [self.view addSubview:lc];
         [lc release];
         UIImageView * img3 = [[UIImageView alloc] initWithFrame:CGRectMake(28, 376, 40, 40)];
         img3.image = [UIImage imageNamed:@"站台图标.png"];
         [self.view addSubview:img3];
         [img3 release];
  
         
         UILabel *lle=[[UILabel alloc]initWithFrame:CGRectMake(100, 42, 100, 55)];
         lle.text=@"计划起飞时间";
         lle.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lle.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         lle.textAlignment=NSTextAlignmentCenter;
         lle.numberOfLines=0;
         lle.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lle];
         [lle release];
         
         UILabel *llc=[[UILabel alloc]initWithFrame:CGRectMake(100, 99, 100, 55)];
         llc.text=@"实际起飞时间";
         llc.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llc.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         llc.textAlignment=NSTextAlignmentCenter;
         llc.numberOfLines=0;
         llc.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llc];
         [llc release];
         
         UILabel *lld=[[UILabel alloc]initWithFrame:CGRectMake(100, 156, 100, 50)];
         lld.text=@"出发城市";
         lld.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         lld.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         lld.textAlignment=NSTextAlignmentCenter;
         lld.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:lld];
         [lld release];
         
         UILabel *llb=[[UILabel alloc]initWithFrame:CGRectMake(100, 208, 100, 55)];
         llb.text=@"计划到达时间";
         llb.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llb.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llb.textAlignment=NSTextAlignmentCenter;
         llb.numberOfLines=0;
         llb.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llb];
         [llb release];
         
         UILabel *llf=[[UILabel alloc]initWithFrame:CGRectMake(100, 265, 100, 55)];
         llf.text=@"实际到达时间";
         llf.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llf.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llf.textAlignment=NSTextAlignmentCenter;
         llf.numberOfLines=0;
         llf.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llf];
         [llf release];
         
         UILabel *llg=[[UILabel alloc]initWithFrame:CGRectMake(100, 322, 100, 50)];
         llg.text=@"到达城市";
         llg.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llg.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         llg.textAlignment=NSTextAlignmentCenter;
         llg.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llg];
         [llg release];
         
         UILabel *llh=[[UILabel alloc]initWithFrame:CGRectMake(100, 374, 100, 40)];
         llh.text=@"站台";
         llh.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         llh.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         llh.textAlignment=NSTextAlignmentCenter;
         llh.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:llh];
         [llh release];
         
         UILabel *ll1=[[UILabel alloc]initWithFrame:CGRectMake(202, 42, 118, 55)];
         ll1.text=[NSString stringWithFormat:@"%@",str3];
         ll1.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll1.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll1.textAlignment=NSTextAlignmentCenter;
         ll1.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll1];
         [ll1 release];
         
         UILabel *ll2=[[UILabel alloc]initWithFrame:CGRectMake(202, 99, 118, 55)];
         
         if ([str4 isEqualToString:@"false"]) {
             ll2.text=[NSString stringWithFormat:@"无"];
         }else{
             ll2.text=[NSString stringWithFormat:@"%@",str4];
         }
         ll2.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll2.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll2.textAlignment=NSTextAlignmentCenter;
         ll2.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll2];
         [ll2 release];
         
         UILabel *ll3=[[UILabel alloc]initWithFrame:CGRectMake(202, 156, 118, 50)];
         ll3.text=[NSString stringWithFormat:@"%@",str5];
         ll3.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll3.backgroundColor=[UIColor colorWithRed:139/255.0 green:198/255.0 blue:231/255.0 alpha:1.0];
         ll3.textAlignment=NSTextAlignmentCenter;
         ll3.numberOfLines=0;
         ll3.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll3];
         [ll3 release];
         
         UILabel *ll4=[[UILabel alloc]initWithFrame:CGRectMake(202, 208, 118, 55)];
         ll4.text=[NSString stringWithFormat:@"%@",str6];
         ll4.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll4.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll4.textAlignment=NSTextAlignmentCenter;
         ll4.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll4];
         [ll4 release];
         
         UILabel *ll5=[[UILabel alloc]initWithFrame:CGRectMake(202, 265, 118, 55)];
         
         
         if ([str7 isEqualToString:@"false"]) {
             ll5.text=[NSString stringWithFormat:@"无"];
         }else{
             ll5.text=[NSString stringWithFormat:@"%@",str7];
         }
         ll5.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll5.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll5.textAlignment=NSTextAlignmentCenter;
         ll5.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll5];
         [ll5 release];
         
         UILabel *ll6=[[UILabel alloc]initWithFrame:CGRectMake(202, 322, 118, 50)];
         ll6.text=[NSString stringWithFormat:@"%@",str8];
         ll6.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll6.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
         ll6.textAlignment=NSTextAlignmentCenter;
         ll6.numberOfLines=0;
         ll6.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll6];
         [ll6 release];
         
         UILabel *ll7=[[UILabel alloc]initWithFrame:CGRectMake(202, 374, 118, 40)];
         ll7.text=[NSString stringWithFormat:@"%@",str9];
         ll7.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
         ll7.backgroundColor=[UIColor colorWithRed:143/255.0 green:206/255.0 blue:218/255.0 alpha:1.0];
         ll7.textAlignment=NSTextAlignmentCenter;
         ll7.font=[UIFont fontWithName:@"Arial" size:20];
         [self.view addSubview:ll7];
         [ll7 release];

     }     
    
}

-(void)leftbtnItem:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
