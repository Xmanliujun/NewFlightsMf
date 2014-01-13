//
//  ZhenJianHaoViewController.m
//  Flights
//
//  Created by mac on 13-7-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ZhenJianHaoViewController.h"
#import "ASIHTTPRequest.h"

@interface ZhenJianHaoViewController ()

@end

@implementation ZhenJianHaoViewController
@synthesize start;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
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
    
    NSLog(@"用户名找回: %@",[request responseString]);
    
    
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
    
    NSString * rsaString = [NSString stringWithFormat:@"http://139.210.99.29:83/index.php/home/regedit/get_pass?types=2&content=%@",zhengjianhao.text];
    
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
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 180, 30)];
    label.backgroundColor = [UIColor clearColor];
    label.text = @"证件号:";
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:label];
    
    UIImageView * image1= [[UIImageView alloc] initWithFrame:CGRectMake(70,50,180,40)];
    [image1 setImage:[UIImage imageNamed:@"注册输入框.png"]];
    
    [self.view addSubview:image1];
    [image1 release];
    
    zhengjianhao=[[UITextField alloc]initWithFrame:CGRectMake(70, 50, 180, 40)];
    zhengjianhao.placeholder=@"请输入证件号";
    zhengjianhao.font=[UIFont fontWithName:@"Arial" size:15];
    // zhengjianhao.borderStyle=UITextBorderStyleRoundedRect;//
    zhengjianhao.autocapitalizationType=UITextAutocapitalizationTypeNone;
    zhengjianhao.autocorrectionType=UITextAutocorrectionTypeNo;
    zhengjianhao.keyboardAppearance=UIKeyboardAppearanceAlert;
    zhengjianhao.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    zhengjianhao.returnKeyType=UIReturnKeyDone;
    zhengjianhao.enablesReturnKeyAutomatically=YES;
    zhengjianhao.tag=100;
    [self.view addSubview:zhengjianhao];
    zhengjianhao.delegate=self;
    [zhengjianhao release];
    
    button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(70, 110, 180, 40);
    [button addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [button setImage:[UIImage imageNamed:@"注册完成.png"] forState:UIControlStateNormal];
    [self.view addSubview:button];
    
    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 180)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];

}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    NSString * text1 = [NSString stringWithFormat:@"%@",textField.text];
    NSLog(@"%@ ",text1);
    
    zhengjianhao.frame =CGRectMake(70, 50, 180, 40);
    [zhengjianhao resignFirstResponder];
    
    return YES;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
    zhengjianhao.frame =CGRectMake(70, 50, 180, 40);
    [zhengjianhao resignFirstResponder];
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    zhengjianhao.frame =CGRectMake(70, 50, 180, 40);
}


-(void)btnPressed:(id)sender
{
    [self httpASi];
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
