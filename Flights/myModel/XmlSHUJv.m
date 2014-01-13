//
//  XmlSHUJv.m
//  jiudian
//
//  Created by XmL on 12-10-24.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "XmlSHUJv.h"

@interface XmlSHUJv ()

@end

@implementation XmlSHUJv

@synthesize RoomStay,BasicProperty,Rank,Address,Tel,LongDesc,Images,MaxRate,MinRate,HotelCode,Latitude,Longitude;
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
    [LongDesc release];
    [Images release];
    [MaxRate release];
    [MinRate release];
    [HotelCode release];
    [Latitude release];
    [Longitude release];
    [super dealloc];
    
    
}
@end
