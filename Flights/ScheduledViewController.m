//
//  ScheduledViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "ScheduledViewController.h"
#import "BerthViewController.h"
#import "AppDelegate.h"
#import "DingDanController.h"
#import "DengLuViewController.h"
#import "DengLuXML.h"
#import "RemDengLu.h"
#import "MyNewXmlMolde.h"

@interface ScheduledViewController ()

@end
@implementation ScheduledViewController

@synthesize q_awardLabel,q_alipayLabel,q_phoneCardLabel,q_onpheLabel,q_awardChoBtn_ali,q_awardChoBtn_Pho,q_awardChoBtnu_Pho,q_sureBtn,q_cancelBtn,_array,zPirce,chufaming,didaming,la;
@synthesize name,Passport_no;
@synthesize y_sto,y_stp;
@synthesize baoXian;
@synthesize dingDanZh;
@synthesize fristOne;
@synthesize ssr;
@synthesize tiJiArray;
@synthesize yy_Array;
@synthesize cssanzm,cssanzm2;
@synthesize yy_label1,yy_label2,yy_label3,yy_label4,yy_label5,yy_label6;
@synthesize twoString;
@synthesize yy_ZheKou;
@synthesize yy_Qi,yy_Di;
@synthesize yy_Jia,yy_Ji,yy_Ran,yy_Tui,jixing;



@synthesize awardLabel,alipayLabel,phoneCardLabel,onpheLabel;
@synthesize awardChoBtn_ali,awardChoBtn_Pho,awardChoBtnu_Pho,sureBtn,cancelBtn;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithOneItem:(MyNewXmlMolde *)oneItem WithArray:(NSMutableArray *)myarray withtwoArray:(NSMutableArray *)twomyArray
{
    
    if (self = [super init]) {
        self.fristOne = oneItem ;
        self.tiJiArray = [NSMutableArray arrayWithArray:myarray];
        self.yy_Array = [NSMutableArray arrayWithArray:twomyArray];
        
        
        
    }
    
    
    return self;
    
}


-(void)dealloc
{
     [super dealloc];
    [lba release];
    [lbb release];
    [lbc release];
    [lbd release];
    [labue release];
    [tf release];
 
    [tfr release];
    [tft release];
    [lasb release];
    [ls release];
    [tabView release];
    [awardLabel release];
    [alipayLabel release];
    [phoneCardLabel release];
    [onpheLabel release];
    [q_awardLabel release];
    [q_alipayLabel release];
    [q_phoneCardLabel release];
    [q_onpheLabel release];
   
    [fristOne release];
    [yy_Array release];
    [twoString release];


   
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
        awardBGView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景.png"]];
        awardBGView.hidden = YES;
        
        
        awardLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 6, 200,19 )];
        awardLabel.text = @"请选择取票方式";
        awardLabel.font = [UIFont systemFontOfSize:15.0f];
        awardLabel.textAlignment = NSTextAlignmentCenter;
        awardLabel.backgroundColor = [UIColor clearColor];
        [awardBGView addSubview:awardLabel];
        
        alipayLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 45, 100, 30)];
        alipayLabel.text = @"J-机场取票";
        alipayLabel.font = [UIFont systemFontOfSize:15.0f];
        alipayLabel.textAlignment = NSTextAlignmentCenter;
        alipayLabel.backgroundColor = [UIColor clearColor];
        [awardBGView addSubview:alipayLabel];
        
        phoneCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 105, 100, 30)];
        phoneCardLabel.text = @"S-送票上门";
        phoneCardLabel.font = [UIFont systemFontOfSize:15.0f];
        phoneCardLabel.textAlignment = NSTextAlignmentCenter;
        phoneCardLabel.backgroundColor = [UIColor whiteColor];
        [awardBGView addSubview:phoneCardLabel];
        
        
        onpheLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 170, 100, 30)];
        onpheLabel.text = @"Q-前台自取";
        onpheLabel.font = [UIFont systemFontOfSize:15.0f];
        onpheLabel.textAlignment = NSTextAlignmentCenter;
        onpheLabel.backgroundColor = [UIColor clearColor];
        [awardBGView addSubview:onpheLabel];
        
        awardChoBtn_ali = [UIButton buttonWithType:UIButtonTypeCustom];
        [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        awardChoBtn_ali.tag = 10001;
        [awardChoBtn_ali addTarget:self action:@selector(rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        awardChoBtn_ali.frame = CGRectMake(207, 45, 35, 35);
        [awardBGView addSubview:awardChoBtn_ali];
        awardChoBtn_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        awardChoBtn_Pho.tag = 10002;
        [awardChoBtn_Pho addTarget:self action:@selector(rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        awardChoBtn_Pho.frame = CGRectMake(207, 105, 35, 35);
        [awardBGView addSubview:awardChoBtn_Pho];
        
        awardChoBtnu_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        awardChoBtnu_Pho.tag = 10005;
        [awardChoBtnu_Pho addTarget:self action:@selector(rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        awardChoBtnu_Pho.frame = CGRectMake(207, 170, 35, 35);
        [awardBGView addSubview:awardChoBtnu_Pho];
        
        
        sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        sureBtn.frame = CGRectMake(50, 220, 66, 29);
        [sureBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
        [sureBtn addTarget:self action:@selector(sureBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [awardBGView addSubview:sureBtn];
        
        cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(148, 220, 66, 29);
        [cancelBtn addTarget:self action:@selector(cancelBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
        [awardBGView addSubview:cancelBtn];
        
        aWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
        [awardBackGroundView addSubview:awardBGView];
        [aWindow addSubview:awardBackGroundView];
        [awardBackGroundView release];
        [aWindow addSubview:awardBGView];
        [awardBGView release];
        
    

}

-(void)helpView
{
            
        q_awardBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        q_awardBackGroundView.tag = 103;
        q_awardBackGroundView.backgroundColor = [UIColor blackColor];
        q_awardBackGroundView.alpha = 0.6;
        q_awardBackGroundView.hidden = YES;
        q_awardBGView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 263, 258)];
        q_awardBGView.tag = 104;
        q_awardBGView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景.png"]];
        q_awardBGView.hidden = YES;
        
        
        q_awardLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 6, 200,19 )];
        q_awardLabel.text = @"请选择保险";
        q_awardLabel.font = [UIFont systemFontOfSize:15.0f];
        q_awardLabel.textAlignment = NSTextAlignmentCenter;
        q_awardLabel.backgroundColor = [UIColor clearColor];
        [q_awardBGView addSubview:q_awardLabel];
        
        q_alipayLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 45, 100, 30)];
        q_alipayLabel.text = @"1份";
        q_alipayLabel.font = [UIFont systemFontOfSize:15.0f];
        q_alipayLabel.textAlignment = NSTextAlignmentCenter;
        q_alipayLabel.backgroundColor = [UIColor clearColor];
        [q_awardBGView addSubview:q_alipayLabel];
        
        q_phoneCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 105, 100, 30)];
        q_phoneCardLabel.text = @"2份";
        q_phoneCardLabel.font = [UIFont systemFontOfSize:15.0f];
        q_phoneCardLabel.textAlignment = NSTextAlignmentCenter;
        q_phoneCardLabel.backgroundColor = [UIColor whiteColor];
        [q_awardBGView addSubview:q_phoneCardLabel];
        
        
        q_onpheLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 170, 100, 30)];
        q_onpheLabel.text = @"不买";
        q_onpheLabel.font = [UIFont systemFontOfSize:15.0f];
        q_onpheLabel.textAlignment = NSTextAlignmentCenter;
        q_onpheLabel.backgroundColor = [UIColor clearColor];
        [q_awardBGView addSubview:q_onpheLabel];
        
        q_awardChoBtn_ali = [UIButton buttonWithType:UIButtonTypeCustom];
        [q_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        q_awardChoBtn_ali.tag = 101;
        [q_awardChoBtn_ali addTarget:self action:@selector(q_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        q_awardChoBtn_ali.frame = CGRectMake(207, 45, 35, 35);
        [q_awardBGView addSubview:q_awardChoBtn_ali];
        
        q_awardChoBtn_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        q_awardChoBtn_Pho.tag = 102;
        [q_awardChoBtn_Pho addTarget:self action:@selector(q_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [q_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        q_awardChoBtn_Pho.frame = CGRectMake(207, 105, 35, 35);
        [q_awardBGView addSubview:q_awardChoBtn_Pho];
        
        q_awardChoBtnu_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        q_awardChoBtnu_Pho.tag = 105;
        [q_awardChoBtnu_Pho addTarget:self action:@selector(q_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [q_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        q_awardChoBtnu_Pho.frame = CGRectMake(207, 170, 35, 35);
        [q_awardBGView addSubview:q_awardChoBtnu_Pho];
        
        
        q_sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        q_sureBtn.frame = CGRectMake(50, 220, 66, 29);
        [q_sureBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
        [q_sureBtn addTarget:self action:@selector(q_sureBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [q_awardBGView addSubview:q_sureBtn];
        
        q_cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        q_cancelBtn.frame = CGRectMake(148, 220, 66, 29);
        [q_cancelBtn addTarget:self action:@selector(q_cancelBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [q_cancelBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
        [q_awardBGView addSubview:q_cancelBtn];
        
        _bWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
        [q_awardBackGroundView addSubview:q_awardBGView];
        [_bWindow addSubview:q_awardBackGroundView];
        [q_awardBackGroundView release];
        [_bWindow addSubview:q_awardBGView];
        [q_awardBGView release];

  
}

-(void)duorenPressed:(id)sender
{
    NSLog(@"添加乘机人 button ");
    
    if (yy_label6.text !=nil) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"最多可预定三人！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];

        
    }else{

    
    yy_view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 200)];
    yy_view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:yy_view];
    
    yy_tf =[[UITextField alloc]initWithFrame:CGRectMake(60, 10, 200, 50)];
    yy_tf.borderStyle=UITextBorderStyleRoundedRect;
    yy_tf.placeholder=@"乘机人姓名";
    yy_tf.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    yy_tf.keyboardType=UIKeyboardTypeNamePhonePad;
    yy_tf.returnKeyType = UIReturnKeyDone;
    yy_tf.tag=999;
    yy_tf.delegate=self;
    [self.view addSubview:yy_tf];
    
    yy_tp =[[UITextField alloc]initWithFrame:CGRectMake(60, 80, 200, 50)];
    yy_tp.borderStyle=UITextBorderStyleRoundedRect;
    yy_tp.placeholder=@"乘机人身份证号";
    yy_tp.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
    yy_tp.keyboardType=UIKeyboardTypeNamePhonePad;
    yy_tp.returnKeyType = UIReturnKeyDone;
    yy_tp.tag=888;
    yy_tp.delegate=self;
    [self.view addSubview:yy_tp];
    
    yy_butt = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    yy_butt.frame = CGRectMake(110, 150, 100, 40);
    [yy_butt addTarget:self  action:@selector(quedingPressed:) forControlEvents:UIControlEventTouchUpInside];
    [yy_butt setTitle:@"确定" forState:UIControlStateNormal];
    [yy_view addSubview:yy_butt];
        
    }
    
        
}

-(void)quedingPressed:(id)sender
{
    NSLog(@"添加乘机人后确定");
    
        
    
    yy_view.hidden = YES;
    yy_tf.hidden = YES;
    yy_tp.hidden = YES;
    
    
    NSString *_tf2 = [NSString stringWithFormat:@"%@",yy_tf.text];
    NSString *_tp2 = [NSString stringWithFormat:@"%@",yy_tp.text];
    
    if ([_tf2 isEqualToString:@"(null)"] || [_tp2 isEqualToString:@"(null)"]) {
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请填写乘机人信息！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else{
        
        
    
    
    if (yy_label3.text == nil) {
        
        yy_label3.text = [NSString stringWithFormat:@"%@",yy_tf.text];
        yy_label4.text = [NSString stringWithFormat:@"%@",yy_tp.text];

        if (yy_label4.text != NULL) {
            int a = [self.fristOne.ccSinglePrice intValue];
            int b = [self.fristOne.ccTax intValue];
            int c = [self.fristOne.ccFuel intValue];
            
            
            int g = a + b + c;
            
            
            self.zPirce = [NSString stringWithFormat:@"%d",g*2];
            NSLog(@"55555555 %@",self.zPirce);
            

            la.text= [NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];

    
            self.twoString = [NSString stringWithFormat:@"2"];
            

        }

    }
         
               
    else if (yy_label3.text != nil ){
        
        yy_label5.text = [NSString stringWithFormat:@"%@",yy_tf.text];
        yy_label6.text = [NSString stringWithFormat:@"%@",yy_tp.text];

        
         if (yy_label6.text != NULL){
            
            int a = [self.fristOne.ccSinglePrice intValue];
            int b = [self.fristOne.ccTax intValue];
            int c = [self.fristOne.ccFuel intValue];
            
            
            int g = a + b + c;
            
            
            self.zPirce = [NSString stringWithFormat:@"%d",g*3];
            NSLog(@"666666666 %@",self.zPirce);
            

            la.text= [NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];

             self.twoString = [NSString stringWithFormat:@"3"];

            
            }

        }
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

    
    
    NSLog(@"11111111111 %@",yy_ZheKou);
    NSLog(@"22222222222 %@",yy_Qi);
    NSLog(@"33333333333 %@",yy_Di);
    NSLog(@"44444444444 %@",yy_Jia);
    NSLog(@"55555555555 %@",yy_Ji);
    NSLog(@"66666666666 %@",yy_Ran);
    NSLog(@"77777777777 %@",yy_Tui);
    NSLog(@"88888888888 %@",jixing);
    
    [self newView];
    [self helpView];
    
    self.twoString = [NSString stringWithFormat:@"1"];
    NSLog(@" twoString is   %@",twoString);
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    UIButton * bttun = [UIButton buttonWithType:UIButtonTypeCustom];
    bttun.frame = CGRectMake(0, 0, 35, 25);
    [bttun setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [bttun addTarget:self action:@selector(bttunFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bowbtn = [[[UIBarButtonItem alloc] initWithCustomView:bttun] autorelease];
    
    self.navigationItem.leftBarButtonItem = bowbtn;
    
            
        imageView= [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)] autorelease];
        [imageView setImage:[UIImage imageNamed:@"灰背景.png"]];
        [self.view addSubview:imageView];
    
    
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    name = [defaults objectForKey:@"name"];
    self.Passport_no = [defaults objectForKey:@"Passport_no"];

    NSLog(@"passport_no is %@",self.Passport_no);
    
    yy_label1 = [[UILabel alloc] initWithFrame:CGRectMake(20, 0, 200, 25)];
    yy_label1.backgroundColor = [UIColor clearColor];
    yy_label1.text =name;
    yy_label1.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yy_label1];
    [yy_label1 release];
    
    yy_label2=[[UILabel alloc]initWithFrame:CGRectMake(20, 25, 200, 25)];
    yy_label2.backgroundColor = [UIColor clearColor];
    yy_label2.text = Passport_no;
    yy_label2.textAlignment=NSTextAlignmentLeft;
    [self.view addSubview:yy_label2];
    [yy_label2 release];
    
    yy_label3 =[[UILabel alloc]initWithFrame:CGRectMake(20, 50, 200, 25)];
    yy_label3.backgroundColor = [UIColor clearColor];
    yy_label3.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yy_label3];
    [yy_label3 release];
    
    yy_label4 = [[UILabel alloc]initWithFrame:CGRectMake(20, 75, 200, 25)];
    yy_label4.backgroundColor = [UIColor clearColor];
    yy_label4.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yy_label4];
    [yy_label4 release];
    
    yy_label5 = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, 200, 25)];
    yy_label5.backgroundColor = [UIColor clearColor];
    yy_label5.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yy_label5];
    [yy_label5 release];
    
    yy_label6 = [[UILabel alloc]initWithFrame:CGRectMake(20, 125, 200, 25)];
    yy_label6.backgroundColor = [UIColor clearColor];
    yy_label6.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:yy_label6];
    [yy_label6 release];
    
    
    
    UIButton *yy_button = [UIButton buttonWithType:UIButtonTypeCustom];
    yy_button.frame = CGRectMake(230, 5, 80, 50);
    [yy_button addTarget:self action:@selector(duorenPressed:) forControlEvents:UIControlEventTouchUpInside];
    [yy_button setImage:[UIImage imageNamed:@"增加乘机人.png"]forState:UIControlStateNormal];
    [self.view addSubview:yy_button];
    

    
    UILabel *slabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 170, 100, 30)];
    slabel.text = @"送票地址 :";
    slabel.backgroundColor = [UIColor clearColor];
    slabel.textAlignment = NSTextAlignmentCenter;
    slabel.textColor = [UIColor blackColor];
    [self.view addSubview:slabel];
    
        tfw=[[UITextField alloc]initWithFrame:CGRectMake(120, 170, 200, 30)];
        tfw.borderStyle=UITextBorderStyleRoundedRect;
        tfw.placeholder=@"请输入地址";
        tfw.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        tfw.keyboardType=UIKeyboardTypeNamePhonePad;
        tfw.returnKeyType = UIReturnKeyDone;
        tfw.tag=444;
        tfw.delegate=self;
        [self.view addSubview:tfw];

    
        lbb=[[UILabel alloc]initWithFrame:CGRectMake(20, 210, 100, 30)];
        lbb.text=@"联系电话 :";
        lbb.backgroundColor=[UIColor clearColor];
        lbb.textAlignment=NSTextAlignmentCenter;
        lbb.textColor=[UIColor blackColor];
        [self.view addSubview:lbb];
        
        tft=[[UITextField alloc]initWithFrame:CGRectMake(120, 210, 200, 30)];
        tft.borderStyle=UITextBorderStyleRoundedRect;
        tft.placeholder=@"用作短信提示";
        tft.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        tft.keyboardType=UIKeyboardTypeNamePhonePad;
        tft.returnKeyType = UIReturnKeyDone;
        tft.tag=666;
        tft.delegate=self;
        [self.view addSubview:tft];
        
        lasb=[[UILabel alloc]initWithFrame:CGRectMake(20, 250, 100, 25)];
        lasb.backgroundColor=[UIColor clearColor];
        lasb.text=@"选择保险 :";
        lasb.textAlignment=NSTextAlignmentCenter;
        lasb.textColor=[UIColor blackColor];
        [self.view addSubview:lasb];
        
        bbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        bbtn.frame=CGRectMake(120, 250, 150, 30);
        [bbtn setImage:[UIImage imageNamed:@"5.jpg"] forState:UIControlStateNormal];
        [bbtn addTarget:self action:@selector(bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bbtn];
        
        ls=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 110, 20)];
        ls.text=@"请选择保险";
        ls.backgroundColor=[UIColor clearColor];
        ls.textAlignment=NSTextAlignmentCenter;
        ls.textColor=[UIColor grayColor];
        [bbtn addSubview:ls];
        
        lbc=[[UILabel alloc]initWithFrame:CGRectMake(20, 290, 100, 30)];
        lbc.text=@"取票方式:";
        lbc.backgroundColor=[UIColor clearColor];
        lbc.textAlignment=NSTextAlignmentCenter;
        lbc.textColor=[UIColor blackColor];
        [self.view addSubview:lbc];
        
        btnn=[UIButton buttonWithType:UIButtonTypeCustom];
        btnn.frame=CGRectMake(120, 290, 150, 30);
        [btnn setImage:[UIImage imageNamed:@"5.jpg"] forState:UIControlStateNormal];
        [btnn addTarget:self action:@selector(btnnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: btnn];
        
        
        lbd=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 110, 20)];
        lbd.text=@"选择取票方式";
        lbd.backgroundColor=[UIColor clearColor];
        lbd.textAlignment=NSTextAlignmentCenter;
        lbd.textColor=[UIColor grayColor];
        [btnn addSubview:lbd];

    
        
        bbrn=[UIButton buttonWithType:UIButtonTypeCustom];
        bbrn.frame=CGRectMake(110, 370, 100, 35);
        [bbrn setImage:[UIImage imageNamed:@"下一步.png"] forState:UIControlStateNormal];
        [bbrn addTarget:self action:@selector(bbrnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:bbrn];
        
        _array= [[NSMutableArray alloc] initWithCapacity:10];

    
    
   
    
        int a = [self.fristOne.ccSinglePrice intValue];
        int b = [self.fristOne.ccTax intValue];
        int c = [self.fristOne.ccFuel intValue];
        
        
        int g = a + b + c;
        
        
        self.zPirce = [NSString stringWithFormat:@"%d",g];
        NSLog(@"111111111 %@",self.zPirce);
    
        la=[[UILabel alloc]initWithFrame:CGRectMake(30, 332, 170, 30)];
        la.backgroundColor=[UIColor clearColor];
        la.text= [NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];
        la.textColor=[UIColor blackColor];
        la.textAlignment=NSTextAlignmentLeft;
        [self.view addSubview:la];


}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag ==444) {
        tfw.frame= CGRectMake(120, 90, 200, 30);
        tft.frame= CGRectMake(120, 130, 200, 30);
    }else if (textField.tag ==666){
        
        tfw.frame= CGRectMake(120, 90, 200, 30);
        tft.frame= CGRectMake(120, 130, 200, 30);
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"return ");
    
    
        if (textField.tag==444){
            NSString *text2 = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"输入记录:%@",text2);
            NSLog(@"444");
            [tfw resignFirstResponder];

            tfw.frame= CGRectMake(120, 170, 200, 30);
            tft.frame= CGRectMake(120, 210, 200, 30);
            
        }
        else if (textField.tag ==999){
            
            NSString *text10 = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"请输入: %@",text10);
            yy_tf.frame= CGRectMake(60, 10, 200, 50);
            yy_tp.frame= CGRectMake(60, 80, 200, 50);
            [yy_tf resignFirstResponder];
            
            
        }else if (textField.tag == 888){
            
            NSString *text20 = [NSString stringWithFormat:@"%@",textField.text];
            
            NSLog(@"请输入: %@",text20);
            
            yy_tf.frame= CGRectMake(60, 10, 200, 50);
            yy_tp.frame= CGRectMake(60, 80, 200, 50);
            [yy_tp resignFirstResponder];
           
        }



        else if (textField.tag==666){
            NSLog(@"666");
            if (tf.text.length == 0 && tfq.text.length == 0) {
                NSString *text4 = [NSString stringWithFormat:@"%@",textField.text];
                NSLog(@"输入记录:%@",text4);

                NSLog(@"%@",tfw.text);
                NSLog(@"%@",tft.text);
                
                [tft resignFirstResponder];

                tfw.frame= CGRectMake(120, 170, 200, 30);
                tft.frame= CGRectMake(120, 210, 200, 30);
                [self._array addObject:[NSString stringWithFormat:@"%@%@",name,Passport_no]];
                [tabView reloadData];
                
                
            }
            
            else{
            NSString *text4 = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"输入记录:%@",text4);

            NSLog(@"%@",tfw.text);
            NSLog(@"%@",tft.text);
            
            [tft resignFirstResponder];

            tfw.frame= CGRectMake(120, 170, 200, 30);
            tft.frame= CGRectMake(120, 210, 200, 30);
            [self._array addObject:[NSString stringWithFormat:@"%@%@",tf.text,tfq.text]];
            [tabView reloadData];
                
            }
        }
    
    return YES;

}


-(void)btnnPressed:(UIButton *)button
{
    
    awardBackGroundView.hidden = NO;
    awardBGView.hidden = NO;
       
}

-(void)rectBtnPressed:(UIButton *)button
{
    
    
    
           if (button.tag==10001) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            lbd.text = alipayLabel.text;
           
            
        }else if (button.tag==10002) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            lbd.text = phoneCardLabel.text;
           
        }else if (button.tag==10005) {
            
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            lbd.text = onpheLabel.text;
          
            
        }

}


-(void)sureBtnPressed:(UIButton *)button
{
    
    awardBackGroundView.hidden = YES;
    awardBGView.hidden = YES;
    

}

-(void)cancelBtnPressed:(UIButton *)button
{
        
    awardBackGroundView.hidden = YES;
    awardBGView.hidden = YES;
    lbd.text= @"选择取票方式";

}

-(void)bbrnPressed:(UIButton *)button
{
    
    
   
    
    NSString * lbStr = [NSString stringWithFormat:@"%@",lbd.text];
    NSLog(@"  %@",lbStr);
    NSString * ttf = [NSString stringWithFormat:@"%@",tf.text];
    NSString * ttq = [NSString stringWithFormat:@"%@",tfq.text];
    NSString * ttw = [NSString stringWithFormat:@"%@",tfw.text];
    NSString * ttt = [NSString stringWithFormat:@"%@",tft.text];
    if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"] || ttf == nil || ttw == nil || ttt == nil ||  ttq == nil || [self._array count] == 0) {
        NSLog(@"11231213");
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
        
    }else if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"] || ttf.length == 0 || ttw.length == 0 || ttt.length == 0 || ttq.length == 0 || [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else if (self.baoXian == nil && [lbStr isEqualToString:@"选择取票方式"] && [ttf isEqualToString:@"(null)"] &&[ttw isEqualToString:@"(null)" ] && [ttt isEqualToString:@"(null)"] && [ttq isEqualToString:@"(null)"] && [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
    }else if(self.baoXian != nil && ![lbStr isEqualToString:@"选择取票方式"] && [ttf isEqualToString:@"(null)"] && ![ttw isEqualToString:@"(null)" ] && ![ttt isEqualToString:@"(null)"] && [ttq isEqualToString:@"(null)"] && [self._array count] != 0) {
        
        DingDanController * myDingDan=[[[DingDanController alloc] initWithItem:self.fristOne WithArray:self.tiJiArray] autorelease];
        
        MyNewXmlMolde * mol = [yy_Array objectAtIndex:0];
        
        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:myDingDan ]autorelease];
        myDingDan.str1 = name;
        myDingDan.str2 = Passport_no;
        myDingDan.str01 = tf.text;
        myDingDan.str02 = tfq.text;
        myDingDan.str3 = tfw.text;
        myDingDan.str4 = self.twoString;
        NSLog(@" twoString is   %@",twoString);

        myDingDan.str5 = tft.text;
        myDingDan.str6 = mol.xFlightNo;
        myDingDan.str7 = lbd.text;
        myDingDan.str8 = mol.xFlightDate;
        myDingDan.str9 = self.dingDanZh;
        myDingDan.str10 = mol.xCarrier;
        myDingDan.str11 = chufaming;
        myDingDan.str12 = didaming;
        myDingDan.str13 = y_sto;
        myDingDan.str14 = ls.text;
        myDingDan.str15 = self.baoXian;
        myDingDan.str16 = yy_label3.text;
        myDingDan.str17 = yy_label4.text;
        myDingDan.str18 = yy_label5.text;
        myDingDan.str19 = yy_label6.text;
        myDingDan.User_id = self.ssr;
        myDingDan.sanzima = self.cssanzm;
        myDingDan.sanzima2 = self.cssanzm2;
        myDingDan.yy_Zhe = self.yy_ZheKou;
        myDingDan.yy_QiFei = self.yy_Qi;
        myDingDan.yy_DiDa = self.yy_Di;
        myDingDan.yy_JiaGe = self.yy_Jia;
        myDingDan.yy_JiJian = self.yy_Ji;
        myDingDan.yy_RanYou = self.yy_Ran;
        myDingDan.yy_TuiGai = yy_Tui;
        myDingDan.yy_jixing = jixing;
        myDingDan.bao = self.baoXian;
        myDingDan.y_zop = la.text;
        
        
        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
    }
    
    else if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"] || [ttf isEqualToString:@"(null)"] ||[ttw isEqualToString:@"(null)" ] || [ttt isEqualToString:@"(null)"] || [ttq isEqualToString:@"(null)"] || [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
    }
    else{
        
        DingDanController * myDingDan=[[[DingDanController alloc] initWithItem:self.fristOne WithArray:self.tiJiArray] autorelease];
        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:myDingDan ]autorelease];
        
         MyNewXmlMolde * mol = [yy_Array objectAtIndex:0];
        
        myDingDan.str1 = tf.text;
        myDingDan.str2 = tfq.text;
        myDingDan.str3 = tfw.text;
        myDingDan.str4 = self.twoString;
        NSLog(@" twoString is   %@",twoString);

        myDingDan.str5 = tft.text;
        myDingDan.str6 = mol.xFlightNo;
        myDingDan.str7 = lbd.text;
        myDingDan.str8 = mol.xFlightDate;
        myDingDan.str9 = self.dingDanZh;
        myDingDan.str10 = mol.xCarrier;
        myDingDan.str11 = chufaming;
        myDingDan.str12 = didaming;
        myDingDan.str13 = y_sto;
        myDingDan.str14 = ls.text;
        myDingDan.str15 = self.baoXian;
        myDingDan.str16 = yy_label3.text;
        myDingDan.str17 = yy_label4.text;
        myDingDan.str18 = yy_label5.text;
        myDingDan.str19 = yy_label6.text;
        myDingDan.User_id = self.ssr;
        myDingDan.sanzima = self.cssanzm;
        myDingDan.sanzima2 = self.cssanzm2;
        myDingDan.yy_Zhe = self.yy_ZheKou;
        myDingDan.yy_QiFei = self.yy_Qi;
        myDingDan.yy_DiDa = self.yy_Di;
        myDingDan.yy_JiaGe = self.yy_Jia;
        myDingDan.yy_JiJian = self.yy_Ji;
        myDingDan.yy_RanYou = self.yy_Ran;
        myDingDan.yy_TuiGai = yy_Tui;
        myDingDan.yy_jixing = jixing;
        myDingDan.y_zop = la.text;
        
    
        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
        
    }
}
-(void)bbtnPressed:(UIButton *)button
{
    
    q_awardBackGroundView.hidden = NO;
    q_awardBGView.hidden = NO;

}

-(void)q_rectBtnPressed:(UIButton *)button
{
    
    
          if (button.tag==101) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [q_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            ls.text = q_alipayLabel.text;
            int m=[self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m + 20];
            la.text=[NSString stringWithFormat:@"订单总价: ￥%d",m+20];
            self.baoXian = [NSString stringWithFormat:@"%d",1];
            
        }else if (button.tag==102) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [q_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            ls.text = q_phoneCardLabel.text;
            int m = [self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m + 40];
            la.text= [NSString stringWithFormat: @"订单总价: ￥%d",m + 40];
            self.baoXian = [NSString stringWithFormat:@"%d",2];
            
        }else if (button.tag==105) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            ls.text = q_onpheLabel.text;
            self.baoXian = [NSString stringWithFormat:@"%d",0];
            int m = [self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m ];
            la.text= [NSString stringWithFormat: @"订单总价: ￥%d",m];
        }
 
}
-(void)q_sureBtnPressed:(UIButton *)button
{
    
    q_awardBackGroundView.hidden = YES;
    q_awardBGView.hidden = YES;
}
-(void)q_cancelBtnPressed:(UIButton *)button
{
    
    q_awardBackGroundView.hidden = YES;
    q_awardBGView.hidden = YES;
    ls.text= @"请选择保险";

}




-(void)bttunFanHui:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
