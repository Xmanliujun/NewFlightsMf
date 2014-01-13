//
//  ConXMLzhModel.h
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConXMLzhModel : UIViewController
{
    
    NSString * URL;
    NSString * RoomStay;
    NSString * mAddress;
    NSString * BasicProperty;
    NSString * HotelName;
    NSString * HotelEnName;
    NSString * CityCode;
     NSString * TolAmPic;
    
    NSString * RoomRate;
    NSString * RoomRatePlanCode;
    NSString * RoomTypeDesc;
    NSString * RoomStartDate;
    NSString * RoomEndDate;
    NSString * RoomTypeName;
    NSString * RoomBedType;
    NSString * RoomTypeCode;
    NSString * VendorCode;
    NSString * VendorName;
    NSString * Payment;
    
    NSString * Rate;
    NSString * RateAmountPrice;
    
    
    
}
@property (nonatomic , retain)NSString * TolAmPic;
@property (nonatomic , retain)NSString * URL;
@property (nonatomic , retain)NSString * RoomStay;
@property (nonatomic , retain)NSString * mAddress;
@property (nonatomic , retain)NSString * BasicProperty;
@property (nonatomic , retain)NSString * HotelName;
@property (nonatomic , retain)NSString * HotelEnName;
@property (nonatomic , retain)NSString * CityCode;
@property (nonatomic , retain)NSString * Payment;
@property (nonatomic , retain)NSString * RoomRate;
@property (nonatomic , retain)NSString * RoomRatePlanCode;
@property (nonatomic , retain)NSString * RoomTypeDesc;
@property (nonatomic , retain)NSString * RoomStartDate;
@property (nonatomic , retain)NSString * RoomEndDate;
@property (nonatomic , retain)NSString * RoomTypeName;
@property (nonatomic , retain)NSString * RoomBedType;
@property (nonatomic , retain)NSString * RoomTypeCode;
@property (nonatomic , retain)NSString * VendorCode;
@property (nonatomic , retain)NSString * VendorName;


@property (nonatomic , retain)NSString * Rate;
@property (nonatomic , retain)NSString * RateAmountPrice;


@end
