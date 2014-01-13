//
//  ZhoubianXMLOne.m
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "ZhoubianXMLOne.h"

@interface ZhoubianXMLOne ()

@end

@implementation ZhoubianXMLOne
@synthesize RoomStay,BasicProperty,Rank,Address,Tel,Images,MaxRate,MinRate,HotelCode,Latitude,Longitude;
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

-(void)dealloc{
    
    
    [RoomStay release];
    [BasicProperty release];
    [Rank release];
    [Address release];
    [Tel release];
    [Images release];
    [MaxRate release];
    [MinRate release];
    [HotelCode release];
    [Latitude release];
    [Longitude release];
    [super dealloc];
    
    
}

@end
