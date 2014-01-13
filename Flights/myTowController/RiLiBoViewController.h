//
//  RiLiBoViewController.h
//  jiudian
//
//  Created by XmL on 12-10-18.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VRGCalendarView.h"

@protocol RiLiBoView;



@interface RiLiBoViewController : UIViewController
<VRGCalendarViewDelegate>
{
    UIButton * button;
    NSString * string4;
    id<RiLiBoView>delegate;
    
    NSString * anewNianFen;
    NSString * anewYunStr;
    NSString * anewDayStr;

    NSDate * datey ;
   
    NSString * tag;
    
}
@property(nonatomic,retain)NSString * string4;
@property(nonatomic,retain)NSString * anewYunStr;
@property(nonatomic,retain)NSString * anewDayStr;
@property(nonatomic,retain)NSString * anewNianFen;
@property(nonatomic,assign)id<RiLiBoView>delegate;
@property(nonatomic,retain)NSString * tag;


@end


@protocol RiLiBoView <NSObject>

-(void)chuanzhiString:(NSString *)strNian withStrt:(NSString*)strYue withStr:(NSString*)strDay withTag:(NSString *)tag;

@end