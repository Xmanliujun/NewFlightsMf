//
//  _DengLuViewController.h
//  Flights
//
//  Created by mac on 12-12-13.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DengLuXML.h"
#import "ASIHTTPRequest.h"
@protocol _DengluViewControllerDelegate;

@interface _DengLuViewController : UIViewController
<UITextFieldDelegate,UIActionSheetDelegate>
{
    id<_DengluViewControllerDelegate>delegate;
    
    UIActivityIndicatorView * activity;
    
    UITextField * User_ID;
    UITextField * Password;
    UIButton *btn;
    NSMutableArray *myArray;
    
    DengLuXML * DengLu;
    UIImageView *imageView;
    NSString *cString;
    
    UIImageView * imView;
    BOOL strat;
    ASIHTTPRequest * requestqa;
    UIView * oneView;
    
}
@property (nonatomic,assign) BOOL strat;
@property (nonatomic, retain)UIImageView * imView;
@property (nonatomic, retain)NSString * cString;
@property (nonatomic, retain)DengLuXML * DengLu;
@property (nonatomic, retain)NSMutableArray *myArray;
@property (nonatomic, retain)UITextField * User_ID;
@property (nonatomic, retain)UITextField * Password;
@property (nonatomic, assign)id<_DengluViewControllerDelegate>delegate;

@end

@protocol _DengluViewControllerDelegate <NSObject>

-(void)stringWith:(NSString *)string With:(NSString *)User_ID WithArray:(NSMutableArray *)ary;;

@end
