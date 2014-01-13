//
//  NewItem.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "NewItem.h"

@implementation NewItem
@synthesize nTravel,nDept_name,nComplete_status,nCost_id,nTravel_realname,nTravel_username,nSab_leave,nEnd_date,nStart_date,nDescription,nCurrency,nEstimated_amounts,nLoan_amounts,nApproval_type,nFlight_type,nExpired,nSort_no;


-(void)dealloc
{
    [nSort_no release]; 
    [nTravel release];
    [nTravel_realname release];
    [nTravel_username release];
    [nDescription release];
    [nDept_name release];
    [nCurrency release];
    [nCost_id release];
    [nComplete_status release];
    [nExpired release];
    [nFlight_type release];
    [nApproval_type release];
    [nLoan_amounts release];
    [nEnd_date release];
    [nStart_date release];
    [nSab_leave release];
    [nEstimated_amounts release];

    [super dealloc];
}
@end
