//
//  BerthViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DengLuXML.h"
#import "DengLuViewController.h"
#import "MyNewXmlMolde.h"



@interface BerthViewController : UIViewController
<UIScrollViewDelegate,DengLuViewControllerDelegate>
{
    UIScrollView * _scrollView;
    UIPageControl *_pageControl;
    
    UIImageView *imageView;
    
    UIButton *_button;
    UILabel *lable;
    UILabel *lable1;
    UILabel *lable2;
    UILabel *lable3;
    UILabel *lable4;
    UILabel *lable5;
    UILabel *lable6;
    UILabel *lable7;
    
    NSMutableArray *myArray;
    
    
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
    
   // NewsIteme * myNewsIteme;
    MyNewXmlMolde * myNewsIt;
    //NewsIteme * danYud;
    MyNewXmlMolde *danYud;
    NSString * timeStr1;
    NSString * timeStr2;
    NSString * chufaMing;
    NSString * didaMing;
    //NSString * myNewPrice;
    NSString * myNewSinglePrice;
    
    DengLuXML *denglu;
    
    NSString * aString;
    NSString * ccString;
    
    NSString *hbh;
    
    NSMutableArray *deleArray;
    
    NSMutableArray * jiageArray;
    UILabel *  la3;
    NSString * csszm;
    NSString * csszm2;
    UILabel *yy_lable;
    UILabel *yy_lab;
    UILabel *yy_l;
    
    
    
    
    
}

@property (nonatomic, retain)NSString *csszm2;
@property (nonatomic, retain)NSString *csszm;
@property (nonatomic, retain)NSMutableArray *jiageArray;
@property (nonatomic, retain)NSString * hbh;
@property (nonatomic, retain)NSString * aString;
@property (nonatomic, retain)NSString * ccString;
@property (nonatomic, retain)DengLuXML * denglu;
@property (nonatomic, retain)NSMutableArray * myArray;
//@property (nonatomic, retain)NewsIteme * danYud;
@property (nonatomic, retain)MyNewXmlMolde *danYud;
//@property (nonatomic, retain)NewsIteme * myNewsIteme;
@property (nonatomic, retain)MyNewXmlMolde * myNewsIt;
//@property (nonatomic, retain)NSString *myNewPrice;
@property (nonatomic, retain)NSString *myNewSinglePrice;
@property (nonatomic, retain)NSString * timeStr1;
@property (nonatomic, retain)NSString * timeStr2;

@property (nonatomic, retain)NSString *chufaMing;
@property (nonatomic, retain)NSString *didaMing;
@property (nonatomic, retain)NSMutableArray * deleArray;
-(id)initWithArray:(NSMutableArray *)arry;

@end
