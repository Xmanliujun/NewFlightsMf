//
//  ShenPiRenXML.m
//  Flights
//
//  Created by mac on 13-4-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ShenPiRenXML.h"
#import "GDataXMLNode.h"
#import "ShenPiRen.h"

@implementation ShenPiRenXML
+(NSMutableArray *)recommendYanzheng:(NSString *)string
{
    NSMutableArray * mmarray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        
        NSArray * item1 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/Sort_no" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//INFO/Operates/Operate/Operate_id" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//INFO/Operates/Operate/Operate_name" error:nil];
        
        ShenPiRen * company = [[[ShenPiRen alloc] init] autorelease];
        
        
        if ([item1 count] != 0) {
            
            GDataXMLElement * mRes = [item1 objectAtIndex:0];
            company.mmResult = [NSString stringWithFormat:@"%@",mRes.stringValue];
            
        }if ([item2 count] != 0) {
            
            GDataXMLElement * mSor = [item2 objectAtIndex:0];
            company.mmSort_no = [NSString stringWithFormat:@"%@",mSor.stringValue];
            
        }if ([item3 count] != 0) {
            
            GDataXMLElement * mOpe = [item3 objectAtIndex:0];
            company.mmOperate_id = [NSString stringWithFormat:@"%@",mOpe.stringValue];
            
        }if ([item4 count] != 0) {
            
            GDataXMLElement * mOpr = [item4 objectAtIndex:0];
            company.mmOperate_name = [NSString stringWithFormat:@"%@",mOpr.stringValue];
            
        }
        
        [mmarray addObject:company];
        company =nil;
    }
    
    
    
    
    
    return mmarray;
}

@end
