//
//  RootViewController.h
//  Flights
//
//  Created by mac on 12-10-18.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
@interface RootViewController : UIViewController
<UIApplicationDelegate,UIActionSheetDelegate,ASIHTTPRequestDelegate>
{
    UIImage * image;//导航图片
    UIImageView * _imageView;//电话号码图片
    UIImageView * myimageView;//子视图导航图片
    UIImageView * imaView;
    UIImageView *imageV;
    BOOL * rotHttp;
    ASIHTTPRequest * requsetNum;
    UIButton *bt1;
    UIButton *bt2;
    UIButton *bt3;
    UIButton *bt4;
    UIButton *bt5;
    UIButton *bt6;
    
 
    
}
@property (nonatomic, assign)BOOL * rotHttp;
@end
