//
//  MySliderViewController.h
//  jiudian
//
//  Created by XmL on 12-10-18.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MySlider;



@interface MySliderViewController : UIViewController


{
    id<MySlider>delegate;
    UILabel *leftLabel;
	UILabel *rightLabel;
    
    UILabel * xingLabel;
    NSString * tag;
    NSString * str3;
}

@property(nonatomic,assign)id<MySlider>delegate;
@property(nonatomic,retain)NSString * tag;
@property(nonatomic,retain)NSString * str3;
@end

@protocol MySlider <NSObject>

-(void)sliderString:(NSString *)str11 withStrt:(NSString*)str22 withStr:(NSString*)str33 withTag:(NSString *)tag;

@end