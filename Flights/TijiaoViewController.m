//
//  TijiaoViewController.m
//  Flights
//
//  Created by mac on 12-11-23.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "TijiaoViewController.h"
#import "RootViewController.h"
#import "YuDingXMLaa.h"
#import "ImageViewCon.h"
#import "ScheduledViewController.h"
#import "Sched_NHViewController.h"
#import "WuKaOneViewController.h"


@interface TijiaoViewController ()

@end

@implementation TijiaoViewController
@synthesize Qarray,Rarray;
@synthesize rMyarray,ttag,yy_btn,pnr,y_danhao,piaoJia,changshui,youshui,baoxian,zong;
@synthesize oo_baoxian,oo_changshui,oo_piaoJia,oo_pnr,oo_y_danhao,oo_youshui,oo_zong;
@synthesize ming,shenfen,Tel;
@synthesize fanPnr,fanDanhao,fanMing,fanShenFen,fanTel;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

//-(id)initWithArray:(NSMutableArray *)mTarray
//{
//    
//    if (self = [super init]) {
//        self.rMyarray = mTarray;
//    }
//    
//
//    return self;
//
//}

-(id)initWithArray:(NSMutableArray *)wanArray WithTag:(NSString *)tag
{
    if (self = [super init]) {
        self.Qarray =[NSMutableArray arrayWithArray:wanArray];
        self.ttag = tag;
    }
    return self;
}

-(void)xianshi
{
    
    
        myImageView = [[ImageViewCon alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:myImageView];
    
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
        [imageView setImage:[UIImage imageNamed:@"预订成功背景机票.png"]];
        [myImageView addSubview:imageView];
        [imageView release];
        
        
        UILabel *la_0=[[UILabel alloc]initWithFrame:CGRectMake(60, 112, 70, 30)];
        la_0.backgroundColor=[UIColor clearColor];
        la_0.text=@"记录编号";
        la_0.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_0];
        [la_0 release];
        
        UILabel *la_1=[[UILabel alloc]initWithFrame:CGRectMake(60, 143, 70, 30)];
        la_1.backgroundColor=[UIColor clearColor];
        la_1.text=@"订单编号";
        la_1.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_1];
        [la_1 release];
        

    
        UILabel *la_6=[[UILabel alloc]initWithFrame:CGRectMake(60, 174, 70, 30)];
        la_6.backgroundColor=[UIColor clearColor];
        la_6.text=@"票价";
        la_6.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_6];
        [la_6 release];
        
    
    
      
        
        UILabel *la1=[[UILabel alloc]initWithFrame:CGRectMake(150, 112, 120, 30)];
        la1.backgroundColor=[UIColor clearColor];
        la1.text=[NSString stringWithFormat:@"%@",pnr];
        la1.textAlignment=NSTextAlignmentLeft;
        [imageView addSubview:la1];
        [la1 release];
        
        UILabel *la2=[[UILabel alloc]initWithFrame:CGRectMake(150, 143, 120, 30)];
        la2.backgroundColor=[UIColor clearColor];
        la2.text=[NSString stringWithFormat:@"%@",y_danhao];
        la2.textAlignment=NSTextAlignmentLeft;
        [imageView addSubview:la2];
        [la2 release];
        

    
        UILabel *la7=[[UILabel alloc]initWithFrame:CGRectMake(150, 174, 120, 30)];
        la7.backgroundColor=[UIColor clearColor];
        la7.text=[NSString stringWithFormat:@"%@ 元",zong];
        [imageView addSubview:la7];
        [la7 release];
  
        
        UIButton *btn_=[UIButton buttonWithType:UIButtonTypeCustom];
        btn_.frame=CGRectMake(30, 340, 100, 35);
        [btn_ addTarget:self action:@selector(btn_Pressed:) forControlEvents:UIControlEventTouchUpInside];
        [btn_ setImage:[UIImage imageNamed:@"返回首页1.png"] forState:UIControlStateNormal];
        [self.view addSubview:btn_];
    
    y_button = [UIButton buttonWithType:UIButtonTypeCustom];
    y_button.frame = CGRectMake(170, 340, 100, 35);
    [y_button addTarget:self action:@selector(y_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    y_button.tag =123;
    [y_button setImage:[UIImage imageNamed:@"银行卡支付.png"] forState:UIControlStateNormal];
    [self.view addSubview:y_button];

    
    

    
    
}


-(void)ddzhifu
{

        myImageView = [[ImageViewCon alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:myImageView];
    
        UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 320, 420)];
        [imageView setImage:[UIImage imageNamed:@"预订成功背景机票.png"]];
        [myImageView addSubview:imageView];
        [imageView release];
    
    
        UILabel *la_0=[[UILabel alloc]initWithFrame:CGRectMake(60, 112, 70, 30)];
        la_0.backgroundColor=[UIColor clearColor];
        la_0.text=@"记录编号";
        la_0.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_0];
        
        [la_0 release];
        
        UILabel *la_1=[[UILabel alloc]initWithFrame:CGRectMake(60, 143, 70, 30)];
        la_1.backgroundColor=[UIColor clearColor];
        la_1.text=@"订单编号";
        la_1.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_1];
        [la_1 release];
        

    
        UILabel *la_6=[[UILabel alloc]initWithFrame:CGRectMake(60, 174, 70, 30)];
        la_6.backgroundColor=[UIColor clearColor];
        la_6.text=@"票价";
        la_6.textAlignment=NSTextAlignmentCenter;
        [imageView addSubview:la_6];
        [la_6 release];
        
        
       
        
        UILabel *la1=[[UILabel alloc]initWithFrame:CGRectMake(150, 112, 120, 30)];
        la1.backgroundColor=[UIColor clearColor];
        la1.text=[NSString stringWithFormat:@"%@",self.fanPnr];
        la1.textAlignment=NSTextAlignmentLeft;
        [imageView addSubview:la1];
        [la1 release];
        
        UILabel *la2=[[UILabel alloc]initWithFrame:CGRectMake(150, 143, 120, 30)];
        la2.backgroundColor=[UIColor clearColor];
        la2.text=[NSString stringWithFormat:@"%@",self.fanDanhao];
        la2.textAlignment=NSTextAlignmentLeft;
        [imageView addSubview:la2];
        [la2 release];
        

    
        UILabel *la7=[[UILabel alloc]initWithFrame:CGRectMake(150, 174, 120, 30)];
        la7.backgroundColor=[UIColor clearColor];
        la7.text=[NSString stringWithFormat:@"%@元",self.oo_zong];
        [imageView addSubview:la7];
        [la7 release];
        
        UIButton *btn_=[UIButton buttonWithType:UIButtonTypeCustom];
        [btn_ addTarget:self action:@selector(btn_Pressed:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn_];
        btn_.frame=CGRectMake(30, 340, 120, 35);
        [btn_ setImage:[UIImage imageNamed:@"返回首页1.png"] forState:UIControlStateNormal];
    
    y_button = [UIButton buttonWithType:UIButtonTypeCustom];
    y_button.frame = CGRectMake(170, 340, 100, 35);
    [y_button addTarget:self action:@selector(y_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    y_button.tag = 456;
    [y_button setImage:[UIImage imageNamed:@"银行卡支付.png"] forState:UIControlStateNormal];
    [self.view addSubview:y_button];

 
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

    
    NSLog(@"a%d",[self.Qarray count]);//0
    
    NSLog(@"b%d",[self.Rarray count]);//0
    
    NSLog(@"y_d  z  %@",self.y_danhao);//null
    NSLog(@"ming %@",self.ming);//null
    NSLog(@"shenfen %@",self.shenfen);//null
    
    
    NSLog(@"oo_pnr %@",self.oo_pnr);
    NSLog(@"oo_y_danhao %@",self.oo_y_danhao);
    NSLog(@"oo_piaoJia %@",self.oo_piaoJia);
    NSLog(@"oo_changshui %@",self.oo_changshui);
    NSLog(@"oo_youshui %@",self.oo_youshui);
    NSLog(@"oo_baoxian %@",self.oo_baoxian);
    NSLog(@"oo_zong %@",self.oo_zong);
    
    NSLog(@"反PNR %@",self.fanPnr);
    NSLog(@"反订单号 %@",self.fanDanhao);
    NSLog(@"反联系人名字 %@",self.fanMing);
    NSLog(@"反联系人身份证号 %@",self.fanShenFen);
    NSLog(@"反联系电话 %@",self.fanTel);



    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    NSLog(@"tag  %@",self.ttag);
    if ([self.ttag isEqualToString:@"wangfan"]) {
        
      
        
        [self ddzhifu];
        
    }else{
        [self xianshi];
    }
    
    
}

-(void)y_btnPressed:(id)sender
{
    
    WuKaOneViewController * wuka = [[[WuKaOneViewController alloc]init] autorelease];
    UINavigationController *nav = [[[UINavigationController alloc]initWithRootViewController:wuka] autorelease];
    
    if (y_button.tag == 123) {
        wuka.pnr = self.pnr;
        wuka.dinghao = self.y_danhao;
        wuka.y_ming = self.ming;
        wuka.y_shenfen = self.shenfen;
        wuka.y_Tel = self.Tel;
        wuka.stringTag = @"dancheng";

    }else if (y_button.tag == 456){
        
        wuka.fan_pnr = self.fanPnr;
        wuka.fan_danhao = self.fanDanhao;
        wuka.fan_ming = self.fanMing;
        wuka.fan_shenfen = self.fanShenFen;
        wuka.fan_tel = self.fanTel;
         wuka.stringTag = @"wangfan";
    }
    
    

    
    [self presentViewController:nav animated:YES completion:NULL];
    
}


-(void)btn_Pressed:(UIButton *)button
{
    
    
    
    UIImage * imge = [myImageView getImage];
    
    CGFloat floatQuality = 100.0;
    NSData * data = UIImageJPEGRepresentation(imge, floatQuality);
    UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:data], self, nil, NULL );
    
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"照片已保存到相册!"
                                                     message:nil
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    
    
    [alertView show];
    [alertView release];

    
    RootViewController *iQV=[[[RootViewController alloc]init]autorelease];
    iQV.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:iQV animated:YES completion:NULL];
}





-(void)_btnFanHui:(UIButton *)button
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
