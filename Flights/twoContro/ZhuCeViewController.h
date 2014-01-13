//
//  ZhuCeViewController.h
//  Flights
//
//  Created by mac on 13-7-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface ZhuCeViewController : UIViewController<UITextFieldDelegate,UIApplicationDelegate,ASIHTTPRequestDelegate>
{
    UITextField *tf1;
    UITextField *tf2;
    UITextField *tf3;
    UITextField *tf4;
    UITextField *tf5;
    UITextField *tf6;
    
    UILabel *la1;
    UILabel *la2;
    UILabel *la3;
    UILabel *la4;
    UILabel *la5;
    UILabel *la6;
    UILabel *la7;
    
    UIView *awardBackGroundView;
    UIView *awardBGView;
    UILabel *awardLabel;
    UILabel *alipayLabel;
    UILabel *phoneCardLabel;
    UILabel *onpheLabel;
    UIWindow *aWindow;
    
    UILabel *label;
    UILabel *llbe;
    
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    
    UILabel *lla;
    UILabel *llb;
    UILabel *llc;
    UILabel *lld;
    
    UIActivityIndicatorView * activity;
    ASIHTTPRequest * requestaa;
    BOOL start;
    
    
    
}
@property (nonatomic, assign)BOOL start;
@end
