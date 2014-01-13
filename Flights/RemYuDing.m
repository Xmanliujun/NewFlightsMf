//
//  RemYuDing.m
//  Flights
//
//  Created by XmL on 12-11-14.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "RemYuDing.h"
#import "GDataXMLNode.h"
#import "YuDingXMLaa.h"

@implementation RemYuDing

+(NSMutableArray*)recommendedParser:(NSString*)string
{
    NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    NSLog(@"解析字符串 %@",string);
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    if (doc) {
        NSArray * item = [doc nodesForXPath:@"//INFO/pnr" error:nil];
        NSArray * item1 = [doc nodesForXPath:@"//INFO/resid" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/tkt_price" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//INFO/tax_fee" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//INFO/yq" error:nil];
        NSArray * item5 = [doc nodesForXPath:@"//INFO/ins_price" error:nil];
        NSArray * item6 = [doc nodesForXPath:@"//INFO/price" error:nil];
        NSArray * itemm = [doc nodesForXPath:@"//INFO/memberid" error:nil];
        
        NSArray * itemW = [doc nodesForXPath:@"//Res_details/Res_detail" error:nil];
        NSArray * itema = [doc nodesForXPath:@"//Res_detail/Card_ID" error:nil];
        NSArray * itemb = [doc nodesForXPath:@"//Res_detail/Agt_price" error:nil];
        NSArray * itemc = [doc nodesForXPath:@"//Res_detail/Out_price" error:nil];
        NSArray * itemd = [doc nodesForXPath:@"//Res_detail/d_tax" error:nil];
        NSArray * iteme = [doc nodesForXPath:@"//Res_detail/d_yq" error:nil];
        NSArray * itemf = [doc nodesForXPath:@"//Res_detail/P_name" error:nil];
        
        
        if ([itemW count] !=0) {
            
            
            for (int i = 0; i < [itemW count]; i++) {
                YuDingXMLaa * yuDing = [[[YuDingXMLaa alloc] init] autorelease];
                
                if ([item count] !=0) {
                    GDataXMLElement * mpnr = [item objectAtIndex:0];
                    yuDing.pnr = [NSString stringWithFormat:@"%@",mpnr.stringValue];
                    
                }if ([item1 count]!=0) {
                    GDataXMLElement * mresid = [item1 objectAtIndex:0];
                    yuDing.resid = [NSString stringWithFormat:@"%@",mresid.stringValue];
                    
                }if ([item2 count] !=0) {
                    GDataXMLElement * mtkt = [item2 objectAtIndex:0];
                    yuDing.tkt_price = [NSString stringWithFormat:@"%@",mtkt.stringValue];
                    
                }if ([item3 count] !=0) {
                    GDataXMLElement * mtax = [item3 objectAtIndex:0];
                    yuDing.tax_fee = [NSString stringWithFormat:@"%@",mtax.stringValue];
                    
                }if ([item4 count] !=0) {
                    GDataXMLElement * myq = [item4 objectAtIndex:0];
                    yuDing.yq = [NSString stringWithFormat:@"%@",myq.stringValue];
                    
                }if ([item5 count] !=0) {
                    GDataXMLElement * mins = [item5 objectAtIndex:0];
                    yuDing.ins_price = [NSString stringWithFormat:@"%@",mins.stringValue];
                    
                }if ([item6 count] !=0) {
                    GDataXMLElement * mprice = [item6 objectAtIndex:0];
                    yuDing.price = [NSString stringWithFormat:@"%@",mprice.stringValue];
                    
                }if ([itemm count] !=0) {
                    GDataXMLElement * nmenb = [itemm objectAtIndex:0];
                    yuDing.mmberid = [NSString stringWithFormat:@"%@",nmenb.stringValue];
                    
                }
                
                GDataXMLElement * npname = [itemf objectAtIndex:i];
                GDataXMLElement * ncard = [itema objectAtIndex:i];
                GDataXMLElement * nagt = [itemb objectAtIndex:i];
                GDataXMLElement * nout = [itemc objectAtIndex:i];
                GDataXMLElement * ndtax = [itemd objectAtIndex:i];
                GDataXMLElement * ndyq = [iteme objectAtIndex:i];
                
                
                yuDing.p_name = [NSString stringWithFormat:@"%@",npname.stringValue];
                yuDing.card_ID = [NSString stringWithFormat:@"%@",ncard.stringValue];
                yuDing.agt_price = [NSString stringWithFormat:@"%@",nagt.stringValue];
                yuDing.out_price = [NSString stringWithFormat:@"%@",nout.stringValue];
                yuDing.d_tax = [NSString stringWithFormat:@"%@",ndtax.stringValue];
                yuDing.d_yq = [NSString stringWithFormat:@"%@",ndyq.stringValue];
                
                
                [array addObject:yuDing];
                yuDing = nil;
                
                
            }
            
        }
        
        
    }
    
    
    
   
    
    
    
    return array;
}






@end
