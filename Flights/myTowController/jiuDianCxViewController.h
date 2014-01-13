//
//  jiuDianCxViewController.h
//  jiudian
//
//  Created by XmL on 12-10-16.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiLiBoViewController.h"
#import "MySliderViewController.h"
#import "CityListViewController.h"
#import <CoreLocation/CoreLocation.h>
@interface jiuDianCxViewController : UIViewController
<UITextFieldDelegate,CLLocationManagerDelegate,RiLiBoView,MySlider,CityListViewControllerProtocol>
{

     CityListViewController *detailViewController;
    CityListViewController * detailViewCTwo;
    UIButton * ltbtn;
    UIButton * rgbtn;
    UIButton * chaxun;
    UIButton * zhoubian;
    
    UIButton * chengshiM;
    UIButton * jDweiZhi;
    UIButton * ruRiQi;
    UIButton * zJWan;
    UIButton * jiaGe;
    UIButton * zChaXun;
    CLLocationManager * locationManager;
    CLLocationCoordinate2D  curLocation;
   
    UIButton * ruRiQi2;
    UIButton * zJWan2;
    UIButton * jiaGe2;
    UIButton * zChaXun2;
    UILabel * chLabel;
    UILabel * chLabel2;
    UILabel * chLabel3;
    UILabel * chLabel4;
    UILabel * chLabel5;
    UILabel * chLabel6;
    UILabel * chWeizhi;
    
    UIView * viewOne;
    UILabel * zhLabel;
    UIButton * zhChaXun;
    UIButton * zhWeizhi;
    UIButton * zhRuZShi;
    UIButton * zhLiDShi;
    UIButton * zhJiGe;
    UILabel * zhLabel1;
    UILabel * zhLabel2;
    UILabel * zhLabel3;
    UILabel * zhLabel4;
    UILabel * zhLabel5;
    UILabel * zhLabel6;
    UISlider * zhSlider;
    NSString * zhJcLi;
    
    
    NSString* chengshiming;
    NSString* jiudianming;
    NSString* ruZhuri;
    NSString* zhuJwan;
    NSString* jiageXing;

    NSString * fanHui;
    
    NSString* str1 ;
    NSString* str2 ;
    NSString* str3 ;
    NSString* str;
    
    NSString* xingJim;
    NSString * chCJiGe;
    NSString * chCJiGe1;
    NSString* chengshiMing;
    
    NSString * nextDay;

    NSString * mlat;
    NSString * mlog;
    
    BOOL loctiStart;
    
}
@property (nonatomic, assign) BOOL loctiStart;
@property(nonatomic,retain)NSString * mlat;
@property(nonatomic,retain)NSString * mlog;
@property(nonatomic,retain)NSString * nextDay;
@property(nonatomic,retain)NSString * chengshiming;
@property(nonatomic,retain)NSString * jiudianming;
@property(nonatomic,retain)NSString * ruZhuri;
@property(nonatomic,retain)NSString * jiageXing;
@property(nonatomic,retain)NSString * zhuJwan;
@property(nonatomic,retain)NSString * fanHui;
@property(nonatomic,retain)NSString * xingJim;
@property(nonatomic,retain)NSString * chengshiMing;
@property(nonatomic,retain)NSString * chCJiGe;
@property(nonatomic,retain)NSString * chCJiGe1;
@property(nonatomic,retain)NSString * zhJcLi;


@property(nonatomic,retain)NSString * str1;
@property(nonatomic,retain)NSString * str2;
@property(nonatomic,retain)NSString * str3;
@property(nonatomic,retain)NSString * str;

@property NSUInteger curSection;
@property NSUInteger curRow;

-(NSString* )GetTomorrowDay:(NSDate *)date withDay:(int)day;

@end
