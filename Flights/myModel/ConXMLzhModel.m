//
//  ConXMLzhModel.m
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "ConXMLzhModel.h"

@interface ConXMLzhModel ()

@end

@implementation ConXMLzhModel
@synthesize RoomStay,mAddress,URL,BasicProperty,HotelName,RoomRate,RoomRatePlanCode,RoomTypeDesc,RoomStartDate,RoomEndDate,RoomTypeName,RoomBedType,Rate,RateAmountPrice,VendorName,VendorCode,RoomTypeCode,HotelEnName,CityCode,TolAmPic,Payment;

-(void)dealloc
{
    [RoomRate release];
    [RoomEndDate release];
    [RoomBedType release];
    [RoomRatePlanCode release];
    [RoomStartDate release];
    [RoomStay release];
    [RoomTypeDesc release];
    [RoomTypeName release];
    [BasicProperty release];
    [HotelName release];
    [URL release];
    [Rate release];
    [RateAmountPrice release];
    [mAddress release];
    [HotelEnName release];
    [CityCode release];
    [TolAmPic release];
    [Payment release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
