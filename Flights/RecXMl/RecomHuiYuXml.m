//
//  RecomHuiYuXml.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecomHuiYuXml.h"
#import "GDataXMLNode.h"
#import "HuiNumberXml.h"

@implementation RecomHuiYuXml


+(NSMutableArray *)recomHuiYuanmend:(NSString *)string
{
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];

    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        
        NSArray * item1 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/ApprovalCount" error:nil];
        
        HuiNumberXml * huiXml = [[[HuiNumberXml alloc] init] autorelease];
        
        if ([item1 count] != 0 ) {
            GDataXMLElement * hRes = [item1 objectAtIndex:0];
            huiXml.hResult = [NSString stringWithFormat:@"%@",hRes.stringValue];
            
        }if ([item2 count] != 0) {
            GDataXMLElement * hApp = [item2 objectAtIndex:0];
            huiXml.hApprovalCount = [NSString stringWithFormat:@"%@",hApp.stringValue];
        }
        
        [array addObject:huiXml];
        huiXml = nil;
    }

    
    return array;
}
@end
