//
//  WinViewController.m
//  jiudian
//
//  Created by XmL on 12-11-7.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "WinViewController.h"
#import "RootViewController.h"
#import "YuDingXml.h"
#import "ImageViewCon.h"
#import "WuKaOneViewController.h"

#import "AlixPayOrder.h"
#import "AlixPayResult.h"
#import "AlixPay.h"
#import "DataSigner.h"


@implementation Product
@synthesize price = _price;
@synthesize subject = _subject;
@synthesize body = _body;
@synthesize orderId = _orderId;

@end


@interface WinViewController ()

@end

@implementation WinViewController
@synthesize roomNum,timeStar,timeEnd;
@synthesize myArray,myTwoAry;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithArray:(NSMutableArray *)array withTag:(NSString *)tag
{

    if (self = [super init]) {
        if ([tag isEqualToString:@"changGui"]) {
            self.myArray = [NSMutableArray arrayWithArray:array];
            
        }else if ([tag isEqualToString:@"zhouBian"]){
        
            self.myTwoAry = [NSMutableArray arrayWithArray:array];
        }
        
        
    }


    return self;

}

-(void)btnFanHui:(UIButton *)button
{
    

    [self dismissViewControllerAnimated:YES completion:NULL];

}
-(void)yuDingFh:(UIButton *)button
{
   
    
    UIImage * imge = [myImageView getImage];
    
    CGFloat floatQuality = 100.0;
    NSData * data = UIImageJPEGRepresentation(imge, floatQuality);
    UIImageWriteToSavedPhotosAlbum([UIImage imageWithData:data], self, nil, NULL );
    
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"订单已保存至相册!"
                                                     message:nil
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    
    
    [alertView show];
    [alertView release];
    
    
    RootViewController * chXun = [[[RootViewController alloc] init] autorelease];
  //  UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:chXun]autorelease];
    chXun.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:chXun animated:YES completion:NULL];
   

}




//-(void)zhiFunBtn:(UIButton*)btn
//{
//    
//    if ([self.myArray count] > 0) {
//        YuDingXml * yuXml = [self.myArray objectAtIndex:0];
//        
//        
//        
//       //  *点击获取prodcut实例并初始化订单信息
//         
//        //Product *product = [_products objectAtIndex:indexPath.row];
//        
//        /*
//         *商户的唯一的parnter和seller。
//         *本demo将parnter和seller信息存于（AlixPayDemo-Info.plist）中,外部商户可以考虑存于服务端或本地其他地方。
//         *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
//         */
//        //如果partner和seller数据存于其他位置,请改写下面两行代码
//
//        NSString *partner = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Partner"];
//        NSString *seller = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Seller"];
//        
//        //partner和seller获取失败,提示
//        if ([partner length] == 0 || [seller length] == 0)
//        {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                            message:@"缺少partner或者seller。"
//                                                           delegate:self
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            return;
//        }
//        
//        /*
//         *生成订单信息及签名
//         *由于demo的局限性，本demo中的公私钥存放在AlixPayDemo-Info.plist中,外部商户可以存放在服务端或本地其他地方。
//         */
//        //将商品信息赋予AlixPayOrder的成员变量
//        AlixPayOrder *order = [[AlixPayOrder alloc] init];
//        order.partner = partner;
//        order.seller = seller;
//        order.tradeNO = yuXml.ResOrderID; //订单ID（由商家自行制定）
//        order.productName = yuXml.HotelName; //商品标题
//        order.productDescription = yuXml.Address; //商品描述
//        order.amount = [NSString stringWithFormat:@"%@",yuXml.TotalAmount]; //商品价格
//        order.notifyURL =  @"http://www.nsr8.com/alipay.trade.direct.pay.cardpay-PHP-GBK/log.txt"; //回调URL
//        
//        //应用注册scheme,在AlixPayDemo-Info.plist定义URL types,用于安全支付成功后重新唤起商户应用
//        NSString *appScheme = @"AlixPay";
//        
//        //将商品信息拼接成字符串
//        NSString *orderSpec = [order description];
//        NSLog(@"orderSpec = %@",orderSpec);
//        
//        //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
//        //rsa签名
//        id<DataSigner> signer = CreateRSADataSigner([[NSBundle mainBundle] objectForInfoDictionaryKey:@"RSA private key"]);
//        NSString *signedString = [signer signString:orderSpec];
//        
//        NSString *signedString1 = [signer signString:@"中文abc123"];
//        signedString1 = [signedString1 stringByAddingPercentEscapesUsingEncoding:NSUnicodeStringEncoding];
//        NSLog(@"abc123  %@",signedString1);
//        
//        //将签名成功字符串格式化为订单字符串,请严格按照该格式
//        NSString *orderString = nil;
//        if (signedString != nil) {
//            orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                           orderSpec, signedString, @"RSA"];
//            
//            
//            NSLog(@"签名之后 -->  %@",orderString);
//            
//            //获取安全支付单例并调用安全支付接口
//            AlixPay * alixpay = [AlixPay shared];
//            int ret = [alixpay pay:orderString applicationScheme:appScheme];
//            
//            if (ret == kSPErrorAlipayClientNotInstalled) {
//                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                                     message:@"您还没有安装支付宝快捷支付，请先安装。"
//                                                                    delegate:self
//                                                           cancelButtonTitle:@"确定"
//                                                           otherButtonTitles:nil];
//                [alertView setTag:123];
//                [alertView show];
//                [alertView release];
//            }
//            else if (ret == kSPErrorSignError) {
//                NSLog(@"签名错误！");
//            }
//            
//        }
//        
//        
//    }
//    
//    
//    
//    
//    if ([self.myTwoAry count] > 0) {
//        YuDingXml * yuXml = [self.myTwoAry objectAtIndex:0];
//        
//        
//        /*
//         *点击获取prodcut实例并初始化订单信息
//         */
//        //Product *product = [_products objectAtIndex:indexPath.row];
//        
//        /*
//         *商户的唯一的parnter和seller。
//         *本demo将parnter和seller信息存于（AlixPayDemo-Info.plist）中,外部商户可以考虑存于服务端或本地其他地方。
//         *签约后，支付宝会为每个商户分配一个唯一的 parnter 和 seller。
//         */
//        //如果partner和seller数据存于其他位置,请改写下面两行代码
//        NSString *partner = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Partner"];
//        NSString *seller = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"Seller"];
//        
//        //partner和seller获取失败,提示
//        if ([partner length] == 0 || [seller length] == 0)
//        {
//            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                            message:@"缺少partner或者seller。"
//                                                           delegate:self
//                                                  cancelButtonTitle:@"确定"
//                                                  otherButtonTitles:nil];
//            [alert show];
//            [alert release];
//            return;
//        }
//        
//        /*
//         *生成订单信息及签名
//         *由于demo的局限性，本demo中的公私钥存放在AlixPayDemo-Info.plist中,外部商户可以存放在服务端或本地其他地方。
//         */
//        //将商品信息赋予AlixPayOrder的成员变量
//        AlixPayOrder *order = [[AlixPayOrder alloc] init];
//        order.partner = partner;
//        order.seller = seller;
//        order.tradeNO = yuXml.ResOrderID; //订单ID（由商家自行制定）
//        order.productName = yuXml.HotelName; //商品标题
//        order.productDescription = yuXml.Address; //商品描述
//        order.amount = [NSString stringWithFormat:@"%@",yuXml.TotalAmount]; //商品价格
//        order.notifyURL =  @"http://www.xxx.com"; //回调URL
//        
//        //应用注册scheme,在AlixPayDemo-Info.plist定义URL types,用于安全支付成功后重新唤起商户应用
//        NSString *appScheme = @"AlixPay";
//        
//        //将商品信息拼接成字符串
//        NSString *orderSpec = [order description];
//        NSLog(@"orderSpec = %@",orderSpec);
//        
//        //获取私钥并将商户信息签名,外部商户可以根据情况存放私钥和签名,只需要遵循RSA签名规范,并将签名字符串base64编码和UrlEncode
//        //rsa签名
//        id<DataSigner> signer = CreateRSADataSigner([[NSBundle mainBundle] objectForInfoDictionaryKey:@"RSA private key"]);
//        NSString *signedString = [signer signString:orderSpec];
//        
//        NSString *signedString1 = [signer signString:@"中文abc123"];
//        NSLog(@"abc123  %@",signedString1);
//        
//        //将签名成功字符串格式化为订单字符串,请严格按照该格式
//        NSString *orderString = nil;
//        if (signedString != nil) {
//            orderString = [NSString stringWithFormat:@"%@&sign=\"%@\"&sign_type=\"%@\"",
//                           orderSpec, signedString, @"RSA"];
//            
//            
//            NSLog(@"签名之后 -->  %@",orderString);
//            
//            //获取安全支付单例并调用安全支付接口
//            AlixPay * alixpay = [AlixPay shared];
//            int ret = [alixpay pay:orderString applicationScheme:appScheme];
//            
//            if (ret == kSPErrorAlipayClientNotInstalled) {
//                UIAlertView * alertView = [[UIAlertView alloc] initWithTitle:@"提示"
//                                                                     message:@"您还没有安装支付宝快捷支付，请先安装。"
//                                                                    delegate:self
//                                                           cancelButtonTitle:@"确定"
//                                                           otherButtonTitles:nil];
//                [alertView setTag:123];
//                [alertView show];
//                [alertView release];
//            }
//            else if (ret == kSPErrorSignError) {
//                NSLog(@"签名错误！");
//            }
//            
//        }
//        
//        
//    }
//    
//}
//
//- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
//	if (alertView.tag == 123) {
//		NSString * URLString = @"http://itunes.apple.com/cn/app/id535715926?mt=8";
//		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:URLString]];
//	}
//}
//
//
//-(void)wuKaBtn:(UIButton *)btn
//{
//    
//    NSLog(@"wuKaBtn");
//    if ([self.myArray count]>0) {
//        WuKaOneViewController * win = [[[WuKaOneViewController alloc] initWithArray:self.myArray] autorelease];
//        
//        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:win] autorelease];
//        
//        win.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:nav animated:YES completion:NULL];
//        
//    }else if ([self.myTwoAry count] > 0){
//        WuKaOneViewController * win = [[[WuKaOneViewController alloc] initWithArray:self.myTwoAry] autorelease];
//        
//        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:win] autorelease];
//        
//        win.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
//        [self presentViewController:nav animated:YES completion:NULL];
//        
//        
//        
//    }
//    
//    
//    
//}



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

    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 35, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkbtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkbtn;
    
    

   
    
    myImageView = [[ImageViewCon alloc] initWithFrame:self.view.bounds];
    
    [self.view addSubview:myImageView];

    
    
    
    UIImageView * imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"预订成功背景.png"]];
    
    imageView.frame = CGRectMake(0, 0, 320, 390);
    [myImageView addSubview:imageView];
    [imageView release];
    
    UIButton * btnYd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnYd.frame = CGRectMake(98, 380, 124, 37);
    [btnYd setImage:[UIImage imageNamed:@"返回首页.png"] forState:UIControlStateNormal];
    [btnYd addTarget:self action:@selector(yuDingFh:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnYd];
    
    /*
    UIButton * zhiFunBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    zhiFunBtn.frame = CGRectMake(0, 380, 50, 30);
    [zhiFunBtn setTitle:@"支付" forState:UIControlStateNormal];
    [zhiFunBtn addTarget:self action:@selector(zhiFunBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zhiFunBtn];
    
    UIButton * wuKaBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    wuKaBtn.frame = CGRectMake(260, 380, 50, 30);
    [wuKaBtn setTitle:@"无卡" forState:UIControlStateNormal];
    [wuKaBtn addTarget:self action:@selector(wuKaBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:wuKaBtn];
    */
    
    times = [NSDictionary dictionaryWithObjectsAndKeys:@"12:00-15:00",@"12:00",@"13:00-16:00",@"13:00",@"14:00-17:00",@"14:00",@"15:00-18:00",@"15:00",@"16:00-19:00",@"16:00",@"17:00-20:00",@"17:00",@"18:00-21:00",@"18:00",@"19:00-22:00",@"19:00",@"20:00-23:00",@"20:00",@"21:00-23:59",@"21:00",@"22:00-次日6:00",@"22:00", nil];
    
    if ([self.myArray count] > 0) {
        YuDingXml * yuXml = [self.myArray objectAtIndex:0];
        
        UILabel * lab0 = [[UILabel alloc] initWithFrame:CGRectMake(35, 80, 260, 40)];
        lab0.textAlignment = NSTextAlignmentLeft;
        lab0.font = [UIFont fontWithName:@"Arial" size:15];
        lab0.backgroundColor = [UIColor clearColor];
        lab0.numberOfLines = 0;
        lab0.text = [NSString stringWithFormat:@"酒店名称:%@",yuXml.HotelName];
        [imageView addSubview:lab0];
        [lab0 release];
      

        
        UILabel * lab1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 120, 300, 20)];
        lab1.textAlignment = NSTextAlignmentLeft;
        lab1.font = [UIFont fontWithName:@"Arial" size:15];
        lab1.backgroundColor = [UIColor clearColor];
        lab1.text = [NSString stringWithFormat:@"预定时间:%@",yuXml.CreateDateTime];
        [imageView addSubview:lab1];
        [lab1 release];
        
        UILabel * lab2 = [[UILabel alloc] initWithFrame:CGRectMake(35, 140, 300, 20)];
        lab2.textAlignment = NSTextAlignmentLeft;
        lab2.font = [UIFont fontWithName:@"Arial" size:15];
        lab2.backgroundColor = [UIColor clearColor];
        lab2.textColor = [UIColor redColor];
        lab2.text = [NSString stringWithFormat:@"订单号:%@",yuXml.ResOrderID];
        [imageView addSubview:lab2];
        [lab2 release];
        
        UILabel * lab3 = [[UILabel alloc] initWithFrame:CGRectMake(35, 162, 300, 20)];
        lab3.textAlignment = NSTextAlignmentLeft;
        lab3.font = [UIFont fontWithName:@"Arial" size:15];
        lab3.backgroundColor = [UIColor clearColor];
        lab3.text = [NSString stringWithFormat:@"客户姓名:%@",yuXml.PersonName];
        [imageView addSubview:lab3];
        [lab3 release];
        
        UILabel * lab4 = [[UILabel alloc] initWithFrame:CGRectMake(35, 184, 300, 20)];
        lab4.textAlignment = NSTextAlignmentLeft;
        lab4.font = [UIFont fontWithName:@"Arial" size:15];
        lab4.backgroundColor = [UIColor clearColor];
        lab4.text = [NSString stringWithFormat:@"客户电话:%@",yuXml.Mobile];
        [imageView addSubview:lab4];
        [lab4 release];
        
        UILabel * lab5 = [[UILabel alloc] initWithFrame:CGRectMake(35, 206, 300, 20)];
        lab5.textAlignment = NSTextAlignmentLeft;
        lab5.font = [UIFont fontWithName:@"Arial" size:15];
        lab5.backgroundColor = [UIColor clearColor];
        lab5.text = [NSString stringWithFormat:@"房间数:%@间",self.roomNum];
        [imageView addSubview:lab5];
        [lab5 release];
        

        
        UILabel * lab7 = [[UILabel alloc] initWithFrame:CGRectMake(35, 228, 300, 20)];
        lab7.textAlignment = NSTextAlignmentLeft;
        lab7.font = [UIFont fontWithName:@"Arial" size:15];
        lab7.backgroundColor = [UIColor clearColor];
        lab7.text = [NSString stringWithFormat:@"住宿费总计:%@",yuXml.TotalAmount];
        [imageView addSubview:lab7];
        [lab7 release];
        
        UILabel * lab8 = [[UILabel alloc] initWithFrame:CGRectMake(35, 248, 300, 20)];
        lab8.textAlignment = NSTextAlignmentLeft;
        lab8.font = [UIFont fontWithName:@"Arial" size:15];
        lab8.backgroundColor = [UIColor clearColor];
        lab8.text = [NSString stringWithFormat:@"入住日期:%@",yuXml.StartDate];
        [imageView addSubview:lab8];
        [lab8 release];
        
        UILabel * lab9 = [[UILabel alloc] initWithFrame:CGRectMake(35, 270, 300, 20)];
        lab9.textAlignment = NSTextAlignmentLeft;
        lab9.font = [UIFont fontWithName:@"Arial" size:15];
        lab9.backgroundColor = [UIColor clearColor];
        lab9.text = [NSString stringWithFormat:@"离店日期:%@",yuXml.EndDate];
        [imageView addSubview:lab9];
        [lab9 release];
        
        
        NSString * timeXml = [times objectForKey:yuXml.ArriveEarlyTime];
        UILabel * laba = [[UILabel alloc] initWithFrame:CGRectMake(35, 292, 300, 20)];
        laba.textAlignment = NSTextAlignmentLeft;
        laba.font = [UIFont fontWithName:@"Arial" size:15];
        laba.backgroundColor = [UIColor clearColor];
        laba.text = [NSString stringWithFormat:@"预留时间:%@",timeXml];
        [imageView addSubview:laba];
        [laba release];
        
        UILabel * labb = [[UILabel alloc] initWithFrame:CGRectMake(35, 312, 250, 40)];
        labb.textAlignment = NSTextAlignmentLeft;
        labb.font = [UIFont fontWithName:@"Arial" size:15];
        labb.backgroundColor = [UIColor clearColor];
        labb.numberOfLines = 0;
        labb.text = [NSString stringWithFormat:@"酒店地址:%@",yuXml.Address];
        [imageView addSubview:labb];
        [labb release];
        
    }else if ([self.myTwoAry count] > 0){
        YuDingXml * yuXml = [self.myTwoAry objectAtIndex:0];
        
        UILabel * lab0 = [[UILabel alloc] initWithFrame:CGRectMake(35, 80, 260, 40)];
        lab0.textAlignment = NSTextAlignmentLeft;
        lab0.font = [UIFont fontWithName:@"Arial" size:15];
        lab0.backgroundColor = [UIColor clearColor];
        lab0.numberOfLines = 0;
        lab0.text = [NSString stringWithFormat:@"酒店名称:%@",yuXml.HotelName];
        [imageView addSubview:lab0];
        [lab0 release];
        
        UILabel * lab1 = [[UILabel alloc] initWithFrame:CGRectMake(35, 120, 300, 20)];
        lab1.textAlignment = NSTextAlignmentLeft;
        lab1.font = [UIFont fontWithName:@"Arial" size:15];
        lab1.backgroundColor = [UIColor clearColor];
        lab1.text = [NSString stringWithFormat:@"预定时间:%@",yuXml.CreateDateTime];
        [imageView addSubview:lab1];
        [lab1 release];
        
        UILabel * lab2 = [[UILabel alloc] initWithFrame:CGRectMake(35, 140, 300, 20)];
        lab2.textAlignment = NSTextAlignmentLeft;
        lab2.font = [UIFont fontWithName:@"Arial" size:15];
        lab2.backgroundColor = [UIColor clearColor];
        lab2.textColor = [UIColor redColor];
        lab2.text = [NSString stringWithFormat:@"订单号:%@",yuXml.ResOrderID];
        [imageView addSubview:lab2];
        [lab2 release];
        
        UILabel * lab3 = [[UILabel alloc] initWithFrame:CGRectMake(35, 162, 300, 20)];
        lab3.textAlignment = NSTextAlignmentLeft;
        lab3.font = [UIFont fontWithName:@"Arial" size:15];
        lab3.backgroundColor = [UIColor clearColor];
        lab3.text = [NSString stringWithFormat:@"客户姓名:%@",yuXml.PersonName];
        [imageView addSubview:lab3];
        [lab3 release];
        
        UILabel * lab4 = [[UILabel alloc] initWithFrame:CGRectMake(35, 184, 300, 20)];
        lab4.textAlignment = NSTextAlignmentLeft;
        lab4.font = [UIFont fontWithName:@"Arial" size:15];
        lab4.backgroundColor = [UIColor clearColor];
        lab4.text = [NSString stringWithFormat:@"客户电话:%@",yuXml.Mobile];
        [imageView addSubview:lab4];
        [lab4 release];
        
        UILabel * lab5 = [[UILabel alloc] initWithFrame:CGRectMake(35, 206, 300, 20)];
        lab5.textAlignment = NSTextAlignmentLeft;
        lab5.font = [UIFont fontWithName:@"Arial" size:15];
        lab5.backgroundColor = [UIColor clearColor];
        lab5.text = [NSString stringWithFormat:@"房间数:%@间",self.roomNum];
        [imageView addSubview:lab5];
        [lab5 release];
        

        
        UILabel * lab7 = [[UILabel alloc] initWithFrame:CGRectMake(35, 228, 300, 20)];
        lab7.textAlignment = NSTextAlignmentLeft;
        lab7.font = [UIFont fontWithName:@"Arial" size:15];
        lab7.backgroundColor = [UIColor clearColor];
        lab7.text = [NSString stringWithFormat:@"住宿费总计:%@",yuXml.TotalAmount];
        [imageView addSubview:lab7];
        [lab7 release];
        
        UILabel * lab8 = [[UILabel alloc] initWithFrame:CGRectMake(35, 248, 300, 20)];
        lab8.textAlignment = NSTextAlignmentLeft;
        lab8.font = [UIFont fontWithName:@"Arial" size:15];
        lab8.backgroundColor = [UIColor clearColor];
        lab8.text = [NSString stringWithFormat:@"入住日期:%@",yuXml.StartDate];
        [imageView addSubview:lab8];
        [lab8 release];
        
        UILabel * lab9 = [[UILabel alloc] initWithFrame:CGRectMake(35, 270, 300, 20)];
        lab9.textAlignment = NSTextAlignmentLeft;
        lab9.font = [UIFont fontWithName:@"Arial" size:15];
        lab9.backgroundColor = [UIColor clearColor];
        lab9.text = [NSString stringWithFormat:@"离店日期:%@",yuXml.EndDate];
        [imageView addSubview:lab9];
        [lab9 release];
        
        
        NSString * timeXml = [times objectForKey:yuXml.ArriveEarlyTime];
        UILabel * laba = [[UILabel alloc] initWithFrame:CGRectMake(35, 292, 300, 20)];
        laba.textAlignment = NSTextAlignmentLeft;
        laba.font = [UIFont fontWithName:@"Arial" size:15];
        laba.backgroundColor = [UIColor clearColor];
        laba.text = [NSString stringWithFormat:@"预留时间:%@",timeXml];
        [imageView addSubview:laba];
        [laba release];
        
        UILabel * labb = [[UILabel alloc] initWithFrame:CGRectMake(35, 312, 250, 40)];
        labb.textAlignment = NSTextAlignmentLeft;
        labb.font = [UIFont fontWithName:@"Arial" size:15];
        labb.backgroundColor = [UIColor clearColor];
        labb.numberOfLines = 0;
        labb.text = [NSString stringWithFormat:@"酒店地址:%@",yuXml.Address];
        [imageView addSubview:labb];
        [labb release];
    }
        
    
    NSLog(@"数组a %d",[myArray count]);
    NSLog(@"数组b %d",[myTwoAry count]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
