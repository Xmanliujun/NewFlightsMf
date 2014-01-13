//
//  RecomTiJiaoXMl.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecomTiJiaoXMl.h"
#import "GDataXMLNode.h"
#import "ShQXmlmodel.h"
@implementation RecomTiJiaoXMl

+(NSMutableArray *)recomtijiaoshenqing:(NSString *)string
{
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        NSArray * item1 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/Msg" error:nil];
        
        ShQXmlmodel * sqxml = [[[ShQXmlmodel alloc] init] autorelease];
        
        if ([item1 count] != 0) {
            GDataXMLElement * mRes = [item1 objectAtIndex:0];
            sqxml.sResult = [NSString stringWithFormat:@"%@",mRes.stringValue];
        }if ([item2 count] != 0) {
            GDataXMLElement *mSmg = [item2 objectAtIndex:0];
            sqxml.sMsg = [NSString stringWithFormat:@"%@",mSmg.stringValue];
        }
        
        [array addObject:sqxml];
        sqxml = nil;
        
        
    }
    


    return array;

}

@end
