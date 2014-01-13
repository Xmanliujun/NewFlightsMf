//
//  MyAnnotation.h
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "Place.h"
@interface MyAnnotation : NSObject

<MKAnnotation>
{
    Place * _place;


}
@property(nonatomic,retain)Place * place;


-(id)initWithPlace:(Place*)p;
+(id)annotationWithPlace:(Place * )p;
@end
