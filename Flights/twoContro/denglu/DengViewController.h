//
//  DengViewController.h
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
@interface DengViewController : UIViewController
<UITextFieldDelegate,UIActionSheetDelegate>

{
    UITextField * textfOne;
    UITextField * textfTwo;
     UIActivityIndicatorView * activity;
    NSMutableArray * myDengArray;
    NSMutableArray * myYanZheng;
    ASIHTTPRequest * requestaa;
   
    BOOL start;
    
    NSString * oneTe;
    NSString * twoTe;

    
    
    NSString * dengLuStr;
    
    
}
@property (nonatomic,retain)NSString * dengLuStr;
@property (nonatomic,retain)NSString * oneTe;
@property (nonatomic,retain)NSString * twoTe;
@property (nonatomic,retain)NSMutableArray * myDengArray;
@property (nonatomic,retain)NSMutableArray * myYanZheng;
@property (nonatomic, assign)BOOL start;
@property (nonatomic, assign)BOOL yanStart;
@end
