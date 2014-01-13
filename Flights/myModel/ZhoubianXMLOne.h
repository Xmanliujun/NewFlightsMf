//
//  ZhoubianXMLOne.h
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZhoubianXMLOne : UIViewController
{
    NSString *RoomStay;
    NSString *BasicProperty;
    NSString *Address;
    NSString *Rank;
    NSString *Tel;
    NSString *Images;
    NSString * MaxRate;
    NSString * MinRate;
    NSString * HotelCode;
    NSString * Longitude;
    NSString * Latitude;
}
@property (nonatomic, retain) NSString *RoomStay;
@property (nonatomic, retain) NSString *BasicProperty;
@property (nonatomic, retain) NSString *Rank;
@property (nonatomic, retain) NSString *Address;
@property (nonatomic, retain) NSString *Tel;
@property (nonatomic, retain) NSString *Images;
@property (nonatomic, retain) NSString *MaxRate;
@property (nonatomic, retain) NSString *MinRate;
@property (nonatomic, retain) NSString *HotelCode;
@property (nonatomic, retain) NSString *Longitude;
@property (nonatomic, retain) NSString *Latitude;
@end
