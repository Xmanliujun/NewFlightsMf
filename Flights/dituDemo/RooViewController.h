//
//  RootViewController.h
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@interface RooViewController : UIViewController
{

    MKMapView * myMapView;
    NSMutableArray * twoPlaceAry;
    NSMutableArray * placeArray;
 
}
@property(nonatomic ,retain)NSMutableArray * twoPlaceAry;
@property(nonatomic ,retain)NSMutableArray * placeArray;

-(id)initWithArray:(NSMutableArray *)array withTag:(NSString * )tag;
@end
