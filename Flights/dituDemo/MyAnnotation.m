//
//  MyAnnotation.m
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation
@synthesize place = _place;
-(id)init
{

    return [self initWithPlace:nil];
}
-(id)initWithPlace:(Place *)p
{
    self = [super init];
    if (self) {
        self.place = p;
    }
    return self;
}
+(id)annotationWithPlace:(Place *)p
{
    
    return [[[[self class] alloc] initWithPlace:p] autorelease];
}

-(CLLocationCoordinate2D)coordinate
{
    
    CLLocationCoordinate2D center;
    if (_place) {
        center.latitude = _place.latitude;
        center.longitude = _place.longitude;
    }else{
        center.longitude = self.place.longitude;
        center.latitude = self.place.latitude;
    }
    return center;
    
}

-(NSString * )title
{
    if (_place) {
        return [NSString stringWithString:_place.title];
    }

    return @"长春";
}
-(NSString *)subtitle
{
    if (_place) {
        return [NSString stringWithString:_place.subtitle];
    }
    return @"长春市区";
}
-(void)dealloc{
    
    self.place = nil;

    [super dealloc];
}
@end
