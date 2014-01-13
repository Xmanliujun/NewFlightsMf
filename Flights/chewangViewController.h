//
//  chewangViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "SXView.h"
#import "MyNewXmlMolde.h"
@interface chewangViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
{
    UITableView * tabelView;
    NSMutableArray * arrayBtn;
    NSString * strary;
    NSMutableArray * aryPaixun;
    UILabel *label_op;
    UILabel *label_as;
    UILabel *label_re;
    UILabel *label_ui;
    UILabel *as_lab;
    UILabel * depHzl;
    UILabel * arrHzl;
    UILabel * zheLab;
    UILabel * hangNameLab;
    UILabel * jixinglab;
    UIButton *a_btn;
    UIButton *b_btn;
    UIButton *c_btn;
    UIButton *d_btn;
    UIButton *e_btn;
    
    
    UIActivityIndicatorView * activity;
    
    NSMutableArray * schoolArray;
    NSMutableArray *arr;
    NSMutableArray * cellarray;
    
    
    NSString * hkgscz;
    NSString * cscz;
    NSString * cscz2;
    NSString * rqcz;
    NSString * erZim;
    NSString * dRqca;
    NSString * md5String;
    
    NSDictionary *rzmdict;
    
    NSString * st1;
    NSString * st2;
    NSString * chuFa;
    NSString * diDa;
    
    NSString * myNewTime;
    MyNewXmlMolde * manItem;
    MyNewXmlMolde * twoItem;
    
    NSDictionary *erzima; 
    
    UIScrollView *_sc;
    NSString * st;
    BOOL nowt ;
    
    BOOL start;
    
    ASIHTTPRequest * yy_request;
    
    UIImageView *imageView;
    
    SXView * wtview;
}
@property (nonatomic, retain)NSMutableArray * aryPaixun;
@property (nonatomic, retain) ASIHTTPRequest * yy_request;
@property (nonatomic, assign) BOOL start;
@property (nonatomic, assign) BOOL nowt;
@property (nonatomic, retain) NSDictionary * erzima;
@property (nonatomic, retain) NSString * st;
@property (nonatomic, retain) NSString * strary;
@property (nonatomic, retain) NSMutableArray * arrayBtn;

@property (nonatomic, retain) NSMutableArray * schoolArray;
@property (nonatomic, retain) NSMutableArray * cellarray;
@property (nonatomic, retain) NSMutableArray * arr;

@property(nonatomic,retain) NSString * dRqca;
@property(nonatomic,retain) NSString * myNewTime;
@property(nonatomic,retain) NSString * chuFa;
@property(nonatomic,retain) NSString * diDa;
@property(nonatomic,retain) NSString * st1;
@property(nonatomic,retain) NSString * st2;

@property(nonatomic,retain) NSString * md5String;
@property(nonatomic,retain) NSString * erZim;

@property (nonatomic, retain) NSString * hkgscz;
@property (nonatomic, retain) NSString * cscz;
@property (nonatomic, retain) NSString * cscz2;
@property (nonatomic, retain) NSString * rqcz;

@property (nonatomic, retain) NSDictionary * rzmdict;
@property (nonatomic, retain) MyNewXmlMolde * manItem;

//-(void)httpStr3:(NSString *)tt3 WithStr4:(NSString *)tt4 WithStr5:(NSString *)tt5;

@end
