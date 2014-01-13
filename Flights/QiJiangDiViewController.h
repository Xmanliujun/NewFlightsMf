//
//  QiJiangDiViewController.h
//  Flights
//
//  Created by mac on 13-4-7.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "DongTai.h"
#import "SXView.h"

@interface QiJiangDiViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>
{
    ASIHTTPRequest * yy_request;
    UIActivityIndicatorView * activity;
    NSDictionary *dict1;
    NSString *chufacs;
    NSString *didacs;
    NSString *shijiancs;
    NSDictionary *dict;
    NSArray *DoArray;
    UIButton *bbtn;
    UIBarButtonItem *leftItems;
    UIImage *leftItem;
    UITableView * tabView;
    UIImageView *imageView;
    UILabel *lab;
    UILabel *lab2;
    NSArray *array;
    DongTai *mmenItem;
    UILabel *laa;
    UILabel *la;
    NSDictionary *rzmdict;
    SXView * qerview;
    
    BOOL strat;
}
@property (nonatomic, retain)NSString *chufacs;
@property (nonatomic, retain)NSString *didacs;
@property (nonatomic, retain)NSString *shijiancs;
@property (nonatomic, retain)ASIHTTPRequest * yy_request;
@property (nonatomic, retain)UIActivityIndicatorView * activity;
@property (nonatomic, retain)NSDictionary *dict1;
@property (nonatomic, retain)NSDictionary *dict;
@property (nonatomic, retain)NSArray *DoArray;
@property (nonatomic, retain)NSDictionary *rzmdict;
@property (nonatomic, retain)NSArray *array;
@property (nonatomic, retain)DongTai *mmenItem;
@property (nonatomic, assign)BOOL start;

@end
