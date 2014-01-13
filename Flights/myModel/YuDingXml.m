//
//  YuDingXml.m
//  jiudian
//
//  Created by XmL on 12-11-7.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "YuDingXml.h"

@interface YuDingXml ()

@end

@implementation YuDingXml
@synthesize CreateTime,CreateDateTime,ResStatus,ResOrderID,HotelName,Address,StartDate,EndDate,RoomNight,RoomTypeName,Quantity,TotalAmount,PersonName,Mobile,VendorResId,ArriveEarlyTime,cityName;

-(void)dealloc{

    [CreateDateTime release];
    [CreateTime release];
    [ResStatus release];
    [ResOrderID release];
    [HotelName release];
    [Address release];
    [StartDate release];
    [EndDate release];
    [RoomNight release];
    [RoomTypeName release];
    [Quantity release];
    [TotalAmount release];
    [PersonName release];
    [Mobile release];
    [VendorResId release];
    [ArriveEarlyTime release];


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
