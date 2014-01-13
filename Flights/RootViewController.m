//
//  RootViewController.m
//  Flights
//
//  Created by mac on 12-10-18.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "RootViewController.h"
#import "InquiryViewController.h"
#import "jiuDianCxViewController.h"
#import "DengViewController.h"
#import "HuiYuanViewController.h"
#import "dongtaiViewController.h"
#import "AppDelegate.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize rotHttp;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}
-(void)dealloc
{
    
    
    [super dealloc];
    [myimageView release];
    [_imageView release];
    
    
}




-(void)zhuxiaoDeng:(UIButton *)button
{
    NSLog(@"*******");
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"用户已注销"
                                                     message:@"请登陆新账户"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    alertView.tag = 456;
    [alertView show];
    [alertView release];


    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    
    
    [defaults removeObjectForKey:@"result"];
    [defaults removeObjectForKey:@"user_Id"];
    [defaults removeObjectForKey:@"name"];
    [defaults removeObjectForKey:@"gender"];
    [defaults removeObjectForKey:@"cardtype"];
    [defaults removeObjectForKey:@"toral_rew"];
    [defaults removeObjectForKey:@"pay_reward"];
    [defaults removeObjectForKey:@"duser_ID"];
    [defaults removeObjectForKey:@"dcompany"];
    [defaults removeObjectForKey:@"dept_ID"];
    [defaults removeObjectForKey:@"role_ID"];
    [defaults removeObjectForKey:@"passport"];
    [defaults removeObjectForKey:@"email"];
    
    
    

}

-(void)httpNumber
{
    
    NSString * sUrl = [NSString stringWithFormat:@"http://139.210.99.29:8090/query.aspx"];
    
    sUrl = [sUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL * url = [NSURL URLWithString:sUrl];
    
    requsetNum = [ASIHTTPRequest requestWithURL:url];
    requsetNum.tag = 1099;
    requsetNum.delegate = self;
    [requsetNum startAsynchronous];
    rotHttp = YES;
    
}

-(void)requestFinished:(ASIHTTPRequest *)request
{
    rotHttp = NO;
    
    NSLog(@"%@",[request responseString]);
    
    NSString * stringNum = [NSString stringWithFormat:@"%@",[request responseString]];
    
    NSDictionary* infoDict =[[NSBundle mainBundle] infoDictionary];
    // 工程的版本号
    NSString* versionNum =[infoDict objectForKey:@"CFBundleVersion"];
    //工程名字
    // NSString*appName =[infoDict objectForKey:@"CFBundleDisplayName"];
    // NSString*text =[NSString stringWithFormat:@"%@ %@",appName,versionNum];
    
    NSLog(@"text is  %@",versionNum);
    int v  = [versionNum intValue];
    int s = [stringNum intValue];
    NSLog(@"%d",v);
    NSLog(@"%d",s);
    //  NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    //  [defaults setObject:stringNum forKey:@"versionNum"];
    
    if (![stringNum isEqualToString:versionNum]) {
        
        UIAlertView *alert =[[UIAlertView alloc] initWithTitle:@"提示"
                                                       message:@"检测到最新版本前去更新!"
                                                      delegate:self
                                             cancelButtonTitle:@"确认"
                                             otherButtonTitles:@"取消",nil ];
        alert.tag = 101;
        [alert show];
        [alert release];
        
    }else{
        
        NSLog(@"版本没有更新!");
        
    }
    
    
}
- (float)getIOSVersion
{
    return [[[UIDevice currentDevice] systemVersion] floatValue];
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    rotHttp = NO;
    NSLog(@"接口  error");
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (alertView.tag == 101) {
        if (buttonIndex==0) {
            
            NSString *webLink = @"https://itunes.apple.com/us/app/cha-lu-tian-xia-shang-lu/id670862190?ls=1&mt=8";
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:webLink]];
            
        }else
        {
            NSLog(@"取消");
            
        }
    }
    
   
    
    
    if (alertView.tag == 456) {
        DengViewController *deng = [[[DengViewController alloc] init] autorelease];
        UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:deng]autorelease];
        deng.dengLuStr = [NSString stringWithFormat:@"D"];

        [self presentViewController:nav animated:YES completion:NULL];
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
    
    NSLog(@"%f",self.view.bounds.size.height);
    self.view.backgroundColor=[UIColor whiteColor];
    
     NSLog(@" 系统版本号 ：%f",[self getIOSVersion]);
    
    [self Button];
    

    UIButton * btnRight = [UIButton buttonWithType:UIButtonTypeCustom];
    btnRight.frame = CGRectMake(249, 30, 66, 17);
    [btnRight setImage:[UIImage imageNamed:@"切换用户副本.png"] forState:UIControlStateNormal];
    [btnRight addTarget:self action:@selector(zhuxiaoDeng:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btnRight];
    
      [self httpNumber];
 
    
}

-(void)btn1Pressed:(id)sender
{
    imageV.hidden = YES;
    InquiryViewController *Ivc=[[[InquiryViewController alloc]init]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc] initWithRootViewController:Ivc] autorelease];
    nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];

}


-(void)btn3Pressed:(id)sender
{
   
    imageV.hidden = YES;
    dongtaiViewController *dtv = [[[dongtaiViewController alloc]init]autorelease];
    dtv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:dtv]autorelease];
    [self presentViewController:nav animated:YES completion:NULL];

    
}

-(void)btn4Pressed:(id)sender
{
  
    imageV.hidden = YES;
    jiuDianCxViewController * jiuDian = [[[jiuDianCxViewController alloc] init] autorelease];
    jiuDian.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:jiuDian] autorelease];
    [self presentViewController:nav animated:YES completion:NULL];

    
    
}


-(void)btn6Pressed:(id)sender
{
    
    
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * mResurl = [defaults objectForKey:@"result"];
    NSString * mUser = [defaults objectForKey:@"user_Id"];
    
    
    NSLog(@"mResurl is  %@",mResurl);
    NSLog(@"mUser_ID  is %@",mUser);
    
    if ([mResurl isEqualToString:@"SUCCEED"]) {
        imageV.hidden=YES;
        HuiYuanViewController * huiy = [[[HuiYuanViewController alloc] init] autorelease];
        huiy.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;

        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:huiy]autorelease];

        [self presentViewController:nav animated:YES completion:NULL];

    }else{
        
        imageV.hidden=YES;
        DengViewController * huiy = [[[DengViewController alloc] init] autorelease];
        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:huiy] autorelease];
        huiy.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }
}

-(void)viewWillAppear:(BOOL)animated
{
    [self viewDidAppear:animated];
    imageV.hidden = NO;
    
    
}

-(void)Button
{
    if (self.view.bounds.size.height > 480.0f) {
        
        imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg新.png"]];
        imageV.frame=CGRectMake(0, 0, 320, 568);
        [self.view addSubview:imageV];
        
    }else{
        imageV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"首页960新.png"]];
        imageV.frame=CGRectMake(0, 0, 320, 480);
        [self.view addSubview:imageV];
        

    }
    
    
    
    bt1=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt1 addTarget:self action:@selector(btn1Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt1];
 

    
    bt3=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt3 addTarget:self action:@selector(btn3Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt3];
    
    bt4 =[UIButton buttonWithType:UIButtonTypeCustom];
    [bt4 addTarget:self action:@selector(btn4Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt4];
    

    bt6=[UIButton buttonWithType:UIButtonTypeCustom];
    [bt6 addTarget:self action:@selector(btn6Pressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bt6];

    
    
    
        if (self.view.bounds.size.height > 480.0f) {
            
         

            bt1.frame=CGRectMake(6, 140, 150, 180);
            [bt1 setImage:[UIImage imageNamed:@"a1.png"] forState:UIControlStateNormal];
            
            
            bt3.frame=CGRectMake(6, 325, 150, 180);
            [bt3 setImage:[UIImage imageNamed:@"a4.png"] forState:UIControlStateNormal];
            
            
            bt4.frame=CGRectMake(163, 140, 150, 180);
            [bt4 setImage:[UIImage imageNamed:@"a2.png"] forState:UIControlStateNormal];
            
            //会员中心ip4   审批管理(1).png
            bt6.frame=CGRectMake(163, 325, 150, 180);
            [bt6 setImage:[UIImage imageNamed:@"会员中心ip4.png"] forState:UIControlStateNormal];
            
            CGRect rect=self.view.bounds;
            
          
            
            UIButton *sbn = [UIButton buttonWithType:UIButtonTypeCustom];
            sbn.frame=CGRectMake(0, rect.size.height-37, 320, 37);
            [sbn addTarget:self action:@selector(sbn:) forControlEvents:UIControlEventTouchUpInside];
            [sbn setImage:[UIImage imageNamed:@"联系我们.png"] forState:UIControlStateNormal];
            [self.view addSubview:sbn];
            
           
            
        }
        else if(IOS7_OR_LATER){
        
            
            bt1.frame=CGRectMake(6, 125, 150, 145);
            [bt1 setImage:[UIImage imageNamed:@"a1.png"] forState:UIControlStateNormal];
            
            
            bt3.frame=CGRectMake(6, 280, 150, 145);
            [bt3 setImage:[UIImage imageNamed:@"a4.png"] forState:UIControlStateNormal];
            
            
            bt4.frame=CGRectMake(163, 125, 150, 145);
            [bt4 setImage:[UIImage imageNamed:@"a2.png"] forState:UIControlStateNormal];
            
            //会员中心ip4   审批管理(1).png
            bt6.frame=CGRectMake(163, 280, 150, 145 );
            [bt6 setImage:[UIImage imageNamed:@"会员中心ip4.png"] forState:UIControlStateNormal];
            
            CGRect rect=self.view.bounds;
            
            
            UIButton *sbn = [UIButton buttonWithType:UIButtonTypeCustom];
            sbn.frame=CGRectMake(0, rect.size.height-37, 320, 37);
            [sbn addTarget:self action:@selector(sbn:) forControlEvents:UIControlEventTouchUpInside];
            [sbn setImage:[UIImage imageNamed:@"联系我们.png"] forState:UIControlStateNormal];
            [self.view addSubview:sbn];
            

        
        
        }
    
            else{
            
           
            
            bt1.frame=CGRectMake(6, 115, 150, 145);
            [bt1 setImage:[UIImage imageNamed:@"a1.png"] forState:UIControlStateNormal];
            
            
            bt3.frame=CGRectMake(6, 270, 150, 145);
            [bt3 setImage:[UIImage imageNamed:@"a4.png"] forState:UIControlStateNormal];
            
            
            bt4.frame=CGRectMake(163, 115, 150, 145);
            [bt4 setImage:[UIImage imageNamed:@"a2.png"] forState:UIControlStateNormal];
            
            //会员中心ip4   审批管理(1).png
            bt6.frame=CGRectMake(163, 270, 150, 145 );
            [bt6 setImage:[UIImage imageNamed:@"会员中心ip4.png"] forState:UIControlStateNormal];
            
            CGRect rect=self.view.bounds;

            
            UIButton *sbn = [UIButton buttonWithType:UIButtonTypeCustom];
            sbn.frame=CGRectMake(0, rect.size.height-37, 320, 37);
            [sbn addTarget:self action:@selector(sbn:) forControlEvents:UIControlEventTouchUpInside];
            [sbn setImage:[UIImage imageNamed:@"联系我们.png"] forState:UIControlStateNormal];
            [self.view addSubview:sbn];
            
            
        }
    
}
-(void)sbn:(UIButton*)button


{
    
    
    UIActionSheet *actionSheet = [[[UIActionSheet alloc]
                                   initWithTitle:nil
                                   delegate:self
                                   cancelButtonTitle:@"取消"
                                   destructiveButtonTitle:nil
                                   otherButtonTitles:@"联系我们",nil] autorelease];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    
    
    [actionSheet showInView:self.view];


    


}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"电话");
    if (buttonIndex == 0) {
        
        actionSheet.hidden=YES;

//        NSString * phoneNumber = [NSString stringWithFormat:@"tel://4006-568-777"];
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:phoneNumber]];
        
        
        
        UIWebView*callWebview =[[UIWebView alloc] init];
        NSURL *telURL =[NSURL URLWithString:@"tel://4006-568-777"];
        [callWebview loadRequest:[NSURLRequest requestWithURL:telURL]];
        [self.view addSubview:callWebview];
    }
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
