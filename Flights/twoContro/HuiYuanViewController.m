//
//  HuiYuanViewController.m
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "HuiYuanViewController.h"
#import "DengViewController.h"
#import "RootViewController.h"
#import "ShenQingViewController.h"
#import "MyShenViewController.h"
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
#import "DeXMlModel.h"
#import "RecomHuiYuXml.h"
#import "HuiNumberXml.h"
#import "RecomYanzhXml.h"



  UITabBarItem * tabBar2;


@interface HuiYuanViewController ()

@end

@implementation HuiYuanViewController
@synthesize marray,mTArray,startHui,mHuiYuanarray;

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
        self.marray = [NSMutableArray arrayWithArray:array];
        
    }

    return self;
}


-(void)btnFanHui:(UIButton * )btnn
{
    if (startHui == YES) {
        [huiYurequest clearDelegatesAndCancel];
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];

        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:rvc animated:YES completion:NULL];
        startHui = NO;
    }else{
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
  
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        
        [self presentViewController:rvc animated:YES completion:NULL];
    
    
    }
    
   
    
}



-(void)myToolBarView
{
    ShenQingViewController * shenq = [[[ShenQingViewController alloc]initWithArray:self.marray ] autorelease];
    UINavigationController * item1 = [[[UINavigationController alloc] initWithRootViewController:shenq] autorelease];
    UITabBarItem * tabBar = [[UITabBarItem alloc] initWithTitle:@"提交申请单" image:[UIImage imageNamed:@"cc_09.png"] tag:1];
    
    item1.tabBarItem = tabBar;
    [tabBar release];
    
    MyShenViewController * mshenc = [[[MyShenViewController alloc] initWithArray:self.marray] autorelease];
    UINavigationController * item2 = [[[UINavigationController alloc] initWithRootViewController:mshenc] autorelease];
    tabBar2 = [[UITabBarItem alloc] initWithTitle:@"待审批申请单" image:[UIImage imageNamed:@"01-055.png"] tag:2];
    item2.tabBarItem = tabBar2;
    
   
    [tabBar2 release];
    
    NSArray * arrayTab = [NSArray arrayWithObjects:item1,item2, nil];
    UITabBarController * tabCon = [[UITabBarController alloc] init];
    tabCon.selectedIndex = 0;
    tabCon.viewControllers = arrayTab;
 
    tabCon.tabBar.tintColor = [UIColor colorWithRed:81/255.0 green:168/255.0 blue:221/255.0 alpha:1.0];

    ShareApp.window.rootViewController = tabCon;
    [tabCon release];
    
    
}

-(void)httpNumber
{

        
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mResurl = [defaults objectForKey:@"result"];
        NSString * mUser = [defaults objectForKey:@"duser_ID"];
        
        
        NSLog(@"mResurl is  %@",mResurl);
        NSLog(@"mUser_ID  is %@",mUser);
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/monitor.php?User_id=%@",mUser];
    NSLog(@"************ is %@",strUrl);
        NSURL * url = [NSURL URLWithString:strUrl];
   
    huiYurequest = [[ASIHTTPRequest alloc] initWithURL:url];
    //    huiYurequest = [ASIHTTPRequest requestWithURL:url];
        [huiYurequest setTag:1007];
        [huiYurequest setDelegate:self];
        [huiYurequest startAsynchronous];
        
        startHui = YES;
        
        [activity startAnimating];
        
    


}
-(void)dealloc
{
    [huiYurequest clearDelegatesAndCancel];
    [huiYurequest release];
    [super dealloc];
}
- (void)requestFinished:(ASIHTTPRequest *)request
{
    startHui = NO;
    [activity stopAnimating];
    

    
    if (request.tag == 1007) {
        NSLog(@"%@",[request responseString]);
        self.mHuiYuanarray = [RecomHuiYuXml recomHuiYuanmend:[request responseString]];
        if ([self.mHuiYuanarray count] != 0) {
            HuiNumberXml * huiNum = [self.mHuiYuanarray objectAtIndex:0];
            NSLog(@"huiNum.hApprovalCount  is  %@",huiNum.hApprovalCount);
          
            [self myToolBarView];
            
            tabBar2.badgeValue = huiNum.hApprovalCount;
        }
    }
    
    

}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    startHui = NO;
    
    NSLog(@"error");
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"获取审批申请单数量失败!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    

}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{

    RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
    
    rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:rvc animated:YES completion:NULL];

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

    NSLog(@"*******  %d",[self.marray count]);
    mTArray = [[NSMutableArray alloc]initWithCapacity:0 ];
    mHuiYuanarray = [[NSMutableArray alloc] initWithCapacity:0];

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 35, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * barBtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    self.navigationItem.leftBarButtonItem = barBtn;
    
    
   
//    if (self.view.bounds.size.height > 480) {
//        
//        UIImageView * imagiPad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"启动页副本.png"]];
//        imagiPad.frame = CGRectMake(0, 0, 320 , 528);
//        [self.view addSubview:imagiPad];
//        [imagiPad release];
//        
//        
//        
//        
//    }else{
//    UIImageView * imagiPad = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"启动页960.png"]];
//    imagiPad.frame = CGRectMake(0, 0, 320 , 440);
//    [self.view addSubview:imagiPad];
//    [imagiPad release];
//    }
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 220)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
     [self httpNumber];
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
