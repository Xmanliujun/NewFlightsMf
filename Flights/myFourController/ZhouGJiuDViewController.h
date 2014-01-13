//
//  ZhouGJiuDViewController.h
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIFormDataRequest.h"
#import "DengLuViewController.h"
#import "DengLuXML.h"
@interface ZhouGJiuDViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate,DengLuViewControllerDelegate>
{
    NSString * addRess;
    NSString * ruDishi;
    NSString * liDishi;
    NSString * jiuDaim;
    NSString * sanZiMa;

    NSMutableArray * schoolArray;
    UIActivityIndicatorView * activity;
    
    UITableView * newTableView;
    ASIFormDataRequest * formDataRequest;
    
    BOOL httpStat;
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

@property (nonatomic, retain) NSString * ruDishi;
@property (nonatomic, retain) NSString * liDishi;
@property (nonatomic, retain) NSString * jiuDaim;
@property (nonatomic, retain) NSString * addRess;
@property (nonatomic, retain) NSString * sanZiMa;
@property (nonatomic, assign) BOOL httpStat;
@property(nonatomic,retain)NSMutableArray * schoolArray;

@end
