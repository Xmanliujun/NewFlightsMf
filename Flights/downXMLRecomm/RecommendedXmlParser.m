//
//  RecommendedXmlParser.m
//  jiudian
//
//  Created by XmL on 12-10-27.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "RecommendedXmlParser.h"
#import "GDataXMLNode.h"
#import "ContactModel.h"

@implementation RecommendedXmlParser

+(NSMutableArray *)recommendedParser:(NSString *)string
{
    NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    
    
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc]initWithXMLString:string options:0 error:nil] autorelease];
    //获取根节点
    if (doc) {
        NSArray * items = [doc nodesForXPath:@"//RoomRates/RoomRate" error:nil];
        NSArray * itemn = [doc nodesForXPath:@"//Rates/Rate" error:nil];
        NSArray * itenimg = [doc nodesForXPath:@"//Image/URL" error:nil];
        NSArray * itemBas = [doc nodesForXPath:@"//RoomStay/BasicProperty" error:nil];
        NSArray * itemTol = [doc nodesForXPath:@"//RoomRate/Total" error:nil];
        NSLog(@"itenimg %d",[itenimg count]);
        NSLog(@"items %d",[items count]);

        if ([items count] > 0) {
            
       
        
        for (int i = 0; i < [items count]; i++) {
            ContactModel * con  = [[[ContactModel alloc] init] autorelease];
            
            GDataXMLElement * itemImg= [[[GDataXMLElement alloc] init] autorelease];
            GDataXMLElement * item = [items objectAtIndex:i];
            GDataXMLElement * item1 = [itemn objectAtIndex:i];
            if ([itenimg count] > 0) {
                 
                NSLog(@"image %d",[itenimg count]);
                NSLog(@"duo - 1 image %d",[itenimg count] -1);
                itemImg = [itenimg objectAtIndex:[itenimg count] -1];
            }
           
            GDataXMLElement * itemRBa = [itemBas objectAtIndex:0];
            GDataXMLElement * itemTool = [itemTol objectAtIndex:i];

            
           // if (i) {
                
                //获取RoomType 的属性
                NSLog(@"RoomType 0000000000000 = %@",[item attributeForName:@"RoomTypeName"].stringValue);
                
                con.RoomTypeName = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeName"].stringValue];
                con.RoomTypeDesc = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeDesc"].stringValue];
                con.RoomStay = [NSString stringWithFormat:@"%@",[item attributeForName:@"StartDate"].stringValue];
                con.RoomEndDate = [NSString stringWithFormat:@"%@",[item attributeForName:@"EndDate"].stringValue];
                con.RateAmountPrice = [NSString stringWithFormat:@"%@",[item1 attributeForName:@"AmountPrice"].stringValue];
                con.RoomTypeCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"RoomTypeCode"].stringValue];
                con.RoomBedType = [NSString stringWithFormat:@"%@",[item attributeForName:@"BedType"].stringValue];
                con.HotelName = [NSString stringWithFormat:@"%@",[item attributeForName:@"HotelCode"].stringValue];
                con.RoomRatePlanCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"RatePlanCode"].stringValue];
                con.VendorCode = [NSString stringWithFormat:@"%@",[item attributeForName:@"VendorCode"].stringValue];
                con.VendorName = [NSString stringWithFormat:@"%@",[item attributeForName:@"VendorName"].stringValue];
            
                con.Payment = [NSString stringWithFormat:@"%@",[item attributeForName:@"Payment"].stringValue];
            NSLog(@"Payment22222221111  %@",con.Payment);
                con.URL = [NSString stringWithFormat:@"%@",itemImg.stringValue];
                NSLog(@"URL %@",con.URL);
                
                con.BasicProperty = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelCode"].stringValue];
                NSLog(@"Bas7777 %@",con.BasicProperty);
                con.TolAmPic = [NSString stringWithFormat:@"%@",[itemTool attributeForName:@"AmountPrice"].stringValue];
                NSLog(@"Tol AmPic %@",con.TolAmPic);
                con.HotelName = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelName"].stringValue];
                NSLog(@"HotelName 6666%@",con.HotelName);
                con.HotelEnName = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"HotelEnName"].stringValue];
                NSLog(@"EnName %@",con.HotelEnName);
                con.CityCode = [NSString stringWithFormat:@"%@",[itemRBa attributeForName:@"CityCode"].stringValue];
                NSLog(@"城市代码：%@",con.CityCode);
                
                
                [array addObject:con];
                con=nil;
                
          //  }
            

             }

            
            
        }
        
        NSLog( @"***********************");
    }
    
    
    NSLog( @"***********************");
//    ContactModel *coo = [array objectAtIndex:0];
//  
//    
//    NSString * str = [NSString stringWithFormat:@"%@",coo.RoomTypeName];
//    NSLog(@"str0 %@",str);
//    
//    NSString * str5 = [NSString stringWithFormat:@"%@",coo.RoomTypeDesc];
//    NSLog(@"str5 %@",str5);
    
        
    return array;
    
    
}
@end
