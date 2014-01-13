//
//  _DengLuViewController.m
//  Flights
//
//  Created by mac on 12-12-13.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "_DengLuViewController.h"
#import "ZhuCeViewController.h"
#import "ZhenJianHaoViewController.h"
#import "ZhaoMiMaViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "Sched_NHViewController.h"
#import "DengLuXML.h"
#import "RemDengLu.h"



@interface _DengLuViewController ()

@end

@implementation _DengLuViewController

@synthesize imView;
@synthesize User_ID,Password,myArray;
@synthesize DengLu,strat;
@synthesize cString;
@synthesize delegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)httpDengLuAsi
{
    [self touchesEnded:nil withEvent:nil];

    
    if (strat == YES) {
        NSLog(@"登陆已启动");
    }else{
        
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:83/interface/login.php?User_ID=%@&Password=%@",User_ID.text,Password.text];
        
        
        NSLog(@"%@",strUrL);
        
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        
        requestqa = [ASIHTTPRequest requestWithURL:urll];
        [requestqa setTag:1000];
        [requestqa setDelegate:self];
        [requestqa startAsynchronous];
        
        [activity startAnimating];
        strat = YES;
        
        Password.text=@"";
        
    }
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
   
    
    [activity stopAnimating];
    
    if (request.tag==1000) {
        
       strat = NO;
        
        NSData * responData = (NSData *)[request responseData];
        
        int i = [responData length];
        
        NSLog(@" %d",i);
        NSLog(@"下载内容  %@",[request responseString]);
        
        if (i > 200) {
            self.myArray = [RemDengLu recommendedParser:[request responseString]];
            
            if ([self.myArray count] != 0) {
                DengLuXML * deng = [self.myArray objectAtIndex:0];
                
                
                NSLog(@"登陆 存储 %@",deng.RESULT);
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                
                [defaults setObject:deng.RESULT forKey:@"result"];
                [defaults setObject:User_ID.text forKey:@"user_Id"];
                [defaults setObject:deng.Name forKey:@"name"];
                [defaults setObject:deng.Gender forKey:@"gender"];
                [defaults setObject:deng.Cardtype forKey:@"cardtype"];
                [defaults setObject:deng.Total_reward forKey:@"toral_rew"];
                [defaults setObject:deng.pay_reward forKey:@"pay_reward"];
                [defaults setObject:deng.dUser_ID forKey:@"duser_ID"];
                [defaults setObject:deng.dCompany forKey:@"dcompany"];
                [defaults setObject:deng.dDept_ID forKey:@"dept_ID"];
                [defaults setObject:deng.dRole_ID forKey:@"role_ID"];
                [defaults setObject:deng.dPassport forKey:@"passport"];
                [defaults setObject:deng.dEmail forKey:@"email"];
                [defaults setObject:deng.Passport_no forKey:@"Passport_no"];

                NSLog(@"dengxml %@",deng.Passport_no);

                
                
                
                
                
                
                [delegate stringWith:deng.RESULT With:User_ID.text WithArray:self.myArray];
                
                
                DengLu = [self.myArray objectAtIndex:0];
                
            }
        
        
        if ([DengLu.RESULT isEqualToString:@"SUCCEED"]) {
            
            oneView.hidden = YES;
            imView.hidden=NO;
            btn.hidden = YES;
            User_ID.hidden = YES;
            Password.hidden = YES;
            
            [NSTimer scheduledTimerWithTimeInterval:2.0f target:self selector:@selector(performDismiss:) userInfo:nil repeats:NO];
            
        }
        
        
        else if ([DengLu.RESULT isEqualToString:@"FAILED"]) {
           
            UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"登陆失败" message:@"用户名或密码不正确,请到网站注册，返回上一界面!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
            }
 
        }else {
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"登陆失败!"
                                                             message:nil
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            
            [alertView show];
            [alertView release];

            
        }
    }
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    strat = NO;
    NSError * error = [request error];
    NSLog(@"%@",error);
    
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"登陆失败!"
                                                     message:nil
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    alertView.tag= 10000;
    [alertView show];
    [alertView release];
    
    
    
}

-(void)denglu:(UIButton *)btn
{
    
    
    [self httpDengLuAsi];
    
    
}

-(void)zhuce:(UIButton *)btn
{
    NSLog(@"注册");
    
    ZhuCeViewController * zcv = [[[ZhuCeViewController alloc]init]autorelease];
    
    UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:zcv] autorelease];
    zcv.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    
    
}

-(void)zhaomima:(UIButton *)btn
{
    UIActionSheet *actionSheet = [[[UIActionSheet alloc]
                                   initWithTitle:@"密码找回方式"
                                   delegate:self
                                   cancelButtonTitle:@"取消"
                                   destructiveButtonTitle:nil
                                   otherButtonTitles:@"用户名找回",@"证件号找回",nil] autorelease];
    
    actionSheet.actionSheetStyle = UIActionSheetStyleBlackTranslucent;
    
    
    
    [actionSheet showInView:self.view];
    
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    
    
    if (buttonIndex ==0) {
        ZhaoMiMaViewController *zvc = [[[ZhaoMiMaViewController alloc] init] autorelease];
        UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:zvc]autorelease];
        zvc.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
    }else if (buttonIndex ==1){
        
        ZhenJianHaoViewController * jvc = [[[ZhenJianHaoViewController alloc]init]autorelease];
        UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:jvc]autorelease];
        jvc.modalTransitionStyle =UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
    }
    
}

-(void)btnbFanHui:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}


-(void) performDismiss:(NSTimer *)timer

{
    
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


-(void)btn:(UIButton *)button
{
    
    if (strat == YES) {
        
        [requestqa clearDelegatesAndCancel];
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"登陆被中指!"
                                                         message:@"请重新登陆!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        
        [alertView show];
        [alertView release];
    }if ([User_ID.text length] == 0 || [Password.text length] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"用户名和密码不能为空!"
                                                         message:@"请重新登陆!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        
        [alertView show];
        [alertView release];
    }
    
    else{
        [User_ID resignFirstResponder];
        [Password resignFirstResponder];
        
        [self httpDengLuAsi];
        
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

    strat = NO;
    
    
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
    
    
    myArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    
    if (self.view.bounds.size.height > 460.0f) {
        oneView = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:oneView];
        
        imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)];
        [imageView setImage:[UIImage imageNamed:@"登录界面-2-1136.png"]];
        
        [oneView addSubview:imageView];
        [imageView release];
        
        UILabel * laImag = [[UILabel alloc] init];
        laImag.frame = CGRectMake(20, 320, 280, 20);
        laImag.font = [UIFont fontWithName:@"Arial" size:20];
        laImag.text = @"请输入您的用户名和密码!";
        laImag.textColor = [UIColor grayColor];
        laImag.textAlignment = NSTextAlignmentCenter;
        laImag.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag];
        [laImag release];
        
        UILabel * laImag2 = [[UILabel alloc] init];
        laImag2.frame = CGRectMake(0, 350, 320, 20);
        laImag2.font = [UIFont fontWithName:@"Arial" size:18];
        laImag2.text = @"如果没有账号密码请到公司官网注册!";
        laImag2.textColor = [UIColor grayColor];
        laImag2.textAlignment = NSTextAlignmentCenter;
        laImag2.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag2];
        [laImag2 release];

        
        User_ID=[[UITextField alloc]initWithFrame:CGRectMake(110, 143, 138, 30)];
        User_ID.placeholder=@"请填写账号";
        User_ID.font=[UIFont fontWithName:@"Arial" size:12];
        User_ID.autocapitalizationType=UITextAutocapitalizationTypeNone;
        User_ID.autocorrectionType=UITextAutocorrectionTypeNo;
        User_ID.keyboardAppearance=UIKeyboardAppearanceAlert;
        User_ID.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        User_ID.returnKeyType=UIReturnKeyDone;
        User_ID.enablesReturnKeyAutomatically=YES;
        User_ID.tag=100;
        [oneView addSubview:User_ID];
        User_ID.delegate=self;
        [User_ID release];
        
        
        Password=[[UITextField alloc]initWithFrame:CGRectMake(110, 195, 138, 30)];
        Password.autocapitalizationType=UITextAutocapitalizationTypeNone;
        Password.autocorrectionType=UITextAutocorrectionTypeNo;
        Password.keyboardAppearance=UIKeyboardAppearanceAlert;
        Password.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        Password.returnKeyType=UIReturnKeyDone;
        Password.enablesReturnKeyAutomatically=YES;
        Password.secureTextEntry=YES;
        Password.placeholder=@"请填写密码";
        Password.font= [UIFont fontWithName:@"Arial" size:12];
        Password.tag=101;
        [oneView addSubview:Password];
        Password.delegate=self;
        [Password release];
        
        imView= [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,504)] autorelease];
        [imView setImage:[UIImage imageNamed:@"登录成功(新).png"]];
        imView.hidden=YES;
        [self.view addSubview:imView];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(82, 240, 80, 28);
        button.tag = 500;
        [button setImage:[UIImage imageNamed:@"登录2.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(187, 240, 60, 28);
        [button1 setImage:[UIImage imageNamed:@"注册.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(zhuce:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button1];
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(190, 275, 60, 30);
        [button2 addTarget:self action:@selector(zhaomima:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button2];
        
        
        
        
        UILabel *wla = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        wla.text = @"忘记密码 ？";
        wla.font = [UIFont fontWithName:@"Arial" size:11];
        wla.textAlignment = NSTextAlignmentCenter;
        wla.backgroundColor = [UIColor clearColor];
        wla.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
        [button2 addSubview:wla];
        

        
        
        
        
    }else{
        
        
        
        
        imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,416)];
        [imageView setImage:[UIImage imageNamed:@"登录界面-2-960.png"]];
        
        [oneView addSubview:imageView];
        [imageView release];
        
        UILabel * laImag = [[UILabel alloc] init];
        laImag.frame = CGRectMake(20, 280, 280, 20);
        laImag.font = [UIFont fontWithName:@"Arial" size:20];
        laImag.text = @"请输入您的用户名和密码!";
        laImag.textColor = [UIColor grayColor];
        laImag.textAlignment = NSTextAlignmentCenter;
        laImag.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag];
        [laImag release];
        
        UILabel * laImag2 = [[UILabel alloc] init];
        laImag2.frame = CGRectMake(0, 310, 320, 20);
        laImag2.font = [UIFont fontWithName:@"Arial" size:18];
        laImag2.text = @"如果没有账号密码请到公司官网注册!";
        laImag2.textColor = [UIColor grayColor];
        laImag2.textAlignment = NSTextAlignmentCenter;
        laImag2.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag2];
        [laImag2 release];
        
        
        btn=[UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame=CGRectMake(82, 195, 165, 28);
        [btn setImage:[UIImage imageNamed:@"登录界面2按钮.png"] forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:btn];
        
        
        
        User_ID=[[UITextField alloc]initWithFrame:CGRectMake(105, 121, 139, 30)];
        User_ID.placeholder=@"请填写账号";
        User_ID.font=[UIFont fontWithName:@"Arial" size:12];
        // User_ID.borderStyle=UITextBorderStyleRoundedRect;
        User_ID.autocapitalizationType=UITextAutocapitalizationTypeNone;
        User_ID.autocorrectionType=UITextAutocorrectionTypeNo;
        User_ID.keyboardAppearance=UIKeyboardAppearanceAlert;
        User_ID.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        User_ID.returnKeyType=UIReturnKeyDone;
        User_ID.enablesReturnKeyAutomatically=YES;
        User_ID.tag=100;
        [oneView addSubview:User_ID];
        User_ID.delegate=self;
        [User_ID release];
        
        
        Password=[[UITextField alloc]initWithFrame:CGRectMake(105, 166, 139, 30)];
        Password.autocapitalizationType=UITextAutocapitalizationTypeNone;
        //Password.borderStyle=UITextBorderStyleRoundedRect;
        Password.autocorrectionType=UITextAutocorrectionTypeNo;
        Password.keyboardAppearance=UIKeyboardAppearanceAlert;
        Password.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        Password.returnKeyType=UIReturnKeyDone;
        Password.enablesReturnKeyAutomatically=YES;
        Password.secureTextEntry=YES;
        Password.placeholder=@"请填写密码";
        Password.font= [UIFont fontWithName:@"Arial" size:12];
        Password.tag=101;
        [oneView addSubview:Password];
        Password.delegate=self;
        [Password release];
        
        imView= [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,416)] autorelease];
        [imView setImage:[UIImage imageNamed:@"登录成功背景960(新).png"]];
        imView.hidden=YES;
        [self.view addSubview:imView];
        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(82, 200, 80, 28);
        button.tag = 500;
        [button setImage:[UIImage imageNamed:@"登录2.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(187, 200, 60, 28);
        [button1 setImage:[UIImage imageNamed:@"注册.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(zhuce:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button1];
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(190, 235, 60, 30);
        [button2 addTarget:self action:@selector(zhaomima:) forControlEvents:UIControlEventTouchUpInside];
        [oneView addSubview:button2];
        
        
        
        
        UILabel *wla = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        wla.text = @"忘记密码 ？";
        wla.font = [UIFont fontWithName:@"Arial" size:11];
        wla.textAlignment = NSTextAlignmentCenter;
        wla.backgroundColor = [UIColor clearColor];
        wla.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
        [button2 addSubview:wla];

        
    }
    
    
    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
    
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [User_ID resignFirstResponder];
	[Password resignFirstResponder];
    
    return YES;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
	[User_ID resignFirstResponder];
    [Password resignFirstResponder];
    
    
}





- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
