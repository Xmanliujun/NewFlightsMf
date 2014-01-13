//
//  Sched_NHViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "Sched_NHViewController.h"
#import "_ScheduledViewController.h"
#import "AppDelegate.h"
#import "DingDanController.h"
#import "WangDingViewController.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"

@interface Sched_NHViewController ()

@end


@implementation Sched_NHViewController

@synthesize tijiaoArray;
@synthesize name,Passport_no;
@synthesize tiArray;
@synthesize psb;
@synthesize spo;
@synthesize baoXian,dingDanZh,chufaming,didaming,ssr;
@synthesize lab;
@synthesize zPirce;
@synthesize q_awardLabel,q_alipayLabel,q_phoneCardLabel,q_onpheLabel,q_awardChoBtn_ali,q_awardChoBtn_Pho,q_awardChoBtnu_Pho,q_sureBtn,q_cancelBtn,_array;
@synthesize baoxian;
@synthesize _awardLabel,_alipayLabel,_phoneCardLabel,_onpheLabel;
@synthesize _awardChoBtn_ali,_awardChoBtn_Pho,_awardChoBtnu_Pho,_sureBtn,_cancelBtn;
@synthesize fristOne,sectionTwo;
@synthesize ya;
@synthesize yy_label1,yy_label2,yy_label3,yy_label4,yy_label5,yy_label6,twoString;
@synthesize la;
@synthesize yy_danCangWei,yy_danDiDa,yy_danDiDaTime,yy_danJiaGe,yy_danJiJian,yy_danQiFei,yy_danQiFeiTime,yy_danRanYou,yy_danTuiGaiQian,yy_danZheKou,yy_danHangBanHao,yy_danjixing;
@synthesize wangCangWei,wangDiTime,wangJiaGe,wangJiJian,wangQiTime,wangRanYou,wangTuiGaiQian,wangZheKou,wangJiXing;
@synthesize l_String,t_String,w_String,y_String;
@synthesize ssm3,ssm4;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithOneItem:(MyNewXmlMolde * )oneItem withTwoItem:(MyNewXmlMolde *)twoItem withArray:(NSMutableArray *)ary withthree:(MyNewXmlMolde *)threeItem;
{

    if (self = [super init]) {
        self.fristOne = oneItem;
        self.sectionTwo = twoItem;
        self.tiArray = [NSMutableArray arrayWithArray:ary];
        self.ya = threeItem;
    }


    return self;

}
-(void)dealloc
{
    [super dealloc];
    [_lba release];
    [_lbb release];
    [_lbc release];
    [_lbd release];
    [_labue release];
    [_tf release];
    [_tfq release];
    [_tfw release];
    [_tfr release];
    [_tft release];
    [fristOne release];
    [sectionTwo release];
    [twoString release];

    
}

-(void)newView
{
        _awardBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
        _awardBackGroundView.tag = 10003;
        _awardBackGroundView.backgroundColor = [UIColor blackColor];
        _awardBackGroundView.alpha = 0.6;
        _awardBackGroundView.hidden = YES;
        
        _awardBGView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 263, 258)];
        _awardBGView.tag = 10004;
        _awardBGView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景.png"]];
        _awardBGView.hidden = YES;
        
        
        
        _awardLabel = [[UILabel alloc] initWithFrame:CGRectMake(30, 6, 200,19 )];
        _awardLabel.text = @"请选择取票方式";
        _awardLabel.font = [UIFont systemFontOfSize:15.0f];
        _awardLabel.textAlignment = NSTextAlignmentCenter;
        _awardLabel.backgroundColor = [UIColor clearColor];
        [_awardBGView addSubview:_awardLabel];
        
        _alipayLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 45, 100, 30)];
        _alipayLabel.text = @"J-机场取票";
        _alipayLabel.font = [UIFont systemFontOfSize:15.0f];
        _alipayLabel.textAlignment = NSTextAlignmentCenter;
        _alipayLabel.backgroundColor = [UIColor clearColor];
        [_awardBGView addSubview:_alipayLabel];
        
        _phoneCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 105, 100, 30)];
        _phoneCardLabel.text = @"S-送票上门";
        _phoneCardLabel.font = [UIFont systemFontOfSize:15.0f];
        _phoneCardLabel.textAlignment = NSTextAlignmentCenter;
        _phoneCardLabel.backgroundColor = [UIColor whiteColor];
        [_awardBGView addSubview:_phoneCardLabel];
        
        
        _onpheLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 170, 100, 30)];
        _onpheLabel.text = @"Q-前台自取";
        _onpheLabel.font = [UIFont systemFontOfSize:15.0f];
        _onpheLabel.textAlignment = NSTextAlignmentCenter;
        _onpheLabel.backgroundColor = [UIColor clearColor];
        [_awardBGView addSubview:_onpheLabel];
        
        _awardChoBtn_ali = [UIButton buttonWithType:UIButtonTypeCustom];
        [_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        _awardChoBtn_ali.tag = 10001;
        [_awardChoBtn_ali addTarget:self action:@selector(_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        _awardChoBtn_ali.frame = CGRectMake(207, 45, 35, 35);
        [_awardBGView addSubview:_awardChoBtn_ali];
        _awardChoBtn_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        _awardChoBtn_Pho.tag = 10002;
        [_awardChoBtn_Pho addTarget:self action:@selector(_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        _awardChoBtn_Pho.frame = CGRectMake(207, 105, 35, 35);
        [_awardBGView addSubview:_awardChoBtn_Pho];
        
        _awardChoBtnu_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
        _awardChoBtnu_Pho.tag = 10005;
        [_awardChoBtnu_Pho addTarget:self action:@selector(_rectBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        _awardChoBtnu_Pho.frame = CGRectMake(207, 170, 35, 35);
        [_awardBGView addSubview:_awardChoBtnu_Pho];
        
        
        _sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sureBtn.frame = CGRectMake(50, 220, 66, 29);
        [_sureBtn setImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
        [_sureBtn addTarget:self action:@selector(_sureBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [_awardBGView addSubview:_sureBtn];
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancelBtn.frame = CGRectMake(148, 220, 66, 29);
        [_cancelBtn setImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
        [_cancelBtn addTarget:self action:@selector(_cancelBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [_awardBGView addSubview:_cancelBtn];
        
        _aWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
        [_awardBackGroundView addSubview:_awardBGView];
        [_aWindow addSubview:_awardBackGroundView];
        [_awardBackGroundView release];
        [_aWindow addSubview:_awardBGView];
        [_awardBGView release];

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
        [q_cancelBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
        [q_cancelBtn addTarget:self action:@selector(q_cancelBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        
        [q_awardBGView addSubview:q_cancelBtn];

        
        _bWindow =	[(AppDelegate *)[[UIApplication sharedApplication] delegate] window];
        [_awardBackGroundView addSubview:q_awardBGView];
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
                
                MyNewXmlMolde * yyary = [self.tiArray objectAtIndex:0];
                
                int a = [self.sectionTwo.ccSinglePrice intValue];
                int b = [self.sectionTwo.ccTax intValue];
                int c = [self.sectionTwo.ccFuel intValue];
                
                NSLog(@"898989 %@ ",self.sectionTwo.ccSinglePrice);
                
                NSLog(@"77778888 %@",yyary.ccSinglePrice);
                
                
                int d = [yyary.ccSinglePrice intValue];
                int e = [yyary.ccTax intValue];
                int f = [yyary.ccFuel intValue];
                
                
                
                int g = a + b + c;
                int h = d + e + f;
                
                self.zPirce = [NSString stringWithFormat:@"%d",(g+h)*2];
                
                NSLog(@"总价 %@",self.zPirce);
                
              
                lab.text=[NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];
               
                
                self.twoString = [NSString stringWithFormat:@"2"];
                
                
            }
            
        }
        
        
        else if (yy_label3.text != nil ){
            
            yy_label5.text = [NSString stringWithFormat:@"%@",yy_tf.text];
            yy_label6.text = [NSString stringWithFormat:@"%@",yy_tp.text];
            
            
            if (yy_label6.text != NULL){
                
                MyNewXmlMolde * yyary = [self.tiArray objectAtIndex:0];
                
                int a = [self.sectionTwo.ccSinglePrice intValue];
                int b = [self.sectionTwo.ccTax intValue];
                int c = [self.sectionTwo.ccFuel intValue];
                
                NSLog(@"898989 %@ ",self.sectionTwo.ccSinglePrice);
                
                NSLog(@"77778888 %@",yyary.ccSinglePrice);
                
                
                int d = [yyary.ccSinglePrice intValue];
                int e = [yyary.ccTax intValue];
                int f = [yyary.ccFuel intValue];
                
                
                
                int g = a + b + c;
                int h = d + e + f;
                
                self.zPirce = [NSString stringWithFormat:@"%d",(g+h)*3];
                
                NSLog(@"总价 %@",self.zPirce);
                
            
                lab.text=[NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];
               

                self.twoString = [NSString stringWithFormat:@"3"];
                
                
            }
            
        }
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

    //这些为单程里面的数据信息 写往返插G11用
    NSLog(@"单程起飞时间 %@",self.yy_danQiFei);
    NSLog(@"单程抵达时间 %@",self.yy_danDiDa);
    NSLog(@"单程起飞城市 %@",self.yy_danQiFeiTime);
    NSLog(@"单程抵达城市 %@",self.yy_danDiDaTime);
    NSLog(@"单程舱位 %@",self.yy_danCangWei);
    NSLog(@"单程价格 %@",self.yy_danJiaGe);
    NSLog(@"单程折扣 %@",self.yy_danZheKou);
    NSLog(@"单程机场建设费 %@",self.yy_danJiJian);
    NSLog(@"单程燃油 %@",self.yy_danRanYou);
    NSLog(@"单程退改签 %@",self.yy_danTuiGaiQian);
    NSLog(@"单程航班号 %@",self.yy_danHangBanHao);
    NSLog(@"单程机型 %@",self.yy_danjixing);
    
    
    NSLog(@"111111111 %@",wangQiTime);
    NSLog(@"222222222 %@",wangDiTime);
    NSLog(@"333333333 %@",wangJiaGe);
    NSLog(@"444444444 %@",wangZheKou);
    NSLog(@"555555555 %@",wangJiJian);
    NSLog(@"666666666 %@",wangRanYou);
    NSLog(@"777777777 %@",wangTuiGaiQian);
    
    
    
    y_String = [NSString stringWithFormat:@"%@",wangQiTime];
    t_String = [y_String substringFromIndex:5];
    
    NSLog(@"!!!!!!!! %@ ",t_String);
    
    w_String = [NSString stringWithFormat:@"%@",wangDiTime];
    l_String = [w_String substringFromIndex:5];
    
    NSLog(@"######## %@",l_String);
    
    
    [self newView];
    [self helpView];
    
    NSLog(@"去程数据类的数据 %d",[tijiaoArray count]);
    NSLog(@"返程数据类的数据 %@",fristOne.xFlightNo);
    
    self.twoString = [NSString stringWithFormat:@"1"];
    NSLog(@" twoString is   %@",twoString);
    
   NSLog(@"11111222221212121212 %@",sectionTwo);
    
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    
    UIButton * xf_bttun = [UIButton buttonWithType:UIButtonTypeCustom];
    xf_bttun.frame = CGRectMake(0, 0, 35, 25);
    [xf_bttun setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [xf_bttun addTarget:self action:@selector(xf_bttunFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bowbtn_pop = [[[UIBarButtonItem alloc] initWithCustomView:xf_bttun] autorelease];
    
    self.navigationItem.leftBarButtonItem = bowbtn_pop;
    
        _imageView= [[[UIImageView alloc] initWithFrame:CGRectMake(0,0,320,568)] autorelease];
        [_imageView setImage:[UIImage imageNamed:@"灰背景.png"]];
        
        [self.view addSubview:_imageView];
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    name = [defaults objectForKey:@"name"];
    Passport_no = [defaults objectForKey:@"Passport_no"];
        
    
    
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
    yy_button.frame = CGRectMake(230, 0, 80, 50);
    [yy_button addTarget:self action:@selector(duorenPressed:) forControlEvents:UIControlEventTouchUpInside];
    [yy_button setImage:[UIImage imageNamed:@"增加乘机人.png"] forState:UIControlStateNormal];
    [self.view addSubview:yy_button];

    

    
    UILabel *slabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 170, 100, 30)];
    slabel.text = @"送票地址 :";
    slabel.backgroundColor = [UIColor clearColor];
    slabel.textAlignment = NSTextAlignmentCenter;
    slabel.textColor = [UIColor blackColor];
    [self.view addSubview:slabel];
    
        _tfw=[[UITextField alloc]initWithFrame:CGRectMake(120, 170, 200, 30)];
        _tfw.borderStyle=UITextBorderStyleRoundedRect;
        _tfw.placeholder=@"请输入地址";
        _tfw.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _tfw.keyboardType=UIKeyboardTypeNamePhonePad;
        _tfw.returnKeyType = UIReturnKeyDone;
        _tfw.tag=444;
        _tfw.delegate=self;
        [self.view addSubview:_tfw];
        
        _lbb=[[UILabel alloc]initWithFrame:CGRectMake(20, 210, 100, 30)];
        _lbb.text=@"联系电话 :";
        _lbb.backgroundColor=[UIColor clearColor];
        _lbb.textAlignment=NSTextAlignmentCenter;
        _lbb.textColor=[UIColor blackColor];
        [self.view addSubview:_lbb];
        
        _tft=[[UITextField alloc]initWithFrame:CGRectMake(120, 210, 200, 30)];
        _tft.borderStyle=UITextBorderStyleRoundedRect;
        _tft.placeholder=@"用作短信提示";
        _tft.contentVerticalAlignment=UIControlContentVerticalAlignmentCenter;
        _tft.keyboardType=UIKeyboardTypeNamePhonePad;
        _tft.returnKeyType = UIReturnKeyDone;
        _tft.tag=666;
        _tft.delegate=self;
        [self.view addSubview:_tft];
        
        lasb=[[UILabel alloc]initWithFrame:CGRectMake(20, 250, 100, 25)];
        lasb.backgroundColor=[UIColor clearColor];
        lasb.text=@"选择保险 :";
        lasb.textAlignment=NSTextAlignmentCenter;
        lasb.textColor=[UIColor blackColor];
        [self.view addSubview:lasb];
        
        _bbtn=[UIButton buttonWithType:UIButtonTypeCustom];
        _bbtn.frame=CGRectMake(120, 250, 150, 30);
        [_bbtn setImage:[UIImage imageNamed:@"5.jpg"] forState:UIControlStateNormal];
        [_bbtn addTarget:self action:@selector(_bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bbtn];
        
        ls=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 110, 20)];
        ls.text=@"请选择保险";
        ls.backgroundColor=[UIColor clearColor];
        ls.textAlignment=NSTextAlignmentCenter;
        ls.textColor=[UIColor grayColor];
        [_bbtn addSubview:ls];
        
        
        
        
        _lbc=[[UILabel alloc]initWithFrame:CGRectMake(20, 290, 100, 30)];
        _lbc.text=@"取票方式:";
        _lbc.backgroundColor=[UIColor clearColor];
        _lbc.textAlignment=NSTextAlignmentCenter;
        _lbc.textColor=[UIColor blackColor];
        [self.view addSubview:_lbc];
        
        _btnn=[UIButton buttonWithType:UIButtonTypeCustom];
        _btnn.frame=CGRectMake(120, 290, 150, 30);
        [_btnn setImage:[UIImage imageNamed:@"5.jpg"] forState:UIControlStateNormal];
        [_btnn addTarget:self action:@selector(_btnnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview: _btnn];
        
        
        _lbd=[[UILabel alloc]initWithFrame:CGRectMake(20, 5, 110, 20)];
        _lbd.text=@"选择取票方式";
        _lbd.backgroundColor=[UIColor clearColor];
        _lbd.textAlignment=NSTextAlignmentCenter;
        _lbd.textColor=[UIColor grayColor];
        [_btnn addSubview:_lbd];

    
        
        _bbrn=[UIButton buttonWithType:UIButtonTypeCustom];
        _bbrn.frame=CGRectMake(110, 370, 100, 35);
        [_bbrn setImage:[UIImage imageNamed:@"下一步.png"] forState:UIControlStateNormal];
        [_bbrn addTarget:self action:@selector(_bbrnPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:_bbrn];
        
        _array = [[NSMutableArray alloc] initWithCapacity:10];
        

    
    MyNewXmlMolde * yyary = [self.tiArray objectAtIndex:0];
    
    int a = [self.sectionTwo.ccSinglePrice intValue];
    int b = [self.sectionTwo.ccTax intValue];
    int c = [self.sectionTwo.ccFuel intValue];
    
    NSLog(@"898989 %@ ",self.sectionTwo.ccSinglePrice);
    
     NSLog(@"77778888 %@",yyary.ccSinglePrice);
    
    
    int d = [yyary.ccSinglePrice intValue];
    int e = [yyary.ccTax intValue];
    int f = [yyary.ccFuel intValue];
    
    
        
        int g = a + b + c;
        int h = d + e + f;
        
        self.zPirce = [NSString stringWithFormat:@"%d",g+h];
    
    NSLog(@"总价 %@",self.zPirce);
        
        lab=[[UILabel alloc]initWithFrame:CGRectMake(30, 332, 170, 30)];
        lab.backgroundColor=[UIColor clearColor];
        lab.text=[NSString stringWithFormat: @"订单总价: ￥%@",self.zPirce];
        lab.textColor=[UIColor blackColor];
        lab.textAlignment=NSTextAlignmentLeft;
        [self.view addSubview:lab];
        
      


}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField.tag ==444) {
        _tfw.frame= CGRectMake(120, 90, 200, 30);
        _tft.frame= CGRectMake(120, 130, 200, 30);
    }else if (textField.tag ==666){
        
        _tfw.frame= CGRectMake(120, 90, 200, 30);
        _tft.frame= CGRectMake(120, 130, 200, 30);
        
    }
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
     NSLog(@"return ");
    

    if (textField.tag==444){
            NSString *text2 = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"输入记录:%@",text2);
            
            [_tfw resignFirstResponder];

            _tfw.frame= CGRectMake(120, 170, 200, 30);
            _tft.frame= CGRectMake(120, 210, 200, 30);
            
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
            NSString *text4 = [NSString stringWithFormat:@"%@",textField.text];
            NSLog(@"输入记录:%@",text4);

            NSLog(@"%@",_tfw.text);
            NSLog(@"%@",_tft.text);
            
            [_tft resignFirstResponder];

            _tfw.frame= CGRectMake(120, 170, 200, 30);
            _tft.frame= CGRectMake(120, 210, 200, 30);
            [self._array addObject:[NSString stringWithFormat:@"%@%@",name,Passport_no]];
            [_tabView reloadData];

        }
    

    return YES;
    
}


-(void)_btnnPressed:(UIButton *)button
{
    
    _awardBackGroundView.hidden = NO;
    _awardBGView.hidden = NO;
    
}

-(void)_rectBtnPressed:(UIButton *)button
{
   
    
    
           
        if (button.tag==10001) {
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            _lbd.text = _alipayLabel.text;
            
        }else if (button.tag==10002) {
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            _lbd.text = _phoneCardLabel.text;
        }else if (button.tag==10005) {
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            _lbd.text = _onpheLabel.text;

        }
 
}


-(void)_sureBtnPressed:(UIButton *)button
{
    

    _awardBackGroundView.hidden = YES;
    _awardBGView.hidden = YES;
    
    
}

-(void)_cancelBtnPressed:(UIButton *)button
{
   
    _awardBackGroundView.hidden = YES;
    _awardBGView.hidden = YES;
    _lbd.text= @"选择取票方式";
}

-(void)_bbrnPressed:(UIButton *)button
{
    
    
    
    NSString * lbStr = _lbd.text;
    NSLog(@"llllll  %@",lbStr);
    NSString * ttfa = name;
    NSLog(@"  ttf %@",ttfa);
    NSString * ttqa = Passport_no;
    NSLog(@"  ttq %@",ttqa);
    NSString * ttws = _tfw.text;
    NSLog(@"  ttw %@",ttws);
    NSString * ttta = _tft.text;
    NSLog(@"  ttt %@",ttta);
    
    if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"]  || ttws == nil || ttta == nil || [self._array count] == 0) {
        NSLog(@"11231213");
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
        
    }else if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"] || ttws.length == 0 || ttta.length == 0 || [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else if (self.baoXian == nil && [lbStr isEqualToString:@"选择取票方式"] && [ttfa isEqualToString:@"(null)"] && [ttws isEqualToString:@"(null)" ] && [ttta isEqualToString:@"(null)"] && [ttqa isEqualToString:@"(null)"] && [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
    }
    else if (self.baoXian != nil && ![lbStr isEqualToString:@"选择取票方式"] && [ttfa isEqualToString:@"(null)"] && ![ttws isEqualToString:@"(null)" ] && ![ttta isEqualToString:@"(null)"] && [ttqa isEqualToString:@"(null)"] && [self._array count] != 0 ){
        
       
        
        WangDingViewController * myDingDan=[[[WangDingViewController alloc] initWithOneItem:self.fristOne withTwoItem:self.sectionTwo WithArray:self.tiArray withthree:ya] autorelease];
        
        
        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:myDingDan ]autorelease];
        
         MyNewXmlMolde * mol = [tiArray objectAtIndex:0];
        
        myDingDan.str1 =name;
        myDingDan.str2 = Passport_no;
        myDingDan.str3 = _tfw.text;
        myDingDan.str4 = self.twoString;
        NSLog(@" twoString is   %@",twoString);
        myDingDan.str5 = _tft.text;
        myDingDan.str6 = fristOne.xFlightNo;
        myDingDan.str7 = _lbd.text;
        myDingDan.str8 = self.fristOne.xFlightDate;
        myDingDan.str9 = self.dingDanZh;
        myDingDan.str10 = mol.xCarrier;
        myDingDan.str11 = chufaming;
        myDingDan.str12 = didaming;
        myDingDan.str13 = self.sectionTwo.ccName;
        myDingDan.str14 = ls.text;
        myDingDan.str15 = self.baoXian;
        myDingDan.str16 = yy_label3.text;
        myDingDan.str17 = yy_label4.text;
        myDingDan.str18 = yy_label5.text;
        myDingDan.str19 = yy_label6.text;
        myDingDan.User_id = self.ssr;
        myDingDan.liv = lab.text;
        myDingDan.sanzima = ssm3;
        myDingDan.sanzima2 = ssm4;
     
        
        myDingDan.yyy_danQiFei = self.yy_danQiFei;
        myDingDan.yyy_danDiDa = self.yy_danDiDa;
        myDingDan.yyy_danQiFeiTime = self.yy_danQiFeiTime;
        myDingDan.yyy_danDiDaTime = self.yy_danDiDaTime;
        myDingDan.yyy_danCangWei = self.yy_danCangWei;
        myDingDan.yyy_danJiaGe = self.yy_danJiaGe;
        myDingDan.yyy_danZheKou = self.yy_danZheKou;
        myDingDan.yyy_danJiJian = self.yy_danJiJian;
        myDingDan.yyy_danRanYou = self.yy_danRanYou;
        myDingDan.yyy_danTuiGaiQian = self.yy_danTuiGaiQian;
        myDingDan.yyy_danJiaGe = self.yy_danHangBanHao;
        myDingDan.yyy_danjixing = self.yy_danjixing;
        

        myDingDan.y_wangJiaGe = self.wangJiaGe;
        myDingDan.y_wangZheKou = self.wangZheKou;
        myDingDan.y_wangJiJian = self.wangJiJian;
        myDingDan.y_wangRanYou = self.wangRanYou;
        myDingDan.y_wangTuiGaiQian = self.wangTuiGaiQian;
        myDingDan.y_wangJiXing = self.wangJiXing;
        myDingDan.y_wangQiTime = wangQiTime;
        myDingDan.y_wangDiTime = wangDiTime;
        myDingDan.y_wangCangWei = self.wangCangWei;
        
        

        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }
    
    else if (self.baoXian != nil && ![lbStr isEqualToString:@"选择取票方式"] && ttfa == nil &&  ![ttws isEqualToString:@"(null)"] && ![ttta isEqualToString:@"(null)"] && ttqa == nil && [self._array count] != 0 ){
        
       WangDingViewController * myDingDan=[[[WangDingViewController alloc] initWithOneItem:self.sectionTwo withTwoItem:self.sectionTwo WithArray:self.tijiaoArray withthree:ya] autorelease];
        
         UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:myDingDan ]autorelease];
        

        MyNewXmlMolde * mol = [tiArray objectAtIndex:0];
        
       
        
        myDingDan.str1 = name;
        NSLog(@"1111111 %@",ttfa);
        myDingDan.str2 = Passport_no;
        NSLog(@"2222222 %@",ttqa);
        myDingDan.str3 = _tfw.text;
        myDingDan.str4 = self.twoString;
        NSLog(@" twoString is   %@",twoString);
        myDingDan.str5 = _tft.text;
        myDingDan.str6 = fristOne.xFlightNo;
        myDingDan.str7 = _lbd.text;
        myDingDan.str8 = self.fristOne.xFlightDate;
        myDingDan.str9 = self.dingDanZh;
        myDingDan.str10 = mol.xCarrier;
        myDingDan.str11 = chufaming;
        myDingDan.str12 = didaming;
        myDingDan.str13 = self.sectionTwo.ccName;
        myDingDan.str14 = ls.text;
        myDingDan.str15 = self.baoXian;
        myDingDan.str16 = yy_label3.text;
        myDingDan.str17 = yy_label4.text;
        myDingDan.str18 = yy_label5.text;
        myDingDan.str19 = yy_label6.text;
        myDingDan.User_id = self.ssr;
        myDingDan.liv = lab.text;
        myDingDan.sanzima = ssm3;
        myDingDan.sanzima2 = ssm4;
        
        myDingDan.yyy_danQiFei = self.yy_danQiFei;
        myDingDan.yyy_danDiDa = self.yy_danDiDa;
        myDingDan.yyy_danQiFeiTime = self.yy_danQiFeiTime;
        myDingDan.yyy_danDiDaTime = self.yy_danDiDaTime;
        myDingDan.yyy_danCangWei = self.yy_danCangWei;
        myDingDan.yyy_danJiaGe = self.yy_danJiaGe;
        myDingDan.yyy_danZheKou = self.yy_danZheKou;
        myDingDan.yyy_danJiJian = self.yy_danJiJian;
        myDingDan.yyy_danRanYou = self.yy_danRanYou;
        myDingDan.yyy_danTuiGaiQian = self.yy_danTuiGaiQian;
        myDingDan.yyy_danJiaGe = self.yy_danHangBanHao;
        myDingDan.yyy_danjixing = self.yy_danjixing;

        myDingDan.y_wangJiaGe = self.wangJiaGe;
        myDingDan.y_wangZheKou = self.wangZheKou;
        myDingDan.y_wangJiJian = self.wangJiJian;
        myDingDan.y_wangRanYou = self.wangRanYou;
        myDingDan.y_wangTuiGaiQian = self.wangTuiGaiQian;
        myDingDan.y_wangQiTime = wangQiTime;
        myDingDan.y_wangDiTime = wangDiTime;
        myDingDan.y_wangCangWei = self.wangCangWei;
        myDingDan.y_wangJiXing = self.wangJiXing;


        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
    }
    
    
    else if (self.baoXian == nil || [lbStr isEqualToString:@"选择取票方式"]  || [ttws isEqualToString:@"(null)" ] || [ttta isEqualToString:@"(null)"] || [self._array count] == 0) {
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请将订单填写完整！"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
    }
    else{
        
        WangDingViewController * myDingDan=[[[WangDingViewController alloc] initWithOneItem:self.fristOne withTwoItem:self.sectionTwo WithArray:self.tiArray withthree:ya] autorelease];
        

        UINavigationController *nav= [[[UINavigationController alloc]initWithRootViewController:myDingDan ]autorelease];
        
        NSLog(@"tiArray %@",tiArray);
        
          MyNewXmlMolde * mol = [self.tiArray objectAtIndex:0];

        
//        myDingDan.str1 = _tf.text;
//        myDingDan.str2 = _tfq.text;
        myDingDan.str1 = name;
        myDingDan.str2 = Passport_no;
        myDingDan.str3 = _tfw.text;
        myDingDan.str4 = self.twoString;
        NSLog(@" twoString is   %@",twoString);
        myDingDan.str5 = _tft.text;
        myDingDan.str6 = fristOne.xFlightNo;
        myDingDan.str7 = _lbd.text;
        myDingDan.str8 = self.fristOne.xFlightDate;
        NSLog(@"y67325647257 %@",self.fristOne.xFlightDate);
        myDingDan.str9 = self.dingDanZh;
        myDingDan.str10 = mol.xCarrier;
        myDingDan.str11 = chufaming;
        myDingDan.str12 = didaming;
        myDingDan.str13 = self.sectionTwo.ccName;
        myDingDan.str14 = ls.text;
        myDingDan.str15 = self.baoXian;
        myDingDan.str16 = yy_label3.text;
        myDingDan.str17 = yy_label4.text;
        myDingDan.str18 = yy_label5.text;
        myDingDan.str19 = yy_label6.text;
        myDingDan.User_id = self.ssr;
        myDingDan.liv =lab.text;
        myDingDan.sanzima = ssm3;
        myDingDan.sanzima2 = ssm4;
       
     
        myDingDan.yyy_danQiFei = self.yy_danQiFei;
        myDingDan.yyy_danDiDa = self.yy_danDiDa;
        myDingDan.yyy_danQiFeiTime = self.yy_danQiFeiTime;
        myDingDan.yyy_danDiDaTime = self.yy_danDiDaTime;
        myDingDan.yyy_danCangWei = self.yy_danCangWei;
        myDingDan.yyy_danJiaGe = self.yy_danJiaGe;
        myDingDan.yyy_danZheKou = self.yy_danZheKou;
        myDingDan.yyy_danJiJian = self.yy_danJiJian;
        myDingDan.yyy_danRanYou = self.yy_danRanYou;
        myDingDan.yyy_danTuiGaiQian = self.yy_danTuiGaiQian;
        myDingDan.yyy_danHangBanHao = self.yy_danHangBanHao;
        myDingDan.yyy_danjixing = self.yy_danjixing;
        
        
        
        NSLog(@"111111111 %@",wangQiTime);
        NSLog(@"222222222 %@",wangDiTime);
        NSLog(@"333333333 %@",wangJiaGe);
        NSLog(@"444444444 %@",wangZheKou);
        NSLog(@"555555555 %@",wangJiJian);
        NSLog(@"666666666 %@",wangRanYou);
        NSLog(@"777777777 %@",wangTuiGaiQian);

        myDingDan.y_wangJiaGe = self.wangJiaGe;
        myDingDan.y_wangZheKou = self.wangZheKou;
        myDingDan.y_wangJiJian = self.wangJiJian;
        myDingDan.y_wangRanYou = self.wangRanYou;
        myDingDan.y_wangTuiGaiQian = self.wangTuiGaiQian;
        myDingDan.y_wangQiTime = wangQiTime;
        myDingDan.y_wangDiTime = wangDiTime;
        myDingDan.y_wangCangWei = self.wangCangWei;
        myDingDan.y_wangJiXing = self.wangJiXing;
        
        
        
        
        nav.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        
    }
}

-(void)_bbtnPressed:(UIButton *)button
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
            int m = [self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m + 20];
            lab.text= [NSString stringWithFormat: @"订单总价: ￥%d",m + 20];
            self.baoXian = [NSString stringWithFormat:@"%d",1];
            
        }else if (button.tag==102) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [q_awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            ls.text = q_phoneCardLabel.text;
            int m = [self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m + 40];
            lab.text= [NSString stringWithFormat: @"订单总价: ￥%d",m + 40];
            self.baoXian = [NSString stringWithFormat:@"%d",2];
            
        }else if (button.tag==105) {
            
            [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            [q_awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
            ls.text = q_onpheLabel.text;
           
            self.baoXian = [NSString stringWithFormat:@"%d",0];
            int m = [self.zPirce intValue];
            self.dingDanZh = [NSString stringWithFormat:@"%d",m ];
            lab.text= [NSString stringWithFormat: @"订单总价: ￥%d",m];

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


-(void)xf_bttunFanHui:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
