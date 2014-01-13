//
//  ChangChaXunViewController.h
//  jiudian
//
//  Created by XmL on 12-10-24.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XmlSHUJv.h"
#import "SXView.h"
#import "EGORefreshTableHeaderView.h"
#import "EGOLoadMoreTableFooterView.h"


#import "ASIFormDataRequest.h"
@interface ChangChaXunViewController : UIViewController
<NSXMLParserDelegate,UITableViewDataSource,UITableViewDelegate,UIAlertViewDelegate,EGORefreshTableHeaderDelegate,EGOLoadMoreTableFooterDelegate>

{
    
    EGORefreshTableHeaderView *_refreshHeaderView;
    EGOLoadMoreTableFooterView * _loadMoreFooterView;
    EGOLoadMoreTableFooterView *view;
    
    BOOL _reloading;
    
    ASIFormDataRequest * formDataRequest;
    UIActivityIndicatorView * activity;
    NSString * ruZhuri;
    NSString * liDianri;
    NSString * chengShiM;
    NSString * xingJi;
    NSString * canJig;
    NSString * canJig1;
    
    NSTimer * _timer;
    XmlSHUJv * woekingEntry;
    BOOL            storingCharacterData;
    NSString        *trackingCategoryName;
    NSString        *trackingReleaseDate;
    NSInteger mDownloadType;
    NSArray * elementArray;
    NSData * dataToParse;
    NSMutableArray * workingArray;
    NSMutableString * workingString;
    
    BOOL httpStar;
    
    UITableView * tableViewone;
    
    NSDictionary * myDictionary;
    NSDictionary * myImage;
    NSString * myString;
    
    NSString * stringaa;
    NSString * sanZiMa;
    NSString * strMing;
    
    SXView * sxviewa;
    
    NSDictionary * xjdict;
     int i;
    
}
@property (nonatomic, retain) NSDictionary * xjdict;
@property (nonatomic, retain) NSString * strMing;
@property (nonatomic, retain) NSString * sanZiMa;
@property (nonatomic, retain) NSString * stringaa;
@property (nonatomic, retain) NSString * ruZhuri;
@property (nonatomic, retain) NSString * liDianri;
@property (nonatomic, retain) NSString * chengShiM;
@property (nonatomic, retain) NSString * myString;
@property (nonatomic, retain) NSString * xingJi;
@property (nonatomic, retain) NSString * canJig;
@property (nonatomic, retain) NSString * canJig1;

@property(nonatomic,retain)XmlSHUJv * workingEntry;

@property (nonatomic, retain) NSArray * elementArray;
@property(nonatomic,retain)NSData * dataToParse;
@property(nonatomic,retain)NSMutableString * workingString;
@property(nonatomic,retain)NSMutableArray * workingArray;
@property (nonatomic, assign) BOOL storingCharacterData;
@property (nonatomic, assign) NSString *trackingCategoryName;
@property (nonatomic, assign) NSString *trackingReleaseDate;
@property (nonatomic, assign) BOOL httpStar;




- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;






@end
