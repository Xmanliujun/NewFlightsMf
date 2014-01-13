//
//  TongYiXmlModel.m
//  TripgCustomer
//
//  Created by XmL on 13-1-17.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "TongYiXmlModel.h"

@implementation TongYiXmlModel
@synthesize tAppSta,tMsg,tResult;


-(void)dealloc
{
    [tAppSta release];
    [tMsg release];
    [tResult release];


    [super dealloc];
}
@end
