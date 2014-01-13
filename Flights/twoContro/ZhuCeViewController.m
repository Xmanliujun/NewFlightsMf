//
//  ZhuCeViewController.m
//  Flights
//
//  Created by mac on 13-7-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ZhuCeViewController.h"
#import "AppDelegate.h"
#import "ASIHTTPRequest.h"
@interface ZhuCeViewController ()

@end

@implementation ZhuCeViewController
@synthesize start;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)newView
{
    awardBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    awardBackGroundView.tag = 10003;
    awardBackGroundView.backgroundColor = [UIColor blackColor];
    awardBackGroundView.alpha = 0.6;
    awardBackGroundView.hidden = YES;
    awardBGView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 263, 258)];
    awardBGView.tag = 10004;
    awardBGView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景lkl.png"]];
    awardBGView.hidden = YES;
    
    llbe = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 260, 53)];
    llbe.backgroundColor = [UIColor clearColor];
    llbe.text = @"证件类型";
    llbe.textColor = [UIColor blackColor];
    llbe.textAlignment = NSTextAlignmentCenter;
    [awardBGView addSubview:llbe];
    
    btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.frame = CGRectMake(60, 65, 140, 40);
    btn1.tag = 200;
    [btn1 addTarget:self action:@selector(xuanzhengjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn1 setImage:[UIImage imageNamed:@"注册证件类型背景.png"] forState:UIControlStateNormal];
    lla = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    lla.backgroundColor = [UIColor clearColor];
    lla.text = @"身份证";
    lla.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
    lla.textAlignment = NSTextAlignmentCenter;
    [btn1 addSubview:lla];
    [awardBGView addSubview:btn1];
    
    
    btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(60, 115, 140, 40);
    btn2.tag = 201;
    [btn2 addTarget:self action:@selector(xuanzhengjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn2 setImage:[UIImage imageNamed:@"注册证件类型背景.png"] forState:UIControlStateNormal];
    llb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    llb.backgroundColor = [UIColor clearColor];
    llb.text = @"护照";
    llb.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
    llb.textAlignment = NSTextAlignmentCenter;
    [btn2 addSubview:llb];
    [awardBGView addSubview:btn2];
    
    
    btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn3.frame = CGRectMake(60, 165, 140, 40);
    btn3.tag = 202;
    [btn3 addTarget:self action:@selector(xuanzhengjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn3 setImage:[UIImage imageNamed:@"注册证件类型背景.png"] forState:UIControlStateNormal];
    llc = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    llc.backgroundColor = [UIColor clearColor];
    llc.text = @"军官证";
    llc.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
    llc.textAlignment = NSTextAlignmentCenter;
    [btn3 addSubview:llc];
    [awardBGView addSubview:btn3];
    
    
    btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(60, 215, 140, 40);
    btn4.tag = 203;
    [btn4 addTarget:self action:@selector(xuanzhengjian:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setImage:[UIImage imageNamed:@"注册证件类型背景.png"] forState:UIControlStateNormal];
    lld = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    lld.backgroundColor = [UIColor clearColor];
    lld.text = @"港澳通行证";
    lld.textColor = [UIColor colorWithRed:56/255.0 green:94/255.0 blue:15/255.0 alpha:1.0];
    lld.textAlignment = NSTextAlignmentCenter;
    [btn4 addSubview:lld];
    [awardBGView addSubview:btn4];
    
    
    
    
    aWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
    [awardBackGroundView addSubview:awardBGView];
    [aWindow addSubview:awardBackGroundView];
    [awardBackGroundView release];
    [aWindow addSubview:awardBGView];
    [awardBGView release];
    
    
    
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag ==123) {
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    }else{
        NSLog(@"000");
        
    }
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    [activity stopAnimating];
    start =NO;
    
    
    NSError * error = nil;
    
    NSLog(@"注册: %@",[request responseString]);
    
    
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
    
    NSString * stringSuccess = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Success"]];
    NSString * stringText = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Text"]];
    NSLog(@"aaaa  %@",stringSuccess);
    if ([stringSuccess isEqual:@"success"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringText delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        alert.tag=123;
        [alert show];
        [alert release];
        
        
    }else {
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringText delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
        
        
        
        [alert show];
        [alert release];
        
        
    }
    
    
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    
    NSLog(@"error is  %@",[request responseString]);
    
}

-(void)httpASi
{
    
    NSString * rsaString = [NSString stringWithFormat:@"http://139.210.99.29:83/index.php/home/regedit/phone_reg?username=%@&realname=%@&password=%@&passport_type=%@&passport_no=%@&telphone=%@&email=%@",tf1.text,tf2.text,tf3.text,label.text,tf4.text,tf5.text,tf6.text];
    
    NSLog(@"jString  %@",rsaString);
    rsaString = [rsaString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL * url = [NSURL URLWithString:rsaString];
    
    requestaa = [ASIHTTPRequest requestWithURL:url];
    [requestaa setTag:1000];
    [requestaa setDelegate:self];
    [requestaa startAsynchronous];
    [activity startAnimating];
    
    start = YES;
    
    
    
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
    
    
    UIImageView * imageView= [[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)];
    [imageView setImage:[UIImage imageNamed:@"注册背景.png"]];
    
    [self.view addSubview:imageView];
    [imageView release];
    
    la1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 15, 80, 30)];
    la1.text = @"用户名 :";
    la1.backgroundColor = [UIColor clearColor];
    la1.textColor = [UIColor grayColor];
    la1.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la1];
    
    
    la2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 60, 80, 30)];
    la2.text = @"真实姓名 :";
    la2.backgroundColor = [UIColor clearColor];
    la2.textColor = [UIColor grayColor];
    la2.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la2];
    
    la3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 105, 80, 30)];
    la3.text = @"密码 :";
    la3.backgroundColor = [UIColor clearColor];
    la3.textColor = [UIColor grayColor];
    la3.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la3];
    
    la4 = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 80, 30)];
    la4.text = @"证件类型 :";
    la4.backgroundColor = [UIColor clearColor];
    la4.textColor = [UIColor grayColor];
    la4.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la4];
    
    la5 = [[UILabel alloc] initWithFrame:CGRectMake(0, 195, 80, 30)];
    la5.text = @"证件号 :";
    la5.backgroundColor = [UIColor clearColor];
    la5.textColor = [UIColor grayColor];
    la5.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la5];
    
    la6 = [[UILabel alloc] initWithFrame:CGRectMake(0, 240, 80, 30)];
    la6.text = @"电话号 :";
    la6.backgroundColor = [UIColor clearColor];
    la6.textColor = [UIColor grayColor];
    la6.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la6];
    
    la7 = [[UILabel alloc] initWithFrame:CGRectMake(0, 285, 80, 30)];
    la7.text = @"邮箱 :";
    la7.backgroundColor = [UIColor clearColor];
    la7.textColor = [UIColor grayColor];
    la7.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:la7];
    
    
    
    UIImageView * image1= [[UIImageView alloc] initWithFrame:CGRectMake(100,15,150,30)];
    [image1 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image1];
    [image1 release];
    
    tf1=[[UITextField alloc]initWithFrame:CGRectMake(100, 15, 150, 30)];
    tf1.placeholder=@"请使用英文字母";
    tf1.font=[UIFont fontWithName:@"Arial" size:15];
    // tf1.borderStyle=UITextBorderStyleRoundedRect;//
    tf1.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf1.autocorrectionType=UITextAutocorrectionTypeNo;
    tf1.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf1.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf1.returnKeyType=UIReturnKeyDone;
    tf1.enablesReturnKeyAutomatically=YES;
    tf1.tag=100;
    [self.view addSubview:tf1];
    tf1.delegate=self;
    [tf1 release];
    
    
    
    UIImageView * image2= [[UIImageView alloc] initWithFrame:CGRectMake(100,60,150,30)];
    [image2 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image2];
    [image2 release];
    
    tf2=[[UITextField alloc]initWithFrame:CGRectMake(100, 60, 150, 30)];
    tf2.placeholder=@"真实姓名";
    tf2.font=[UIFont fontWithName:@"Arial" size:15];
    // tf2.borderStyle=UITextBorderStyleRoundedRect;//
    tf2.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf2.autocorrectionType=UITextAutocorrectionTypeNo;
    tf2.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf2.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf2.returnKeyType=UIReturnKeyDone;
    tf2.enablesReturnKeyAutomatically=YES;
    tf2.tag=101;
    [self.view addSubview:tf2];
    tf2.delegate=self;
    [tf2 release];
    
    
    UIImageView * image3= [[UIImageView alloc] initWithFrame:CGRectMake(100,105,150,30)];
    [image3 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image3];
    [image3 release];
    
    tf3=[[UITextField alloc]initWithFrame:CGRectMake(100, 105, 150, 30)];
    tf3.placeholder=@"密码";
    tf3.font=[UIFont fontWithName:@"Arial" size:15];
    //  tf3.borderStyle=UITextBorderStyleRoundedRect;//
    tf3.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf3.autocorrectionType=UITextAutocorrectionTypeNo;
    tf3.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf3.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf3.returnKeyType=UIReturnKeyDone;
    tf3.enablesReturnKeyAutomatically=YES;
    tf3.tag=102;
    [self.view addSubview:tf3];
    tf3.delegate=self;
    [tf3 release];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100 , 150, 150, 30);
    [button addTarget:self action:@selector(zhengjian:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"注册证件类型背景.png"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 150, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"证件类型";
    label.textColor = [UIColor grayColor];
    label.textAlignment = NSTextAlignmentCenter;
    [button addSubview:label];
    
    
    UIImageView * image4= [[UIImageView alloc] initWithFrame:CGRectMake(100,195,150,30)];
    [image4 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image4];
    [image4 release];
    
    tf4=[[UITextField alloc]initWithFrame:CGRectMake(100, 195, 150, 30)];
    tf4.placeholder=@"证件号";
    tf4.font=[UIFont fontWithName:@"Arial" size:15];
    //  tf4.borderStyle=UITextBorderStyleRoundedRect;//
    tf4.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf4.autocorrectionType=UITextAutocorrectionTypeNo;
    tf4.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf4.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf4.returnKeyType=UIReturnKeyDone;
    tf4.enablesReturnKeyAutomatically=YES;
    tf4.tag=103;
    [self.view addSubview:tf4];
    tf4.delegate=self;
    [tf4 release];
    
    
    UIImageView * image5= [[UIImageView alloc] initWithFrame:CGRectMake(100,240,150,30)];
    [image5 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image5];
    [image5 release];
    
    tf5=[[UITextField alloc]initWithFrame:CGRectMake(100, 240, 150, 30)];
    tf5.placeholder=@"电话号";
    tf5.font=[UIFont fontWithName:@"Arial" size:15];
    // tf5.borderStyle=UITextBorderStyleRoundedRect;//
    tf5.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf5.autocorrectionType=UITextAutocorrectionTypeNo;
    tf5.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf5.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf5.returnKeyType=UIReturnKeyDone;
    tf5.enablesReturnKeyAutomatically=YES;
    tf5.tag=104;
    [self.view addSubview:tf5];
    tf5.delegate=self;
    [tf5 release];
    
    
    UIImageView * image6= [[UIImageView alloc] initWithFrame:CGRectMake(100,285,150,30)];
    [image6 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image6];
    [image6 release];
    
    tf6=[[UITextField alloc]initWithFrame:CGRectMake(100, 285, 150, 30)];
    tf6.placeholder=@"邮箱";
    tf6.font=[UIFont fontWithName:@"Arial" size:15];
    // tf6.borderStyle=UITextBorderStyleRoundedRect;//
    tf6.autocapitalizationType=UITextAutocapitalizationTypeNone;
    tf6.autocorrectionType=UITextAutocorrectionTypeNo;
    tf6.keyboardAppearance=UIKeyboardAppearanceAlert;
    tf6.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    tf6.returnKeyType=UIReturnKeyDone;
    tf6.enablesReturnKeyAutomatically=YES;
    tf6.tag=105;
    [self.view addSubview:tf6];
    tf6.delegate=self;
    [tf6 release];
    
    
    UIButton *wbutton = [UIButton buttonWithType:UIButtonTypeCustom];
    wbutton.frame = CGRectMake(90, 340, 140, 40);
    [wbutton addTarget:self action:@selector(wancheng:) forControlEvents:UIControlEventTouchUpInside];
    [wbutton setImage:[UIImage imageNamed:@"注册完成.png"] forState:UIControlStateNormal];
    [self.view addSubview:wbutton];
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 180)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag ==100) {
        
        NSString * text1 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text1);
        NSLog(@"111");
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf1 resignFirstResponder];
        
        
    }else if (textField.tag ==101){
        
        NSString * text2 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text2);
        NSLog(@"222");
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf2 resignFirstResponder];
        
        
    }else if (textField.tag ==102){
        
        NSString * text3 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text3);
        NSLog(@"333");
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf3 resignFirstResponder];
        
        
    }else if (textField.tag ==103){
        
        NSString * text4 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text4);
        NSLog(@"444");
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf4 resignFirstResponder];
        
        
    }else if (textField.tag ==104){
        
        NSString * text5 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text5);
        NSLog(@"555");
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf5 resignFirstResponder];
        
        
    }else if (textField.tag ==105){
        NSLog(@"666");
        NSString * text6 = [NSString stringWithFormat:@"%@",textField.text];
        NSLog(@"输入记录 %@",text6);
        NSLog(@"1%@ ",tf1.text);
        NSLog(@"2%@ ",tf2.text);
        NSLog(@"3%@ ",tf3.text);
        NSLog(@"4%@ ",tf4.text);
        NSLog(@"5%@ ",tf5.text);
        NSLog(@"6%@ ",tf6.text);
        
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        [tf6 resignFirstResponder];
        
        
        
        
    }
    
    return YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    tf1.frame = CGRectMake(100, 15, 150, 30);
    tf2.frame = CGRectMake(100, 60, 150, 30);
    tf3.frame = CGRectMake(100, 105, 150, 30);
    tf4.frame = CGRectMake(100, 195, 150, 30);
    tf5.frame = CGRectMake(100, 240, 150, 30);
    tf6.frame = CGRectMake(100, 285, 150, 30);
    
    la1.frame = CGRectMake(0, 15, 80, 30);
    la2.frame = CGRectMake(0, 60, 80, 30);
    la3.frame = CGRectMake(0, 105, 80, 30);
    la5.frame = CGRectMake(0, 195, 80, 30);
    la6.frame = CGRectMake(0, 240, 80, 30);
    la7.frame = CGRectMake(0, 285, 80, 30);
    
    [tf1 resignFirstResponder];
    [tf2 resignFirstResponder];
    [tf3 resignFirstResponder];
    [tf4 resignFirstResponder];
    [tf5 resignFirstResponder];
    [tf6 resignFirstResponder];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    if (textField.tag ==103) {
        
        tf1.frame = CGRectMake(100, -30, 150, 30);
        tf2.frame = CGRectMake(100, -75, 150, 30);
        tf3.frame = CGRectMake(100, -120, 150, 30);
        tf4.frame = CGRectMake(100, 15, 150, 30);
        tf5.frame = CGRectMake(100, 60, 150, 30);
        tf6.frame = CGRectMake(100, 105, 150, 30);
        
        la1.frame = CGRectMake(0, -30, 80, 30);
        la2.frame = CGRectMake(0, -75, 80, 30);
        la3.frame = CGRectMake(0, -120, 80, 30);
        la5.frame = CGRectMake(0, 15, 80, 30);
        la6.frame = CGRectMake(0, 60, 80, 30);
        la7.frame = CGRectMake(0, 105, 80, 30);
        
    }else if (textField.tag ==104){
        
        
        tf1.frame = CGRectMake(100, -30, 150, 30);
        tf2.frame = CGRectMake(100, -75, 150, 30);
        tf3.frame = CGRectMake(100, -120, 150, 30);
        tf4.frame = CGRectMake(100, 15, 150, 30);
        tf5.frame = CGRectMake(100, 60, 150, 30);
        tf6.frame = CGRectMake(100, 105, 150, 30);
        
        la1.frame = CGRectMake(0, -30, 80, 30);
        la2.frame = CGRectMake(0, -75, 80, 30);
        la3.frame = CGRectMake(0, -120, 80, 30);
        la5.frame = CGRectMake(0, 15, 80, 30);
        la6.frame = CGRectMake(0, 60, 80, 30);
        la7.frame = CGRectMake(0, 105, 80, 30);
        
    }else if (textField.tag ==105){
        
        tf1.frame = CGRectMake(100, -30, 150, 30);
        tf2.frame = CGRectMake(100, -75, 150, 30);
        tf3.frame = CGRectMake(100, -120, 150, 30);
        tf4.frame = CGRectMake(100, 15, 150, 30);
        tf5.frame = CGRectMake(100, 60, 150, 30);
        tf6.frame = CGRectMake(100, 105, 150, 30);
        
        la1.frame = CGRectMake(0, -30, 80, 30);
        la2.frame = CGRectMake(0, -75, 80, 30);
        la3.frame = CGRectMake(0, -120, 80, 30);
        la5.frame = CGRectMake(0, 15, 80, 30);
        la6.frame = CGRectMake(0, 60, 80, 30);
        la7.frame = CGRectMake(0, 105, 80, 30);
        
    }else{
        
        
        tf1.frame = CGRectMake(100, 15, 150, 30);
        tf2.frame = CGRectMake(100, 60, 150, 30);
        tf3.frame = CGRectMake(100, 105, 150, 30);
        tf4.frame = CGRectMake(100, 195, 150, 30);
        tf5.frame = CGRectMake(100, 240, 150, 30);
        tf6.frame = CGRectMake(100, 285, 150, 30);
        
        la1.frame = CGRectMake(0, 15, 80, 30);
        la2.frame = CGRectMake(0, 60, 80, 30);
        la3.frame = CGRectMake(0, 105, 80, 30);
        la5.frame = CGRectMake(0, 195, 80, 30);
        la6.frame = CGRectMake(0, 240, 80, 30);
        la7.frame = CGRectMake(0, 285, 80, 30);
        
    }
    
}

-(void)zhengjian:(id)sender
{
    NSLog(@"证件");
    [self newView];
    awardBackGroundView.hidden = NO;
    awardBGView.hidden = NO;
    
}

-(void)xuanzhengjian:(UIButton *)button
{
    
    NSLog(@"选择证件号view");
    
    awardBackGroundView.hidden = YES;
    awardBGView.hidden = YES;
    
    
    if (button.tag ==200) {
        
        label.text = lla.text;
        
    }else if (button.tag ==201){
        
        label.text = llb.text;
        
    }else if (button.tag ==202){
        
        
        label.text =llc.text;
        
    }else if (button.tag ==203){
        
        
        label.text = lld.text;
        
    }
    
    
    
}

-(void)wancheng:(id)sender
{
    
    
    NSString *_label = [NSString stringWithFormat:@"%@",label.text];
    NSString *_tf1 = [NSString stringWithFormat:@"%@",tf1.text];
    NSString *_tf2 = [NSString stringWithFormat:@"%@",tf2.text];
    NSString *_tf3 = [NSString stringWithFormat:@"%@",tf3.text];
    NSString *_tf4 = [NSString stringWithFormat:@"%@",tf4.text];
    NSString *_tf5 = [NSString stringWithFormat:@"%@",tf5.text];
    NSString *_tf6 = [NSString stringWithFormat:@"%@",tf6.text];
    
    if ([_label isEqualToString:@"证件类型"] || _tf1 == nil || _tf2 == nil || _tf3 == nil || _tf4 == nil || _tf5 == nil || _tf6 == nil) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将信息填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
    }else{
        
        
        [self httpASi];
        
        
    }
    
    
    
    
    
}

-(void)btnFanHui:(id)sender
{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
