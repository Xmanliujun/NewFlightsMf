//
//  DengLuViewController.h
//  Flights
//
//  Created by mac on 12-12-13.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DengLuXML.h"
#import "ASIHTTPRequest.h"
@protocol DengLuViewControllerDelegate;

@interface DengLuViewController : UIViewController
<UITextFieldDelegate,UIActionSheetDelegate>

{
    UIActivityIndicatorView * activity;
    
    id<DengLuViewControllerDelegate>delegate;

    UITextField * User_ID;
    UITextField * Password;
    UIImageView *imageView;
    UIButton *btn;
    NSMutableArray *mArray;
    
    DengLuXML * DengLu;
    
    NSString * cString;
    
    ASIHTTPRequest * requestqq;
    
    UIImageView * imView;
    BOOL strat;
    UIView * oneView;
    
    
}
@property (nonatomic,assign) BOOL strat;
@property (nonatomic, retain)UIImageView *imView;
@property (nonatomic, retain)NSString * cString;
@property (nonatomic, retain)DengLuXML * DengLu;
@property (nonatomic, retain)NSMutableArray *mArray;
@property (nonatomic, retain)UITextField * User_ID;
@property (nonatomic, retain)UITextField * Password;
@property (nonatomic, assign)id<DengLuViewControllerDelegate>delegate;

@end

@protocol DengLuViewControllerDelegate <NSObject>
-(void)stringWith:(NSString *)string With:(NSString *)User_ID WithArray:(NSMutableArray *)ary;



@end
