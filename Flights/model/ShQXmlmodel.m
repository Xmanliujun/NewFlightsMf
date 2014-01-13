//
//  ShQXmlmodel.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "ShQXmlmodel.h"

@implementation ShQXmlmodel
@synthesize sMsg,sResult;

-(void)dealloc
{
    [sResult release];
    [sMsg release];

    [super dealloc];
}
@end
