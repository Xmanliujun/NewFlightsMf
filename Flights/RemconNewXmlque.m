//
//  RemconNewXmlque.m
//  Flights
//
//  Created by mac on 13-3-23.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "RemconNewXmlque.h"
#import "GDataXMLNode.h"
#import "MyNewXmlMolde.h"


@implementation RemconNewXmlque
+(NSMutableArray*)recommendNewXmlque:(NSString*)string;
{
    NSLog(@"要解析的xml文件 %@",string);
    
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    NSMutableArray * twoArray = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    
    if (doc) {
        NSArray * item0 = [doc nodesForXPath:@"//AvJson/Carrier" error:nil];
        NSArray * item01 = [doc nodesForXPath:@"//AvJson/CarrierFullName" error:nil];
        NSArray * item02 = [doc nodesForXPath:@"//AvJson/FlightNo" error:nil];
        NSArray * item03 = [doc nodesForXPath:@"//AvJson/IsShare" error:nil];
        NSArray * item04 = [doc nodesForXPath:@"//AvJson/ShareCarrier" error:nil];
        NSArray * item05 = [doc nodesForXPath:@"//AvJson/ShareFlightNo" error:nil];
        NSArray * item06 = [doc nodesForXPath:@"//AvJson/DepCity" error:nil];
        NSArray * item07 = [doc nodesForXPath:@"//AvJson/DepCityFullName" error:nil];
        NSArray * item08 = [doc nodesForXPath:@"//AvJson/ArrCity" error:nil];
        NSArray * item09 = [doc nodesForXPath:@"//AvJson/ArrCityFullName" error:nil];
        NSArray * item010 = [doc nodesForXPath:@"//AvJson/DepTime" error:nil];
        NSArray * item011 = [doc nodesForXPath:@"//AvJson/ArrTime" error:nil];
        NSArray * item012 = [doc nodesForXPath:@"//AvJson/Aircraft" error:nil];
        NSArray * item013 = [doc nodesForXPath:@"//AvJson/Stop" error:nil];
        NSArray * item014 = [doc nodesForXPath:@"//AvJson/Meal" error:nil];
        NSArray * item015 = [doc nodesForXPath:@"//AvJson/ETicket" error:nil];
        NSArray * item016 = [doc nodesForXPath:@"//AvJson/DepTower" error:nil];
        NSArray * item017 = [doc nodesForXPath:@"//AvJson/ArrTower" error:nil];
        NSArray * item018 = [doc nodesForXPath:@"//AvJson/FlightDate" error:nil];
        
        
        
        NSArray * item2 = [doc nodesForXPath:@"//Flights/AvJson/Cabins" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//Cabin/Name" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//Cabin/TicketStatus" error:nil];
        NSArray * item5 = [doc nodesForXPath:@"//Cabin/SinglePrice" error:nil];
        NSArray * item6 = [doc nodesForXPath:@"//Cabin/Fuel" error:nil];
        NSArray * item7 = [doc nodesForXPath:@"//Cabin/Tax" error:nil];
        NSArray * item8 = [doc nodesForXPath:@"//Cabin/Ei" error:nil];
        NSArray * item9 = [doc nodesForXPath:@"//Cabin/Discount" error:nil];
        
        int k = 0;
        if ([item2 count] != 0 ) {
            NSLog(@"item2 is  %d",[item2 count]);
            for (int i = 0 ; i < [item2 count]; i++) {
                
                GDataXMLNode * node = [item2 objectAtIndex:i];
                
                NSLog(@"******************************************************  item is %d",1+i);
                
                for (int j = 0 ; j < node.childCount; j++) {
                    
                    MyNewXmlMolde * myXmlMolde = [[[MyNewXmlMolde alloc] init] autorelease];
                    
                    NSLog(@"j 是  %d",j);
                    
                    if ([item0 count] != 0 && [item0 count] > i){
                        GDataXMLElement * Carrier = [item0 objectAtIndex:i];
                        myXmlMolde.xCarrier = [NSString stringWithFormat:@"%@",Carrier.stringValue];
                        NSLog(@"item0 %@",myXmlMolde.xCarrier);
                    }
                    if ([item01 count] != 0 && [item01 count] > i){
                        GDataXMLElement * CarrierFullName = [item01 objectAtIndex:i];
                        myXmlMolde.xCarrierFullName = [NSString stringWithFormat:@"%@",CarrierFullName.stringValue];
                        
                        
                        NSLog(@"item01 %@",myXmlMolde.xCarrierFullName);
                    }
                    if ([item02 count] != 0 && [item02 count] > i){
                        GDataXMLElement * FlightNo = [item02 objectAtIndex:i];
                        myXmlMolde.xFlightNo = [NSString stringWithFormat:@"%@",FlightNo.stringValue];
                        NSLog(@"item02 %@",myXmlMolde.xFlightNo);
                    }
                    if ([item03 count] != 0 && [item03 count] > i){
                        GDataXMLElement * IsShare = [item03 objectAtIndex:i];
                        myXmlMolde.xIsShare = [NSString stringWithFormat:@"%@",IsShare.stringValue];
                        NSLog(@"item03 %@",myXmlMolde.xIsShare);
                    }
                    if ([item04 count] != 0 && [item04 count] > i){
                        GDataXMLElement * ShareCarrier = [item04 objectAtIndex:i];
                        myXmlMolde.xShareCarrier = [NSString stringWithFormat:@"%@",ShareCarrier.stringValue];
                        NSLog(@"item04 %@",myXmlMolde.xShareCarrier);
                        
                    }
                    if ([item05 count] != 0 && [item05 count] > i){
                        GDataXMLElement * ShareFlightNo = [item05 objectAtIndex:i];
                        myXmlMolde.xShareFlightNo = [NSString stringWithFormat:@"%@",ShareFlightNo.stringValue];
                        NSLog(@"item05 %@",myXmlMolde.xShareFlightNo);
                    }
                    
                    if ([item06 count] != 0 && [item06 count] > i){
                        GDataXMLElement * DepCity = [item06 objectAtIndex:i];
                        myXmlMolde.xDepCity = [NSString stringWithFormat:@"%@",DepCity.stringValue];
                        NSLog(@"item06 %@",myXmlMolde.xDepCity);
                    }
                    if ([item07 count] != 0 && [item07 count] > i){
                        GDataXMLElement * DepCityFullName = [item07 objectAtIndex:i];
                        myXmlMolde.xDepCityFullName = [NSString stringWithFormat:@"%@",DepCityFullName.stringValue];
                        NSLog(@"item07 %@",myXmlMolde.xDepCityFullName);
                    }
                    
                    if ([item08 count] != 0 && [item08 count] > i){
                        GDataXMLElement * ArrCity = [item08 objectAtIndex:i];
                        myXmlMolde.xArrCity = [NSString stringWithFormat:@"%@",ArrCity.stringValue];
                        NSLog(@"item08 %@",myXmlMolde.xArrCity);
                    }
                    
                    if ([item09 count] != 0 && [item09 count] > i){
                        GDataXMLElement * ArrCityFullName = [item09 objectAtIndex:i];
                        myXmlMolde.xArrCityFullName = [NSString stringWithFormat:@"%@",ArrCityFullName.stringValue];
                        NSLog(@"item09 %@",myXmlMolde.xArrCityFullName);
                    }
                    if ([item010 count] != 0 && [item010 count] > i){
                        GDataXMLElement * DepTime = [item010 objectAtIndex:i];
                        myXmlMolde.xDepTime = [NSString stringWithFormat:@"%@",DepTime.stringValue];
                        NSLog(@"item010 %@",myXmlMolde.xDepTime);
                    }
                    
                    if ([item011 count] != 0 && [item011 count] > i){
                        GDataXMLElement * ArrTime = [item011 objectAtIndex:i];
                        myXmlMolde.xArrTime = [NSString stringWithFormat:@"%@",ArrTime.stringValue];
                        NSLog(@"item011 %@",myXmlMolde.xArrTime);
                    }
                    
                    if ([item012 count] != 0 && [item012 count] > i){
                        GDataXMLElement * Aircraft = [item012 objectAtIndex:i];
                        myXmlMolde.xAircraft = [NSString stringWithFormat:@"%@",Aircraft.stringValue];
                        
                        NSLog(@"item012 %@",myXmlMolde.xAircraft);
                    }
                    
                    if ([item013 count] != 0 && [item013 count] > i){
                        GDataXMLElement * Stop = [item013 objectAtIndex:i];
                        myXmlMolde.xStop = [NSString stringWithFormat:@"%@",Stop.stringValue];
                        NSLog(@"item013 %@",myXmlMolde.xStop);
                    }
                    if ([item014 count] != 0 && [item014 count] > i){
                        GDataXMLElement * Meal = [item014 objectAtIndex:i];
                        myXmlMolde.xMeal = [NSString stringWithFormat:@"%@",Meal.stringValue];
                        NSLog(@"item014 %@",myXmlMolde.xMeal);
                    }
                    
                    if ([item015 count] != 0 && [item015 count] > i){
                        GDataXMLElement * ETicket = [item015 objectAtIndex:i];
                        myXmlMolde.xETicket = [NSString stringWithFormat:@"%@",ETicket.stringValue];
                        NSLog(@"item015 %@",myXmlMolde.xETicket);
                    }
                    
                    if ([item016 count] != 0 && [item016 count] > i){
                        GDataXMLElement * DepTower = [item016 objectAtIndex:i];
                        myXmlMolde.xDepTower = [NSString stringWithFormat:@"%@",DepTower.stringValue];
                        
                        NSLog(@"item016 %@",myXmlMolde.xDepTower);
                    }
                    
                    if ([item017 count] != 0 && [item017 count] > i){
                        GDataXMLElement * ArrTower = [item017 objectAtIndex:i];
                        myXmlMolde.xArrTower = [NSString stringWithFormat:@"%@",ArrTower.stringValue];
                        
                        NSLog(@"item017 %@",myXmlMolde.xArrTower);
                    }
                    
                    if ([item018 count] != 0 && [item018 count] > i){
                        GDataXMLElement * FlightDate = [item018 objectAtIndex:i];
                        myXmlMolde.xFlightDate = [NSString stringWithFormat:@"%@",FlightDate.stringValue];
                        
                        NSLog(@"item018 %@",myXmlMolde.xFlightDate);
                    }
                    
                    
                    
                    
                    //子节点内容
                    if ([item3 count] != 0){
                        GDataXMLElement * Name = [item3 objectAtIndex:k];
                        myXmlMolde.ccName = [NSString stringWithFormat:@"%@",Name.stringValue];
                        
                        NSLog(@"#item3#%@",myXmlMolde.ccName);
                    }
                    if ([item4 count] != 0){
                        GDataXMLElement * TicketStatus = [item4 objectAtIndex:k];
                        myXmlMolde.ccTicketStatus = [NSString stringWithFormat:@"%@",TicketStatus.stringValue];
                        
                        NSLog(@"#item4#%@",myXmlMolde.ccTicketStatus);
                        
                    }
                    if ([item5 count] != 0){
                        GDataXMLElement * SinglePrice = [item5 objectAtIndex:k];
                        myXmlMolde.ccSinglePrice = [NSString stringWithFormat:@"%@",SinglePrice.stringValue];
                        NSLog(@"#item5#%@",myXmlMolde.ccSinglePrice);
                        
                    }
                    if ([item6 count] != 0){
                        GDataXMLElement * Fuel = [item6 objectAtIndex:k];
                        myXmlMolde.ccFuel = [NSString stringWithFormat:@"%@",Fuel.stringValue];
                        
                        NSLog(@"#item6#%@",myXmlMolde.ccFuel);
                        
                    }
                    if ([item7 count] != 0){
                        GDataXMLElement * Tax = [item7 objectAtIndex:k];
                        myXmlMolde.ccTax = [NSString stringWithFormat:@"%@",Tax.stringValue];
                        NSLog(@"#item7#%@",myXmlMolde.ccTax);
                        
                    }
                    if ([item8 count] != 0){
                        GDataXMLElement * Ei = [item8 objectAtIndex:k];
                        myXmlMolde.ccEi = [NSString stringWithFormat:@"%@",Ei.stringValue];
                        NSLog(@"#item8#%@", myXmlMolde.ccEi);
                        
                    }
                    
                    if ([item9 count] != 0) {
                        NSLog(@"item99999999999999  %d",[item9 count]);
                        GDataXMLElement * Discount = [item9 objectAtIndex:k];
                        myXmlMolde.ccDiscount = [NSString stringWithFormat:@"%@",Discount.stringValue];
                        NSLog(@"#item9#%@",myXmlMolde.ccDiscount);
                        
                    }
                    
                    
                    [twoArray addObject:myXmlMolde];
                    //twoArray = [NSMutableArray arrayWithObjects:myXmlMolde, nil];
                    // twoArray = [NSMutableArray arrayWithObject:myXmlMolde];
                    
                    NSLog(@"内部循环数组长度 %d",[twoArray count]);
                    myXmlMolde = nil;
                    k++;
                }
                
                // [array addObject:twoArray];
                array = [NSMutableArray arrayWithObjects:twoArray, nil];
                // array = [NSMutableArray arrayWithObject:twoArray];
                //array = [NSMutableArray arrayWithArray:twoArray];
                // [array addObjectsFromArray:twoArray];
                
                NSLog(@"外部数组长度 %d",[array count]);
                [twoArray removeAllObjects];
                
                
                
               
                
                
            }
            
            
            for (int t = 0 ; t < [array count]; t++) {
                NSLog(@"解析循环数组  %d",[array count]);
                
                NSMutableArray * a = [array objectAtIndex:t];
                NSLog(@"解析数组a %d",[a count]);
                
                MyNewXmlMolde * ta = [[[MyNewXmlMolde alloc] init] autorelease];
                ta = [a objectAtIndex:t];
                NSLog(@"########^^^^^^^^^&&&&&&&&&&&&&&&  %@",ta.xFlightDate);
                 
            }
            
            
            
        }
        
        
    }
    
    
    
    return  array;
}

@end
