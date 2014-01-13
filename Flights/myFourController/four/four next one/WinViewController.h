//
//  WinViewController.h
//  jiudian
//
//  Created by XmL on 12-11-7.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ImageViewCon.h"

//测试商品信息封装在Product中,外部商户可以根据自己商品实际情况定义
//
@interface Product : NSObject{
@private
	float     _price;
	NSString *_subject;
	NSString *_body;
	NSString *_orderId;
}

@property (nonatomic, assign) float price;
@property (nonatomic, retain) NSString *subject;
@property (nonatomic, retain) NSString *body;
@property (nonatomic, retain) NSString *orderId;

@end


@interface WinViewController : UIViewController

{

    NSMutableArray * myArray ;
    NSMutableArray * myTwoAry;
    NSDictionary * times;
    ImageViewCon * myImageView;
    NSString * roomNum;
    NSString * timeStar;
    NSString * timeEnd;
    
}

@property (nonatomic, retain)NSMutableArray * myArray;
@property (nonatomic, retain)NSMutableArray * myTwoAry;
@property (nonatomic ,retain)NSString * roomNum;
@property (nonatomic ,retain)NSString * timeStar;
@property (nonatomic ,retain)NSString * timeEnd;
-(id)initWithArray:(NSMutableArray *)array withTag:(NSString *)tag;
@end
