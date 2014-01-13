//
//  ZhenJianHaoViewController.h
//  Flights
//
//  Created by mac on 13-7-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface ZhenJianHaoViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate>
{
    UITextField *zhengjianhao;
    UIButton *button;
    
    UIActivityIndicatorView * activity;
    ASIHTTPRequest * requestaa;
    BOOL start;
    
    
}

@property (nonatomic, assign)BOOL start;

@end
