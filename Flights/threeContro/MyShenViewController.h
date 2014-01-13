//
//  MyShenViewController.h
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ASIHTTPRequest.h"
@interface MyShenViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,ASIHTTPRequestDelegate>
{
    NSString * strTag;
    NSMutableArray * oneArray;
    NSMutableArray * twoArray;
    
    NSMutableArray * myArray;
    NSMutableArray * tableArray;
    
    ASIHTTPRequest * yanRequset;
    BOOL yanStart;
    int k;
    int g;
    int p;
    int o;
    
   UIActivityIndicatorView * activity;
    ASIHTTPRequest * myShRequest;
    BOOL start;
    ASIHTTPRequest * myTongYiRequest;
    
    ASIHTTPRequest * yy_request;
    
    UIButton * tyBtn;
    UITableView * myTableView;
    UIButton * onBtn;
    UIButton * nextBtn;
    
    NSMutableDictionary* spreadBoolDictionary;
    NSMutableDictionary* spreadBoolSearchBarArray;
    
    BOOL spread;
    UIButton *bbttn;
    UILabel *lbb;
    UIView *qview;
    UITableView *tableV;
    UIButton *tzbutn;
    UITableView *tableVie;
    UILabel *leopq;
    NSMutableArray *popArray;
    
    NSString *sstp;
    
    
}
@property(nonatomic,retain)NSString *sstp;
@property(nonatomic,retain)UILabel *lbb;
@property(nonatomic,assign)BOOL start;
@property(nonatomic,retain) NSMutableArray * tableArray;
@property(nonatomic,retain) NSMutableArray * oneArray;
@property(nonatomic,retain) NSMutableArray * twoArray;
@property(nonatomic,retain) NSMutableArray * myArray;
@property(nonatomic,retain)NSString * strTag;
@property(nonatomic,retain)NSMutableArray *popArray;



-(id)initWithStr:(NSString *)str;
-(id)initWithArray:(NSMutableArray *)oneary;
@end
