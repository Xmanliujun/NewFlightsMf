//
//  RecomXMlParser.m
//  jiudian
//
//  Created by XmL on 12-11-5.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "RecomXMlParser.h"
#import "GDataXMLNode.h"
#import "ConXMLzhModel.h"

@implementation RecomXMlParser

+(NSMutableArray*)recommendedParser:(NSString*)string
{
    
    NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    
    
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc]initWithXMLString:string options:0 error:nil] autorelease];
    //获取根节点
    if (doc) {
        NSArray * items = [doc nodesForXPath:@"//RoomRates/RoomRate" error:nil];
        NSArray * itenimg = [doc nodesForXPath:@"//Image/URL" error:nil];
        NSArray * itemBas = [doc nodesForXPath:@"//RoomStay/BasicProperty" error:nil];
         NSArray * itemTol = [doc nodesForXPath:@"//RoomRate/Total" error:nil];
        NSLog(@"itenimg %d",[itenimg count]);
        NSLog(@"items %d",[items count]);

        if ([items count]!= 0) {
            
      
        for (int i = 0; i < [items count]; i++) {
            ConXMLzhModel * con  = [[[ConXMLzhModel alloc] init] autorelease];
            
          

            
            if ([items count] != 0) {
                GDataXMLElement * item = [items objectAtIndex:i];

            
                //获取RoomType 的属性
                NSLog(@"RoomType 0 = %@",[item attributeForName:@"RoomTypeName"].stringValue);
                
                con.RoomTypeName = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeName"].stringValue];
                con.RoomTypeDesc = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeDesc"].stringValue];
                con.RoomStay = [NSString stringWithFormat:@"%@",[item attributeForName:@"StartDate"].stringValue];
                con.RoomEndDate = [NSString stringWithFormat:@"%@",[item attributeForName:@"EndDate"].stringValue];
                con.RateAmountPrice = [NSString stringWithFormat:@"%@",[item attributeForName:@"MemberRate"].stringValue];
                NSLog(@"RateAmountPrice is  %@",con.RateAmountPrice);
                con.RoomTypeCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeCode"].stringValue];
            NSLog(@"RoomTypeCode %@",con.RoomTypeCode);

                con.RoomBedType = [NSString stringWithFormat:@"%@",[item attributeForName:@"BedType"].stringValue];
                //con.HotelName = [NSString stringWithFormat:@"%@",[item attributeForName:@"HotelCode"].stringValue];
            //NSLog(@"HotelName %@",con.HotelName);

                con.RoomRatePlanCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"RatePlanCode"].stringValue];
            NSLog(@"RoomRatePlanCode %@",con.RoomRatePlanCode);

                con.VendorCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"VendorCode"].stringValue];
                con.VendorName = [NSString stringWithFormat:@"%@",[item attributeForName:@"VendorName"].stringValue];
            
                con.Payment = [NSString stringWithFormat:@"%@",[item attributeForName:@"RatePlanName"].stringValue];
                NSLog(@"Payment  %@",con.Payment);
                }
            
            if ([itenimg count] != 0) {
                GDataXMLElement * itemImg  = [itenimg objectAtIndex:i];
                con.URL = [NSString stringWithFormat:@"%@",itemImg.stringValue];
                NSLog(@"URL %@",con.URL);
            }
                
            if ([itemBas count] != 0) {
                GDataXMLElement * itemRBa = [itemBas objectAtIndex:0];

            
                con.BasicProperty = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelCode"].stringValue];
                NSLog(@"Bas7777 %@",con.BasicProperty);
                con.HotelName = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelName"].stringValue];
                NSLog(@"HotelName 6666%@",con.HotelName);
                con.HotelEnName = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelEnName"].stringValue];
                NSLog(@"EnName %@",con.HotelEnName);
                con.CityCode = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"CityCode"].stringValue];
                NSLog(@"城市代码：%@",con.CityCode);
             }
            
            
            if ([itemTol count] != 0) {
                GDataXMLElement * itemTool = [itemTol objectAtIndex:i];
                con.TolAmPic = [NSString stringWithFormat:@"%@",[itemTool attributeForName:@"AmountPrice"].stringValue];
                NSLog(@"Tol AmPic %@",con.TolAmPic);
            }
                
                
                [array addObject:con];
                con=nil;
                
          

           }
            
            
            
            
            
        }
        
        NSLog( @"***********************");
        
    }

    
    NSLog( @"***********************");

    
    
    return array;
    



}



@end
