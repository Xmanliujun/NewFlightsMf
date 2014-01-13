//
//  HuiYuanViewController.h
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
@interface HuiYuanViewController : UIViewController
<UIAlertViewDelegate>
{
    UIActivityIndicatorView * activity;
    ASIHTTPRequest * huiYurequest;
    BOOL startHui;
   
    
    NSMutableArray *marray;
    NSMutableArray *mTArray;
  
    NSMutableArray * mHuiYuanarray;
}
@property(nonatomic,retain)NSMutableArray * mHuiYuanarray;
@property(nonatomic,retain)NSMutableArray * marray;
@property(nonatomic,retain)NSMutableArray * mTArray;
@property(nonatomic,assign)BOOL startHui;

-(id)initWithArray:(NSMutableArray *)array;

@end
