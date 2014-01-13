//
//  StrNXmlRemmed.m
//  Flights
//
//  Created by XmL on 13-5-10.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "StrNXmlRemmed.h"

@interface StrNXmlRemmed ()

@end

@implementation StrNXmlRemmed


@synthesize snSuccess,snHotelCode,snHotelName,snCountryCode,snPositionLog,snPositionLat,snRank,snAddress,snTel,snMinRate,snOUrl,snTwUrl,snThUrl,snFoUrl,snFiUrl,snSeUrl,snSiUrl,snEiUrl;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc
{
    [snSuccess release];
    [snHotelCode release];
    [snHotelName release];
    [snCountryCode release];
    [snPositionLog release];
    [snPositionLat release];
    [snRank release];
    [snAddress release];
    [snTel release];
    [snMinRate release];
    [snOUrl release];
    [snTwUrl release];
    [snThUrl release];
    [snFoUrl release];
    [snFiUrl release];
    [snSiUrl release];
    [snSeUrl release];
    [snEiUrl release];


    [super dealloc];
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
