//
//  DengViewController.m
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "DengViewController.h"
#import "HuiYuanViewController.h"
#import "ZhenJianHaoViewController.h"
#import "ZhaoMiMaViewController.h"
#import "ZhuCeViewController.h"
#import "ASIHTTPRequest.h"
#import "RecommendXmlDeng.h"
#import "RecomYanzhXml.h"
#import "DeXMlModel.h"
#import "CompanyID.h"
@interface DengViewController ()

@end

@implementation DengViewController
@synthesize oneTe,twoTe,myDengArray,start,myYanZheng,yanStart,dengLuStr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)httpASi
{
    
    [self touchesEnded:nil withEvent:nil];

    
    if (start == YES) {
        NSLog(@"已启动登陆");
    }else{
    
    
    
    NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/login.php?User_ID=%@&Password=%@",self.oneTe,self.twoTe];
       
    strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@"%@",strUrl);
    NSURL * url = [NSURL URLWithString:strUrl];
    
    requestaa = [[ASIHTTPRequest alloc] initWithURL:url];
    [requestaa setTag:1000];
    [requestaa setDelegate:self];
    [requestaa startAsynchronous];
    
    start = YES;
    [activity startAnimating];
        
    }
    
    
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    
    start = NO;
    
    if (request.tag == 1000) {
        
        NSLog(@"get is finished:  %@",[request responseString]);
        
        
        self.myDengArray = [RecommendXmlDeng recommendedParser:[request responseString]];
        if ([self.myDengArray count] != 0) {
            
            DeXMlModel * dengXml = [self.myDengArray objectAtIndex:0];
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            
            [defaults setObject:dengXml.mResult forKey:@"result"];
            [defaults setObject:self.oneTe forKey:@"user_Id"];
            [defaults setObject:dengXml.mName forKey:@"name"];
            [defaults setObject:dengXml.mGender forKey:@"gender"];
            [defaults setObject:dengXml.mCardtype forKey:@"cardtype"];
            [defaults setObject:dengXml.mTotal_raward forKey:@"toral_rew"];
            [defaults setObject:dengXml.mPay_raward forKey:@"pay_reward"];
            [defaults setObject:dengXml.mUserID forKey:@"duser_ID"];
            [defaults setObject:dengXml.mCompany forKey:@"dcompany"];
            [defaults setObject:dengXml.mDept_id forKey:@"dept_ID"];
            [defaults setObject:dengXml.mRole_id forKey:@"role_ID"];
            [defaults setObject:dengXml.mPassport_type forKey:@"passport"];
            [defaults setObject:dengXml.mPassport_no forKey:@"Passport_no"];

            
            NSLog(@"dengxml %@",dengXml.mPassport_no);
            
            
            if ([dengXml.mResult isEqualToString:@"SUCCEED"]&& ![self.dengLuStr isEqualToString:@"D"]) {
                HuiYuanViewController * huiy = [[[HuiYuanViewController alloc] initWithArray:self.myDengArray] autorelease];
                UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:huiy]autorelease];
                [self presentViewController:nav animated:YES completion:NULL];
                
            }
            else if([self.dengLuStr isEqualToString:@"D"] && [dengXml.mResult isEqualToString:@"SUCCEED"]){
                
                [self dismissViewControllerAnimated:YES completion:NULL];
                
            }

            
            else{
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"登陆失败" message:@"用户名或密码不正确,请到网站注册，返回上一界面!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
                [alertView release];
                
                
            }
            
            
            
        }
    }
    
    
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    start = NO;
    NSLog(@"error is %@", [request responseString]);
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"网络链接超时" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
}

-(void)denglu:(UIButton *)btn
{
    
   
    [self httpASi];
    
    
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


-(void)btnFanHui:(UIButton * )btnn
{
    if (start == YES ) {
        [activity stopAnimating];
        start = NO;
        
        [requestaa clearDelegatesAndCancel];
        [self dismissViewControllerAnimated:YES completion:NULL];
        
        
    }else{
        
        [self dismissViewControllerAnimated:YES completion:NULL];
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

    start = NO;
    myDengArray = [[NSMutableArray alloc] initWithCapacity:0];
    myYanZheng = [[NSMutableArray alloc] initWithCapacity:0];
    

    
    
    UIImageView* myimageView = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView];
    [myimageView release];
    
    
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 35, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkbtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    
    if (self.view.bounds.size.height > 460.0f) {
        
        
        UIImageView * imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)];
        [imageView setImage:[UIImage imageNamed:@"登录界面-2-1136.png"]];
        
        [self.view addSubview:imageView];
        [imageView release];
        
        
        
        
        textfOne=[[UITextField alloc]initWithFrame:CGRectMake(110, 143, 138, 30)];
        textfOne.placeholder=@"请填写账号";
        textfOne.font=[UIFont fontWithName:@"Arial" size:12];
        textfOne.autocapitalizationType=UITextAutocapitalizationTypeNone;
        textfOne.autocorrectionType=UITextAutocorrectionTypeNo;
        textfOne.keyboardAppearance=UIKeyboardAppearanceAlert;
        textfOne.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        textfOne.returnKeyType=UIReturnKeyDone;
        textfOne.enablesReturnKeyAutomatically=YES;
        textfOne.tag=100;
        [self.view addSubview:textfOne];
        textfOne.delegate=self;
        [textfOne release];
        
        
        
        textfTwo=[[UITextField alloc]initWithFrame:CGRectMake(110, 195, 138, 30)];
        textfTwo.autocapitalizationType=UITextAutocapitalizationTypeNone;
        //Password.borderStyle=UITextBorderStyleRoundedRect;
        textfTwo.autocorrectionType=UITextAutocorrectionTypeNo;
        textfTwo.keyboardAppearance=UIKeyboardAppearanceAlert;
        textfTwo.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        textfTwo.returnKeyType=UIReturnKeyDone;
        textfTwo.enablesReturnKeyAutomatically=YES;
        textfTwo.secureTextEntry=YES;
        textfTwo.placeholder=@"请填写密码";
        textfTwo.font= [UIFont fontWithName:@"Arial" size:12];
        textfTwo.tag=222;
        [self.view addSubview:textfTwo];
        textfTwo.delegate=self;
        [textfTwo release];

        
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(82, 240, 80, 28);
        button.tag = 500;
        [button setImage:[UIImage imageNamed:@"登录2.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(187, 240, 60, 28);
        [button1 setImage:[UIImage imageNamed:@"注册.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(zhuce:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(190, 275, 60, 30);
        [button2 addTarget:self action:@selector(zhaomima:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
        
        
        
        
        UILabel *wla = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        wla.text = @"忘记密码 ？";
        wla.font = [UIFont fontWithName:@"Arial" size:11];
        wla.textAlignment = NSTextAlignmentCenter;
        wla.backgroundColor = [UIColor clearColor];
        wla.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
        [button2 addSubview:wla];
        
        
        
        UILabel * laImag = [[UILabel alloc] init];
        laImag.frame = CGRectMake(20,320,280,20);
        laImag.font = [UIFont fontWithName:@"Arial" size:20];
        laImag.text = @"请输入您的用户名和密码!";
        laImag.textColor = [UIColor grayColor];
        laImag.textAlignment = NSTextAlignmentCenter;
        laImag.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag];
        [laImag release];
        
        UILabel * laImag2 = [[UILabel alloc] init];
        laImag2.frame = CGRectMake(0,350,320,20);
        laImag2.font = [UIFont fontWithName:@"Arial" size:18];
        laImag2.text = @"如果没有账号密码请到公司官网注册!";
        laImag2.textColor = [UIColor grayColor];
        laImag2.textAlignment = NSTextAlignmentCenter;
        laImag2.backgroundColor = [UIColor clearColor];
        [imageView addSubview:laImag2];
        [laImag2 release];
        
      

    }else{
    
    UIImageView * imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,416)];
    [imageView setImage:[UIImage imageNamed:@"登录界面-2-960.png"]];
    
    [self.view addSubview:imageView];
    [imageView release];
   
    
    
    
        textfOne=[[UITextField alloc]initWithFrame:CGRectMake(105, 121, 139, 30)];
        textfOne.placeholder=@"请填写账号";
        textfOne.font=[UIFont fontWithName:@"Arial" size:12];
        // User_ID.borderStyle=UITextBorderStyleRoundedRect;
        textfOne.autocapitalizationType=UITextAutocapitalizationTypeNone;
        textfOne.autocorrectionType=UITextAutocorrectionTypeNo;
        textfOne.keyboardAppearance=UIKeyboardAppearanceAlert;
        textfOne.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        textfOne.returnKeyType=UIReturnKeyDone;
        textfOne.enablesReturnKeyAutomatically=YES;
       // textfOne.secureTextEntry=YES;
        textfOne.tag=100;
        [self.view addSubview:textfOne];
        textfOne.delegate=self;
        [textfOne release];

    
    
    textfTwo=[[UITextField alloc]initWithFrame:CGRectMake(105, 166, 139, 30)];
    textfTwo.autocapitalizationType=UITextAutocapitalizationTypeNone;
    //Password.borderStyle=UITextBorderStyleRoundedRect;
    textfTwo.autocorrectionType=UITextAutocorrectionTypeNo;
    textfTwo.keyboardAppearance=UIKeyboardAppearanceAlert;
    textfTwo.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    textfTwo.returnKeyType=UIReturnKeyDone;
    textfTwo.enablesReturnKeyAutomatically=YES;
    textfTwo.secureTextEntry=YES;
    textfTwo.placeholder=@"请填写密码";
    textfTwo.font= [UIFont fontWithName:@"Arial" size:12];
    textfTwo.tag=222;
    [self.view addSubview:textfTwo];
    textfTwo.delegate=self;
    [textfTwo release];
    
    
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(82, 200, 80, 28);
        button.tag = 500;
        [button setImage:[UIImage imageNamed:@"登录2.png"] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(denglu:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        
        UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        button1.frame = CGRectMake(187, 200, 60, 28);
        [button1 setImage:[UIImage imageNamed:@"注册.png"] forState:UIControlStateNormal];
        [button1 addTarget:self action:@selector(zhuce:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button1];
        
        
        UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        button2.frame = CGRectMake(190, 235, 60, 30);
        [button2 addTarget:self action:@selector(zhaomima:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button2];
        
        
        
        
        UILabel *wla = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 60, 30)];
        wla.text = @"忘记密码 ？";
        wla.font = [UIFont fontWithName:@"Arial" size:11];
        wla.textAlignment = NSTextAlignmentCenter;
        wla.backgroundColor = [UIColor clearColor];
        wla.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
        [button2 addSubview:wla];
        
    
    
    
    UILabel * laImag = [[UILabel alloc] init];
    laImag.frame = CGRectMake(20,280,280,20);
    laImag.font = [UIFont fontWithName:@"Arial" size:20];
    laImag.text = @"请输入您的用户名和密码!";
    laImag.textColor = [UIColor grayColor];
    laImag.textAlignment = NSTextAlignmentCenter;
    laImag.backgroundColor = [UIColor clearColor];
    [imageView addSubview:laImag];
    [laImag release];
    
    UILabel * laImag2 = [[UILabel alloc] init];
    laImag2.frame = CGRectMake(0,310,320,20);
    laImag2.font = [UIFont fontWithName:@"Arial" size:18];
    laImag2.text = @"如果没有账号密码请到公司官网注册!";
    laImag2.textColor = [UIColor grayColor];
    laImag2.textAlignment = NSTextAlignmentCenter;
    laImag2.backgroundColor = [UIColor clearColor];
    [imageView addSubview:laImag2];
    [laImag2 release];
    
 
        
    }

    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 180)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 100) {
        
        self.oneTe = textfOne.text;
        self.twoTe = textfTwo.text;
        NSLog(@"one  %@",oneTe);
        NSLog(@"two  %@",twoTe);
        
        [textfOne resignFirstResponder];
        [textfTwo resignFirstResponder];
    }
    if (textField.tag == 222) {
        
        
        self.oneTe = textfOne.text;
        self.twoTe = textfTwo.text;
        NSLog(@"one  %@",oneTe);
        NSLog(@"two  %@",twoTe);
        [textfOne resignFirstResponder];
        [textfTwo resignFirstResponder];
        
    }
    
    return  YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    self.oneTe = textfOne.text;
    self.twoTe = textfTwo.text;
    
    NSLog(@"one  %@",oneTe);
    NSLog(@"two  %@",twoTe);
    
    [textfOne resignFirstResponder];
    [textfTwo resignFirstResponder];
    
}


-(void)dealloc
{
    requestaa = nil;
    
    [super dealloc];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
