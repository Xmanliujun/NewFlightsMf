//
//  Place.m
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "Place.h"

@implementation Place
@synthesize title,subtitle,latitude,longitude;


-(void)dealloc
{
    [title release];
    [subtitle release];

    [super dealloc];
    
}
@end
