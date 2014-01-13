//
//  ZhouBianXunViewController.h
//  jiudian
//
//  Created by XmL on 12-10-25.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

#import "ZhoubianXMLOne.h"
#import "ZSXuanView.h"
#import "EGORefreshTableHeaderView.h"
#import "EGOLoadMoreTableFooterView.h"
#import "StrNXmlRemmed.h"
#import "ASIFormDataRequest.h"
@interface ZhouBianXunViewController : UIViewController
<NSXMLParserDelegate,MKMapViewDelegate,UITableViewDataSource,UITableViewDelegate,EGORefreshTableHeaderDelegate,EGOLoadMoreTableFooterDelegate>
{
    EGORefreshTableHeaderView *_refreshHeaderView;
    EGOLoadMoreTableFooterView * _loadMoreFooterView;
    
    
    EGOLoadMoreTableFooterView *view;
    BOOL _reloading;
    
    ASIFormDataRequest * formDataRequest;
    
    MKMapView * UsermapView;
    
    NSString * ruZhuri;
    NSString * liDianri;
    NSString * chengShiM;
    NSString * xingJi;
    NSString * canJig;
    NSString * canJig1;
    NSString * strMing;
    NSString * stringaa;
    NSString * stringURL;
    NSString * jvLizh;
    
    
    BOOL zhttpStat;
    UIActivityIndicatorView * activity;
    UITableView * myTableView;
    
    NSString * lat;
    NSString * log;
    
    ZSXuanView * sXView;
    
    StrNXmlRemmed * zhXMLone;
    NSDictionary * myDictionary;
    NSDictionary * myLongtion;
    BOOL            storingCharacterData;
    NSString        *trackingCategoryName;
    NSString        *trackingReleaseDate;
    NSInteger mDownloadType;
    NSArray * elementArray;
    NSData * dataToParse;
    NSMutableArray * workingArray;
    NSMutableString * workingString;
    
    NSString * latStr1;
    NSString * latStr2;
    NSString * logStr1;
    NSString * logStr2;
    
    NSDictionary *xjdict;
    int g;
    
}
@property (nonatomic,retain)NSDictionary * xjdict;
@property (nonatomic,retain) StrNXmlRemmed * zhXMLone;
@property (nonatomic, retain) NSArray * elementArray;
@property (nonatomic,retain)NSData * dataToParse;
@property (nonatomic,retain)NSMutableString * workingString;
@property (nonatomic,retain)NSMutableArray * workingArray;
@property (nonatomic, assign) BOOL storingCharacterData;
@property (nonatomic, assign) NSString *trackingCategoryName;
@property (nonatomic, assign) NSString *trackingReleaseDate;

@property (nonatomic, retain) NSString * stringURL;
@property (nonatomic, retain) NSString * stringaa;
@property (nonatomic, retain) NSString * strMing;
@property (nonatomic, retain) NSString * xingJi;
@property (nonatomic, retain) NSString * canJig;
@property (nonatomic, retain) NSString * canJig1;
@property (nonatomic, retain) NSString * ruZhuri;
@property (nonatomic, retain) NSString * liDianri;
@property (nonatomic, retain) NSString * chengShiM;
@property (nonatomic, retain) NSString * lat;
@property (nonatomic, retain) NSString * log;
@property (nonatomic, retain) NSString * latStr1;
@property (nonatomic, retain) NSString * latStr2;
@property (nonatomic, retain) NSString * logStr1;
@property (nonatomic, retain) NSString * logStr2;
@property (nonatomic, assign) BOOL zhttpStat;
@property (nonatomic, retain) NSString * jvLizh;
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;






@end
