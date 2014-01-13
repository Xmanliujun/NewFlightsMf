//
//  ChangGJiuDViewController.h
//  jiudian
//
//  Created by XmL on 12-10-25.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XmlSHUJv.h"
#import "ContactModel.h"
#import "ASIFormDataRequest.h"

//#import "NewsIteme.h"
#import "DengLuViewController.h"
#import "DengLuXML.h"


@interface ChangGJiuDViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,DengLuViewControllerDelegate>
{
    
    ASIFormDataRequest * formDataRequest;
    
    NSInteger _newRow;
    NSArray * _myLocationArray;
    UITableView * newTableView;

    BOOL httpSta;
    NSString * addRess;
    NSString * ruDishi;
    NSString * liDishi;
    NSString * jiuDaim;
    NSString * sanZiMa;
    
    UIActivityIndicatorView * activity;
    
    UIImageView * imageview;
    NSMutableArray * schoolArray;
    NSMutableString * workingString;

    NSString * chuanZhiMi;
    
     NSDictionary * myDictionary;
     NSDictionary * rateDictionary;

    UIButton * yuDingbtn;
    
    NSString *aString;
    NSString *ccString;
    NSMutableArray * deleArray;
    
    DengLuXML * denglu;


}

@property (nonatomic, retain)DengLuXML * denglu;
@property (nonatomic, retain)NSString * aString;
@property (nonatomic, retain)NSString * ccString;
@property (nonatomic, retain)NSMutableArray * deleArray;

@property (nonatomic, retain) NSArray * myLocationArray;
@property (nonatomic, assign) BOOL httpSta;
@property (nonatomic, retain) NSString * chuanZhiMi;
@property (nonatomic, retain) NSString * ruDishi;
@property (nonatomic, retain) NSString * liDishi;
@property (nonatomic, retain) NSString * jiuDaim;
@property (nonatomic, retain) NSString * addRess;
@property (nonatomic, retain) NSString * sanZiMa;


@property(nonatomic,retain)NSMutableString * workingString;

@property(nonatomic,retain)NSMutableArray * schoolArray;





@end

