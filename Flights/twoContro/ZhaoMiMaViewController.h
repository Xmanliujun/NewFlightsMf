//
//  ZhaoMiMaViewController.h
//  Flights
//
//  Created by mac on 13-7-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface ZhaoMiMaViewController : UIViewController<UITextFieldDelegate,ASIHTTPRequestDelegate>
{
    UITextField *UserName;
    UIButton *button;
    
    UIActivityIndicatorView * activity;
    ASIHTTPRequest * requestaa;
    BOOL start;

}
@property (nonatomic, assign)BOOL start;
@end
