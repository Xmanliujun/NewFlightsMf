//
//  RecomTongYiXml.m
//  TripgCustomer
//
//  Created by XmL on 13-1-17.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecomTongYiXml.h"
#import "GDataXMLNode.h"
#import "TongYiXmlModel.h"
@implementation RecomTongYiXml



+(NSMutableArray *)recomTongYiString:(NSString *)string
{
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    if (doc) {
        
        NSArray * item1 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/Msg" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"/INFO/AppStatus" error:nil];
        TongYiXmlModel * tyXml = [[[TongYiXmlModel alloc] init] autorelease];
        
        if ([item1 count] != 0 ) {
            
            GDataXMLElement * yRes = [item1 objectAtIndex:0];
            tyXml.tResult = [NSString stringWithFormat:@"%@",yRes.stringValue];
            
        }if ([item2 count] != 0) {
            GDataXMLElement * yMsy = [item2 objectAtIndex:0];
            tyXml.tMsg = [NSString stringWithFormat:@"%@",yMsy.stringValue];
            
        }if ([item3 count] != 0) {
            GDataXMLElement * yApp = [item3 objectAtIndex:0];
            tyXml.tAppSta = [NSString stringWithFormat:@"%@",yApp.stringValue];
            
        }
        [array addObject:tyXml];
        tyXml = nil;
        
        
        
    }

    
    
    return array;
}
@end
