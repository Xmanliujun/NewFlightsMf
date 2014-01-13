//
//  RecommendYDXml.m
//  jiudian
//
//  Created by XmL on 12-11-7.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "RecommendYDXml.h"
#import "GDataXMLNode.h"
#import "YuDingXml.h"
@implementation RecommendYDXml
+(NSMutableArray*)recommendedParser:(NSString*)string
{

    NSLog(@"开始解析");
    NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];

    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    
    if (doc) {
        NSArray * item = [doc nodesForXPath:@"//HotelReservations/HotelReservation" error:nil];
        NSLog(@"数组长度 %d",[item count]);
        NSArray * item1 = [doc nodesForXPath:@"//RoomStay/BasicProperty" error:nil];
        NSLog(@"1数组长度 %d",[item1 count]);
        NSArray * item2 = [doc nodesForXPath:@"//BasicProperty/Address" error:nil];
        NSLog(@"2数组长度 %d",[item2 count]);
        NSArray * item3 = [doc nodesForXPath:@"//RoomRates/RoomRate" error:nil];
        NSLog(@"3数组长度 %d",[item3 count]);
        NSArray * item4 = [doc nodesForXPath:@"//HotelResRS/Success" error:nil];
        NSLog(@"4数组长度 %d",[item4 count]);
//        NSArray * item5 = [doc nodesForXPath:@"//RoomRate/RoomNight" error:nil];
//        NSLog(@"5数组长度 %d",[item5 count]);
        NSArray * item6 = [doc nodesForXPath:@"//RoomStay/TotalAmount" error:nil];
        NSLog(@"6数组长度 %d",[item6 count]);
        NSArray * item7 = [doc nodesForXPath:@"//GuestProfile/PersonName" error:nil];
        NSLog(@"7数组长度 %d",[item7 count]);
        NSArray * item8 = [doc nodesForXPath:@"//GuestProfile/Mobile" error:nil];
        NSLog(@"8数组长度 %d",[item8 count]);
        NSArray * item9 = [doc nodesForXPath:@"//ResGlobalInfo/ArriveEarlyTime" error:nil];
        NSLog(@"9数组长度 %d",[item9 count]);
        
        if ([item1 count] > 0) {
            
      
        for (int i = 0; i < [item1 count]; i++) {
            
            YuDingXml * yuXml = [[[YuDingXml alloc] init] autorelease];
            
            GDataXMLElement * item0 = [item objectAtIndex:i];
            GDataXMLElement * itema = [item1 objectAtIndex:i];
            GDataXMLElement * itemb = [item2 objectAtIndex:i];
            GDataXMLElement * itemc = [item3 objectAtIndex:i];
            GDataXMLElement * itemd = [item4 objectAtIndex:i];
//            GDataXMLElement * iteme = [item5 objectAtIndex:i];
            GDataXMLElement * itemf = [item6 objectAtIndex:i];
            GDataXMLElement * itemg = [item7 objectAtIndex:i];
            GDataXMLElement * itemh = [item8 objectAtIndex:i];
            GDataXMLElement * itemI = [item9 objectAtIndex:i];
            if (i == 0) {
                
                yuXml.CreateDateTime = [NSString stringWithFormat:@"%@",[item0 attributeForName:@"CreateDateTime"].stringValue];
                NSLog(@"%@",yuXml.CreateDateTime);
                yuXml.CreateTime = [NSString stringWithFormat:@"%@",[item0 attributeForName:@"CreateTime"].stringValue];
                     NSLog(@"%@",yuXml.CreateTime);
                yuXml.ResStatus = [NSString stringWithFormat:@"%@",[item0 attributeForName:@"ResStatus"].stringValue];
                    NSLog(@"%@",yuXml.ResStatus);
                yuXml.ResOrderID = [NSString stringWithFormat:@"%@",[item0 attributeForName:@"ResOrderID"].stringValue];
                    NSLog(@"A %@",yuXml.ResOrderID);
                yuXml.VendorResId = [NSString stringWithFormat:@"%@",[item0 attributeForName:@"VendorResID"].stringValue];
                    NSLog(@"%@",yuXml.VendorResId);

                
                yuXml.HotelName = [NSString stringWithFormat:@"%@",[itema attributeForName:@"HotelName"].stringValue];
                    NSLog(@"%@",yuXml.HotelName);
                
                
                yuXml.Address = [NSString stringWithFormat:@"%@",itemb.stringValue];
                    NSLog(@"%@",yuXml.Address);

                yuXml.ArriveEarlyTime = [NSString stringWithFormat:@"%@",itemI.stringValue];
                    NSLog(@"%@",yuXml.ArriveEarlyTime);
                
                yuXml.RoomTypeName = [NSString stringWithFormat:@"%@",[itemc attributeForName:@"RoomTypeName"].stringValue];
                    NSLog(@"%@",yuXml.RoomTypeName);
                
                yuXml.StartDate = [NSString stringWithFormat:@"%@",[itemc attributeForName:@"StartDate"].stringValue];
                    NSLog(@"%@",yuXml.StartDate);
                
                yuXml.EndDate = [NSString stringWithFormat:@"%@",[itemc attributeForName:@"EndDate"].stringValue];
                    NSLog(@"%@",yuXml.EndDate);
                
                
                
                yuXml.Quantity = [NSString stringWithFormat:@"%@",itemd.stringValue];
                 NSLog(@"%@",yuXml.Quantity);
//                yuXml.RoomNight = [NSString stringWithFormat:@"%@",iteme.stringValue];
              //   NSLog(@"%@",yuXml.RoomNight);
                yuXml.TotalAmount = [NSString stringWithFormat:@"%@",itemf.stringValue];
                 NSLog(@"%@",yuXml.TotalAmount);
                yuXml.PersonName = [NSString stringWithFormat:@"%@",itemg.stringValue];
                 NSLog(@"%@",yuXml.PersonName);
                yuXml.Mobile = [NSString stringWithFormat:@"%@",itemh.stringValue];
                 NSLog(@"%@",yuXml.Mobile);
                
                
                [array addObject:yuXml];
                yuXml = nil;
            }
            
            
        }  
            
            
    }
        
        
        
        
        
        
        
        
        
        
        
        
    }
    
    
    

    
    
    
    
    
    
    
    
    
    
    
    return array;
}
@end
