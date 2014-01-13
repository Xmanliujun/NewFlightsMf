//
//  RecomYanzhXml.m
//  TripgCustomer
//
//  Created by XmL on 13-1-15.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecomYanzhXml.h"
#import "GDataXMLNode.h"
#import "CompanyID.h"
@implementation RecomYanzhXml


+(NSMutableArray *)recommendYanzheng:(NSString *)string
{
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        
        NSArray * item1 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/Sort_no" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//INFO/Operate_id" error:nil];
        
        
        CompanyID * company = [[[CompanyID alloc] init] autorelease];
        
        
        if ([item1 count] != 0) {
            GDataXMLElement * mRes = [item1 objectAtIndex:0];
            company.mComResult = [NSString stringWithFormat:@"%@",mRes.stringValue];
        }if ([item2 count] != 0) {
            GDataXMLElement * mSor = [item2 objectAtIndex:0];
            company.mComSort = [NSString stringWithFormat:@"%@",mSor.stringValue];
            
        }if ([item3 count] != 0) {
            GDataXMLElement * mOpe = [item3 objectAtIndex:0];
            company.mComOperat = [NSString stringWithFormat:@"%@",mOpe.stringValue];
        }
        
        [array addObject:company];
        company =nil;
    }
    
    
    
    
    
    return array;
}
@end
