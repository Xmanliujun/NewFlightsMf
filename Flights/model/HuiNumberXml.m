//
//  HuiNumberXml.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "HuiNumberXml.h"

@implementation HuiNumberXml
@synthesize hApprovalCount,hResult;

-(void)dealloc
{
    [hApprovalCount release];
    [hResult release];
    [super dealloc];
}
@end
