//
//  YuDingViewController.h
//  jiudian
//
//  Created by XmL on 12-10-30.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TimesView.h"
#import "ASIFormDataRequest.h"

@interface YuDingViewController : UIViewController
<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate,NSXMLParserDelegate>
{
   
    ASIFormDataRequest * formDataRequest;
    ASIHTTPRequest * mget11Request;
    BOOL gstrat;
    
    UITableView * myTableView;
    TimesView * times;
    int i;
    NSString * hotelName;
    NSString * hotelEnName;
    NSString * hotelCode;
    NSString * startDate;
    NSString * endDate;
    NSString * roomTypeName;
    NSString * roomTypeCode;
    NSString * amountPrice;
    NSString * ratePlanCode;
    NSString * vendorCode;
    NSString * vendorName;
    NSString * roomTypeDesc;
    NSString * payMent;
    
    NSString * cSanZim;
    NSString * roomName;
    
    UITextField * renMing;
    UITextField * phone;
    UIView * oneView;
    UIView * twoView;
    UIButton * btnone;
    UIButton * btnAdd;
    NSString * myMuch;
    
    NSString * string21;
    NSString * string22;
    NSString * text;
    NSString * text1;
    NSString * intStr;
    
    NSDictionary *cities;
    NSArray *keys;
    NSArray * array;
    NSArray * zArray;
    NSArray * laArray;
    UILabel * lattbtn;
    UILabel * labtn;
    
    
    NSMutableArray * schoolArray;
    NSString * taga;
    
    
    NSData * dataToParse;
    BOOL            storingCharacterData;
    NSString        *trackingCategoryName;
    NSString        *trackingReleaseDate;
    NSInteger mDownloadType;
    NSMutableString * workingString;
     NSArray * elementArray;
    
    
    UIActivityIndicatorView * activity;
    BOOL httpYu;
    
    NSMutableArray * dengArray;
    
}
@property (nonatomic,assign) BOOL httpYu;
@property (nonatomic,assign) BOOL gstrat;
@property (nonatomic, retain) NSArray * elementArray;
@property(nonatomic,retain)NSData * dataToParse;
@property(nonatomic,retain)NSMutableString * workingString;
@property (nonatomic, assign) BOOL storingCharacterData;
@property (nonatomic, assign) NSString *trackingCategoryName;
@property (nonatomic, assign) NSString *trackingReleaseDate;
@property (nonatomic,retain)NSMutableArray * dengArray;
@property (nonatomic,retain)NSMutableArray *schoolArray;
@property (nonatomic, assign) NSString * taga;

@property(nonatomic,retain)NSString * startDate;
@property(nonatomic,retain)NSString * endDate;
@property(nonatomic,retain)NSString * roomTypeName;
@property(nonatomic,retain)NSString * roomTypeCode;
@property(nonatomic,retain)NSString * amountPrice;
@property(nonatomic,retain)NSString * ratePlanCode;
@property(nonatomic,retain)NSString * vendorCode;
@property(nonatomic,retain)NSString * vendorName;
@property(nonatomic,retain)NSString * roomTypeDesc;
@property(nonatomic,retain)NSString * hotelName;
@property(nonatomic,retain)NSString * hotelEnName;
@property(nonatomic,retain)NSString * hotelCode;
@property(nonatomic,retain)NSString * myMuch;
@property(nonatomic,retain)NSString * payMent;

@property(nonatomic,retain)NSString * cSanZim;
@property(nonatomic,retain)NSString * roomName;

@property(nonatomic,retain)NSString * string21;
@property(nonatomic,retain)NSString * string22;
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)NSString * text1;
@property(nonatomic,retain)NSString * intStr;

@property(nonatomic,retain)UITextField * renMing;
@property(nonatomic,retain)UITextField * phone;

@property(nonatomic,retain)NSArray * laArray;
@property(nonatomic,retain)NSArray * array;
@property(nonatomic,retain)NSArray *zArray;
@property (nonatomic, retain) NSDictionary *cities;
@property (nonatomic, retain) NSArray *keys;
@property NSUInteger curSection;
@property NSUInteger curRow;

-(id)initWithTag:(NSString * )tag WithArray:(NSMutableArray *)ary;

@end
