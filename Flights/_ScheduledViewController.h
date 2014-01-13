//
//  _ScheduledViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "MyNewXmlMolde.h"
@interface _ScheduledViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView * tabelView_tab;
     UIActivityIndicatorView * activity;
    UILabel *label_o;
    UILabel *label_a;
    UILabel *label_r;
    UILabel *label_u;
    UILabel * zheLab;
    UILabel * hangNameLab;
    UILabel * depHzl;
    UILabel * arrHzl;
    UILabel * jixinglab;
    
    UIButton *aw_btn;
    UIButton *bq_btn;
    UIButton *ce_btn;
    UIButton *dr_btn;
    UIButton *et_btn;
    
    UILabel *as_la_o;
    NSMutableArray * schoolArrayaa;
    NSMutableArray *arrya;
    NSMutableArray * cellarray;
    
    
    MyNewXmlMolde * mmenItem;
    MyNewXmlMolde * berDingItem;
    MyNewXmlMolde * twoItem;
    MyNewXmlMolde * ya;
    NSString * str1;
    NSString * str2;
    NSDictionary *rzmdict;
    NSString * sanzima;
    NSString * sanzima1;
    NSString * timeQi;
    NSString * timeDi;
    NSString * zongPrice;
    NSString * myNewTime;
    
    NSString * chuFam;
    NSString * diDam;
    
    UIScrollView * _sc;
    
    NSString * cscz;
    NSString * cscz2;
    NSString * rqcz;
    NSString * md5String;
    NSDictionary * erzima;
    NSString * st;
    NSMutableArray * arrayBtn;
    
    BOOL start;
    ASIHTTPRequest * yy_request;
    
    UIImageView *imageView;
    
    NSString *she;
    NSString *pop;
    NSString * helloezm;
    NSString * twozima;
    
    NSString * st1;
    NSString * st2;
    NSString * st11;
    NSString * st22;
   
  
    NSString * danCangWei;
    NSString * danJiaGe;
    NSString * danZheKou;
    NSString * danJiJian;
    NSString * danRanYou;
    NSString * danTuiGaiQian;
    NSString * danHangBanHao;
    NSString * danjixing;
    
}
@property (nonatomic, retain)NSString * danjixing;
@property (nonatomic, retain)NSString * danHangBanHao;
@property (nonatomic, retain)NSString * danCangWei;
@property (nonatomic, retain)NSString * danJiaGe;
@property (nonatomic, retain)NSString * danZheKou;
@property (nonatomic, retain)NSString * danJiJian;
@property (nonatomic, retain)NSString * danRanYou;
@property (nonatomic, retain)NSString * danTuiGaiQian;
@property (nonatomic, retain)MyNewXmlMolde * ya;
@property (nonatomic, retain)NSString *st1;
@property (nonatomic, retain)NSString *st2;
@property (nonatomic, retain)NSString *twozima;
@property (nonatomic, retain)NSString *helloezm;
@property (nonatomic, retain)NSString *pop;
@property (nonatomic, retain)NSString *she;
@property (nonatomic, retain)ASIHTTPRequest * yy_request;
@property (nonatomic, assign)BOOL start;
@property (nonatomic, retain)NSDictionary *erzima;
@property (nonatomic, retain)NSMutableArray *arrayBtn;
@property (nonatomic, retain)NSString *md5String;
@property (nonatomic, retain)NSString *cscz;
@property (nonatomic, retain)NSString *cscz2;
@property (nonatomic, retain)NSString *rqcz;
@property (nonatomic, retain)NSString *chuFam;
@property (nonatomic, retain)NSString *diDam;
@property (nonatomic, retain)NSString *myNewTime;
@property (nonatomic, retain)NSString *zongPrice;
@property (nonatomic, retain)NSString *sanzima;
@property (nonatomic, retain)NSString *sanzima1;
@property (nonatomic, retain)NSString *timeQi;
@property (nonatomic, retain)NSString *timeDi;
@property (nonatomic, retain)NSString * st;

@property (nonatomic, retain) NSDictionary *rzmdict;
@property (nonatomic, retain)NSString * str1;
@property (nonatomic, retain)NSString * str2;
@property (nonatomic, retain)NSMutableArray *schoolArrayaa;
@property (nonatomic, retain)NSMutableArray *cellarray;
@property (nonatomic, retain)NSMutableArray *arrya;
@property (nonatomic, retain) MyNewXmlMolde * mmenItem;
@property (nonatomic, retain) MyNewXmlMolde * berDingItem;

-(id)initWithNewItem:(MyNewXmlMolde * )newItem withTwoItem:(MyNewXmlMolde *)twoNewItem;

@end
