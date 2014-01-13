//
//  ScBerthController.h
//  Flights
//
//  Created by XmL on 12-11-15.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "_DengLuViewController.h"
#import "DengLuXML.h"
#import "MyNewXmlMolde.h"
@interface ScBerthController : UIViewController
<UIScrollViewDelegate,_DengluViewControllerDelegate>
{
    UIScrollView * scrollView_;
    UIPageControl *pageControl_;
    
    UIImageView *imageView_loup;
    
    UIButton *wo_button;
    
    UILabel *lable_qw;
    UILabel *lable1_p;
    UILabel *lable2_i;
    UILabel *lable3_y;
    UILabel *lable4_k;
    UILabel *lable5_b;
    NSMutableArray *myArray;
    
  // MyNewXmlMolde * myNewsIteme;
    MyNewXmlMolde *myNewsIt;
    NSString * timeStr1;
    NSString * timeStr2;
    NSString * chufaMing;
    NSString * didaMing;
    NSString * myNewPrice;
    
    
    
    MyNewXmlMolde * berDingItem;
    MyNewXmlMolde * ya;
    
    UILabel *La_ble;
    UILabel *Lb_ale;
    UILabel *_la_ble;
    UILabel *_la_bel;
    UILabel *_lable;
    UILabel *_lab;
    UILabel *_la;
    UILabel *_lb;
    UILabel *_lc;
    UILabel *_ld;
    
    NSString * cszima;
    NSString * cszima2;
    NSString * qiFeish;
    NSString * diDash;
    
    DengLuXML * denglu;
    
    NSString * aString;
    NSString * ccString;
    
    UIImageView *imageView;
    
    NSMutableArray * deleArray;
    
    NSString *suv;
    NSString *jbk;
    
    NSMutableArray * jiageArray;
    
    UILabel *la3;
    
    MyNewXmlMolde *danYud;
    
    
    NSString * y_danQiFei;
    NSString * y_danDiDa;
    NSString * y_danQiFeiTime;
    NSString * y_danDiDaTime;
    NSString * y_danCangWei;
    NSString * y_danJiaGe;
    NSString * y_danZheKou;
    NSString * y_danJiJian;
    NSString * y_danRanYou;
    NSString * y_danTuiGaiQian;
    NSString * y_danHangBanHao;
    NSString * y_danjixing;
    
    NSString * st11;
    NSString * st22;
    UILabel *yy_l;
    
    
    
    
}

@property (nonatomic, retain)NSString * y_danjixing;
@property (nonatomic, retain)NSString * st11;
@property (nonatomic, retain)NSString * st22;
@property (nonatomic, retain)NSString * y_danHangBanHao;
@property (nonatomic, retain)NSString * y_danQiFei;
@property (nonatomic, retain)NSString * y_danDiDa;
@property (nonatomic, retain)NSString * y_danQiFeiTime;
@property (nonatomic, retain)NSString * y_danDiDaTime;
@property (nonatomic, retain)NSString * y_danCangWei;
@property (nonatomic, retain)NSString * y_danJiaGe;
@property (nonatomic, retain)NSString * y_danZheKou;
@property (nonatomic, retain)NSString * y_danJiJian;
@property (nonatomic, retain)NSString * y_danRanYou;
@property (nonatomic, retain)NSString * y_danTuiGaiQian;
@property (nonatomic, retain)MyNewXmlMolde * ya;
@property (nonatomic, retain)MyNewXmlMolde *myNewsIt;
@property (nonatomic, retain)MyNewXmlMolde *danYud;
@property (nonatomic, retain)NSMutableArray *jiageArray;
@property (nonatomic, retain)NSString *jbk;
@property (nonatomic, retain)NSString * suv;
@property (nonatomic, retain)NSString * ccString;
@property (nonatomic, retain)NSString * aString;
@property (nonatomic, retain)DengLuXML * denglu;
@property (nonatomic, retain)NSString * qiFeish;
@property (nonatomic, retain)NSString * diDash;
@property (nonatomic, retain)NSString * cszima2;
@property (nonatomic, retain)NSString * cszima;
@property (nonatomic, retain)NSMutableArray * myArray;
@property (nonatomic, retain) MyNewXmlMolde * berDingItem;
//@property (nonatomic, retain)MyNewXmlMolde * myNewsIteme;
@property (nonatomic, retain)NSString * myNewPrice;
@property (nonatomic, retain)NSString * timeStr1;
@property (nonatomic, retain)NSString * timeStr2;

@property (nonatomic, retain)NSString * chufaMing;
@property (nonatomic, retain)NSString * didaMing;
@property (nonatomic, retain)NSMutableArray * deleArray;

//-(id)initWithArray:(NSMutableArray *)array WithNewItem:(MyNewXmlMolde * )newItem;

-(id)initWithArray:(NSMutableArray *)array WithNewItem:(MyNewXmlMolde * )newItem withtwoNewItem: (MyNewXmlMolde *)twoItem;

@end


