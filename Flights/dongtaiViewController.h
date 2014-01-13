//
//  dongtaiViewController.h
//  Flights
//
//  Created by mac on 13-2-19.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "CListViewController.h"



@interface dongtaiViewController : UIViewController
<UITextFieldDelegate,UIApplicationDelegate,CListViewControllerProtocol>

{
    
    UIImageView * image1;
    
    UIButton *b1;
    UIButton *b2;
    CListViewController *detailViewController;
    
    UIImage *leftItem;
    UIBarButtonItem *leftItems;
    UIImageView *imageView;
    UITextField *tf_1;
    UITextField *tf_2;
    UITextField *tf_3;
    
    ASIHTTPRequest * yy_request;
    UIActivityIndicatorView * activity;
    
    UIView * awardBackGroundView;
    UIView * awardBGView;
    UIWindow *aWindow;
    
    UIView *oneview;
    UIButton *_btn1;
    UILabel *labs;
    UILabel *lable1;
    UIButton *_btn2;
    UILabel *labw;
    UILabel *lable2;
    UILabel * la1;
    UIButton *btn1;
    UIButton *btn;
    NSString *str22;
    NSString *str;
    NSDictionary *dict;
    UILabel *la;
    
    BOOL start;
    
    NSMutableArray * DoArray;
}

@property (nonatomic, assign)BOOL start;
@property (nonatomic, retain)ASIHTTPRequest * yy_request;
@property (nonatomic, retain)UIActivityIndicatorView * activity;
@property (nonatomic, retain)NSMutableArray * DoArray;
@property (nonatomic, retain)NSString * str22;
@property (nonatomic, retain)UILabel *la1;
@property (nonatomic, retain)NSDictionary * dict;
@property (nonatomic, retain)NSString *str;
@property NSUInteger curSection;
@property NSUInteger curRow;

@end
