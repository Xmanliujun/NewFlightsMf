//
//  RemconqueDongTai.m
//  Flights
//
//  Created by mac on 13-2-20.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "RemconqueDongTai.h"
#import "GDataXMLNode.h"
#import "DongTai.h"

@implementation RemconqueDongTai
+(NSMutableArray*)recommendedParser:(NSString*)string
{
    
    // NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    NSMutableArray *twoArray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    NSLog(@"解析字符串 %@",string);
    
    GDataXMLDocument * doco = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    if (doco) {
        NSArray * item = [doco nodesForXPath:@"//Flight/FlightDate" error:nil];
        NSArray * item1 = [doco nodesForXPath:@"//Flight/FlightNote" error:nil];
        NSArray * item2 = [doco nodesForXPath:@"//Flight/FlightNullCode" error:nil];
        NSArray * itemaaa = [doco nodesForXPath:@"//Flight/FlightInfo" error:nil];
        
        NSArray * item3 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightCompany" error:nil];
        NSArray * item4 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightNo" error:nil];
        NSArray * item5 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightDepcode" error:nil];
        NSArray * item6 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightArrcode" error:nil];
        NSArray * item7 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightDep" error:nil];
        NSArray * item8 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightArr" error:nil];
        NSArray * item9 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightDeptimePlan" error:nil];
        NSArray * item10 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightArrtimePlan" error:nil];
        NSArray * item11 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightDeptime" error:nil];
        NSArray * item12 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightArrtime" error:nil];
        NSArray * item13 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightState" error:nil];
        NSArray * item14 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightTerminal" error:nil];
        NSArray * item15 = [doco nodesForXPath:@"//Flight/FlightInfo/FlightHTerminal" error:nil];
        
        
        if ([itemaaa count] != 0) {
            for (int i = 0; i < [itemaaa count]; i++) {
                //  GDataXMLNode *node = [itemaaa objectAtIndex:i];
                
                NSLog(@"itemaaa %d",1+i);
                
                //  for (int j = 0; j < node.childCount; j++) {
                DongTai * dong = [[[DongTai alloc]init] autorelease];
                
                
                if ([item count] != 0) {
                    GDataXMLElement * mFlightDate = [item objectAtIndex:0];
                    dong.FlightDate = [NSString stringWithFormat:@"%@",mFlightDate.stringValue];
                }
                
                if ([item1 count] != 0) {
                    GDataXMLElement * mFlightNote = [item1 objectAtIndex:0];
                    dong.FlightNote = [NSString stringWithFormat:@"%@",mFlightNote.stringValue];
                }
                
                if ([item2 count] != 0) {
                    GDataXMLElement * mFlightNullCode = [item2 objectAtIndex:0];
                    dong.FlightNullCode = [NSString stringWithFormat:@"%@",mFlightNullCode.stringValue];
                }
                
                //子节点内容
                if ([item3 count] != 0) {
                    GDataXMLElement * mFlightCompany = [item3 objectAtIndex:i];
                    dong.FlightCompany = [NSString stringWithFormat:@"%@",mFlightCompany.stringValue];
                    NSLog(@"************ %@",dong.FlightCompany);
                    
                }
                if ([item4 count] != 0){
                    GDataXMLElement * mFlightNo = [item4 objectAtIndex:i];
                    dong.FlightNo = [NSString stringWithFormat:@"%@",mFlightNo.stringValue];
                    
                }
                if ([item5 count] != 0){
                    GDataXMLElement * mFlightDepcode = [item5 objectAtIndex:i];
                    dong.FlightDepcode = [NSString stringWithFormat:@"%@",mFlightDepcode.stringValue];
                    
                }if ([item6 count] != 0) {
                    GDataXMLElement * mFlightArrcode = [item6 objectAtIndex:i];
                    dong.FlightArrcode = [NSString stringWithFormat: @"%@",mFlightArrcode.stringValue];
                    
                }if ([item7 count] != 0) {
                    GDataXMLElement * mFlightDep = [item7 objectAtIndex:i];
                    dong.FlightDep = [NSString stringWithFormat:@"%@",mFlightDep.stringValue];
                    
                }if ([item8 count] != 0) {
                    GDataXMLElement * mFlightArr = [item8 objectAtIndex:i];
                    dong.FlightArr = [NSString stringWithFormat:@"%@",mFlightArr.stringValue];
                    
                }if ([item9 count] != 0) {
                    GDataXMLElement * mFlightDeptimePlan = [item9 objectAtIndex:i];
                    dong.FlightDeptimePlan = [NSString stringWithFormat:@"%@",mFlightDeptimePlan.stringValue];
                    
                }if ([item10 count] != 0) {
                    GDataXMLElement * mFlightArrtimePlan = [item10 objectAtIndex:i];
                    dong.FlightArrtimePlan = [NSString stringWithFormat:@"%@",mFlightArrtimePlan.stringValue];
                    
                }if ([item11 count] != 0) {
                    GDataXMLElement * mFlightDeptime = [item11 objectAtIndex:i];
                    dong.FlightDeptime = [NSString stringWithFormat:@"%@",mFlightDeptime.stringValue];
                }
                
                if ([item12 count] != 0) {
                    GDataXMLElement * mFlightArrtime = [item12 objectAtIndex:i];
                    dong.FlightArrtime = [NSString stringWithFormat:@"%@",mFlightArrtime.stringValue];
                }
                
                if ([item13 count] != 0) {
                    GDataXMLElement * mFlightState = [item13 objectAtIndex:i];
                    dong.FlightState = [NSString stringWithFormat:@"%@",mFlightState.stringValue];
                }
                
                if ([item14 count] != 0) {
                    GDataXMLElement * mFlightTerminal = [item14 objectAtIndex:i];
                    dong.FlightTerminal = [NSString stringWithFormat:@"%@",mFlightTerminal.stringValue];
                }
                
                if ([item15 count] != 0) {
                    GDataXMLElement * mFlightHTerminal = [item15 objectAtIndex:i];
                    dong.FlightHTerminal = [NSString stringWithFormat:@"%@",mFlightHTerminal.stringValue];
                }
                
                [twoArray addObject:dong];
                NSLog(@"内部循环数组长度 %d",[twoArray count]);
                DongTai * aat = [twoArray objectAtIndex:[twoArray count]-1];
                NSLog(@"^^^^^^^^^^  %@",aat.FlightCompany);
                
                
            }
        }
    }
    
    return  twoArray;
    
}
@end