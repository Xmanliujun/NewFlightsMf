//
//  NRecommenddexml.m
//  Flights
//
//  Created by XmL on 13-5-10.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "NRecommenddexml.h"
#import "GDataXMLNode.h"
#import "StrNXmlRemmed.h"


@implementation NRecommenddexml

+(NSMutableArray *)nRecommdenXml:(NSString *)string
{
    
    
    NSLog(@"解析 %@",string);
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    if (doc) {
        
        NSArray * item1 = [doc nodesForXPath:@"//OTResponse/HotelAvailRS/Success" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//OTResponse/HotelAvailRS/RoomStays/RoomStay" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//RoomStay/BasicProperty" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//BasicProperty/Position" error:nil];
        NSArray * item5 = [doc nodesForXPath:@"//BasicProperty/Rank" error:nil];
        NSArray * item6 = [doc nodesForXPath:@"//BasicProperty/Address" error:nil];
        NSArray * item7 = [doc nodesForXPath:@"//BasicProperty/Tel" error:nil];
        NSArray * item8 = [doc nodesForXPath:@"//BasicProperty/MinRate" error:nil];
        NSArray * item9 = [doc nodesForXPath:@"//BasicProperty/Images/URL_1" error:nil];
 
        if ([item2 count] != 0) {
            NSLog(@"解析数组长度 %d",[item2 count]);
            for (int i = 0 ; i < [item2 count]; i++) {
                
                StrNXmlRemmed * oneXml = [[[StrNXmlRemmed alloc] init] autorelease];
                
                if ([item1 count] > 0) {
                    
                    GDataXMLElement * suc = [item1 objectAtIndex:0];
                    oneXml.snSuccess = [NSString stringWithFormat:@"%@",suc.stringValue];
    
                }
                if ([item3 count] > 0) {
                    GDataXMLElement * basic = [item3 objectAtIndex:i];
                    oneXml.snHotelCode = [NSString stringWithFormat:@"%@",[basic attributeForName:@"HotelCode"].stringValue];
                    NSLog(@"hotelcode  %@",oneXml.snHotelCode);
                    oneXml.snHotelName = [NSString stringWithFormat:@"%@",[basic attributeForName:@"HotelName"].stringValue];
                    NSLog(@"hotelname  %@",oneXml.snHotelName);

                    oneXml.snCountryCode = [NSString stringWithFormat:@"%@",[basic attributeForName:@"CountryCode"].stringValue];
                    NSLog(@"CountryCode  %@",oneXml.snCountryCode);

                }
                if ([item4 count] > 0) {
                    GDataXMLElement * position = [item4 objectAtIndex:i];
                    oneXml.snPositionLog  = [NSString stringWithFormat:@"%@",[position attributeForName:@"Longitude"].stringValue];
                    NSLog(@"Longitude  %@",oneXml.snPositionLog);

                    oneXml.snPositionLat = [NSString stringWithFormat:@"%@",[position attributeForName:@"Latitude"].stringValue];
                    NSLog(@"Latitude  %@",oneXml.snPositionLat);

                }
                if ([item5 count] > 0) {
                    GDataXMLElement * rank = [item5 objectAtIndex:i];
                    oneXml.snRank = [NSString stringWithFormat:@"%@",rank.stringValue];
                    
                }
                if ([item6 count] > 0) {
                    GDataXMLElement * add = [item6 objectAtIndex:i];
                    oneXml.snAddress = [NSString stringWithFormat:@"%@",add.stringValue];
                    NSLog(@"add  %@",oneXml.snAddress);

                }
                if ([item7 count] > 0) {
                    GDataXMLElement * tel = [item7 objectAtIndex:i];
                    oneXml.snTel = [NSString stringWithFormat:@"%@",tel.stringValue];
                    
                }
                if ([item8 count] > 0) {
                    GDataXMLElement * min = [item8 objectAtIndex:i];
                    oneXml.snMinRate = [NSString stringWithFormat:@"%@",min.stringValue];
                    
                }
                if ([item9 count] > 0 && [item9 count] > i ) {
                    NSLog(@"one %d",[item9 count]);
                    
                    GDataXMLElement * oUrl = [item9 objectAtIndex:i];
                    oneXml.snOUrl = [NSString stringWithFormat:@"%@",oUrl.stringValue];
                }


                
                
                
                [array addObject:oneXml];
                oneXml = nil;
        
            }
            
            
            
            
        }
        
        
        
    }


    return array;
}

@end
