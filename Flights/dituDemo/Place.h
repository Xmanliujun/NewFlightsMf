//
//  Place.h
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Place : NSObject
{

    NSString * title;
    NSString * subtitle;
    double  latitude;
    double  longitude;


}
@property(nonatomic ,retain)NSString * title;
@property(nonatomic ,retain)NSString * subtitle;
@property(nonatomic, assign)double latitude;
@property(nonatomic, assign)double longitude;

@end
