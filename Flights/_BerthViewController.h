//
//  _BerthViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNewXmlMolde.h"


@interface _BerthViewController : UIViewController
<UIScrollViewDelegate>
{
    UIScrollView * scrollView_;
    UIPageControl *pageControl_;
    
    UIImageView *imageView_loup;
    
    UIButton *wo_button;
    
    UILabel *lable_qw;
    UILabel *lable1_po;
    UILabel *lable2_iu;
    UILabel *lable3_yt;
    UILabel *lable4_kl;
    UILabel *lable5_bn;
    
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
    
    NSString * timeStr1;
    NSString * timeStr2;
    NSString * chufaMing;
    NSString * didaMing;

    NSString * cszima;
    NSString * cszima2;
    NSString * qiFeish;
    NSString * diDash;
    
    NSMutableArray *myArray;
    
    
    MyNewXmlMolde * myNewsIt;
    MyNewXmlMolde *dingDan;
    
    UIImageView *imageView;
    
    NSString *ssi;
    NSString *lov;
    
    NSString *jiageArray;
    UILabel *  la3;
    NSString * myNewSinglePrice;
    NSString *myerzim;
    
    UILabel * yy_lable;
    UILabel * yy_lab;
    UILabel * label;
    UILabel *yy_l;
    
}
@property (nonatomic, retain)NSString *myerzim;
@property (nonatomic, retain)MyNewXmlMolde *dingDan;;
@property (nonatomic, retain)NSString * myNewSinglePrice;
@property (nonatomic, retain)NSString *jiageArray;
@property (nonatomic, retain)NSString *lov;
@property (nonatomic, retain)NSString *ssi;
@property (nonatomic, retain)NSString *qiFeish;
@property (nonatomic, retain)NSString *diDash;
@property (nonatomic, retain)NSString *cszima2;
@property (nonatomic, retain)NSString *cszima;
@property (nonatomic, retain)NSMutableArray * myArray;

@property (nonatomic, retain)MyNewXmlMolde * myNewsIt;
@property (nonatomic, retain)NSString *myNewPrice;
@property (nonatomic, retain)NSString * timeStr1;
@property (nonatomic, retain)NSString * timeStr2;

@property (nonatomic, retain)NSString *chufaMing;
@property (nonatomic, retain)NSString *didaMing;

-(id)initWithArray:(NSMutableArray *)array;
@end
