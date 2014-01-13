//
//  ChecheViewController.h
//  Flights
//
//  Created by mac on 12-10-31.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "SXView.h"
#import "MyNewXmlMolde.h"

@interface ChecheViewController : UIViewController
<NSXMLParserDelegate,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,UIAlertViewDelegate>
{
    UIActivityIndicatorView * activity;
    NSMutableArray * arrayBtn;
    
    MyNewXmlMolde * manItem;
    MyNewXmlMolde * twoItem;
    
    NSMutableArray * aryPaixun;
    
    NSMutableArray * arry;
    
    NSMutableArray * schoolArray;
    NSString * strary;
    UITableView * tabView;
    UILabel *lab;
    UILabel *_lab;
    UILabel *lab_;
    UILabel *labe;
    UILabel *llabe;
    UILabel * zheLab;
    UILabel * hangNameLab;
    UILabel * depHzl;
    UILabel * arrHzl;
    UILabel * jixinglab;
    
    UIButton *buttonn;
    UIButton *buttonn1;
    UIButton *buttonn2;
    UIButton *buttonn3;
    UIButton *buttonn4;
    
    NSString * hkgscz;
    NSString * cscz;
    NSString * cscz2;
    NSString * rqcz;
    NSString * erZim;
    
    NSString * md5String;
    
    NSDictionary *rzmdict;
    
    NSString * st1;
    NSString * st2;
    NSString * chuFa;
    NSString * diDa;
    
    NSString * myNewTime;
    
    UIScrollView *_sc;
    
    NSDictionary *erzima;
    
    NSString * st;
    NSString *_str;
    
    BOOL start;
    ASIHTTPRequest * yy_request;
    UIButton * btn;
    
    UIImageView *imageView;
    
    SXView * qerview;
    
    BOOL nowt ;
    
    NSMutableArray *ary;
    NSArray *sorteArray;
    NSArray *array2;
    MyNewXmlMolde *m;
    
    
}

@property (nonatomic, retain)ASIHTTPRequest * yy_request;
@property (nonatomic, assign)BOOL start;
@property (nonatomic, assign)BOOL nowt;
@property (nonatomic, retain)NSString * _str;
@property (nonatomic, retain)NSDictionary *erzima;
@property (nonatomic, retain)NSString * st;
@property (nonatomic, retain)NSString * strary;
@property (nonatomic, retain)NSString * myNewTime;
@property (nonatomic, retain)NSString * chuFa;
@property (nonatomic, retain)NSString * diDa;
@property (nonatomic, retain)NSString * st1;
@property (nonatomic, retain)NSString * st2;


@property (nonatomic,retain)NSString * md5String;
@property (nonatomic,retain)NSString * erZim;

@property (nonatomic, retain) NSString * hkgscz;
@property (nonatomic, retain) NSString * cscz;
@property (nonatomic, retain) NSString * cscz2;
@property (nonatomic, retain) NSString * rqcz;

@property (nonatomic, retain) NSDictionary * rzmdict;


@property (nonatomic, retain) MyNewXmlMolde * manItem;
@property (nonatomic, retain)NSMutableArray * arrayBtn;
@property (nonatomic, retain)NSMutableArray * schoolArray;
@property (nonatomic, retain)NSMutableArray * arry;
@property (nonatomic, retain)NSMutableArray * aryPaixun;
@property (nonatomic, retain)UIActivityIndicatorView * activity;

//-(void)httpStr3:(NSString *)tt3 WithStr4:(NSString *)tt4 WithStr5:(NSString *)tt5;



@end
