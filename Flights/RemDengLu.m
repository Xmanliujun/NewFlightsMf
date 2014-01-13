//
//  RemDengLu.m
//  Flights
//
//  Created by mac on 12-12-14.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "RemDengLu.h"
#import "GDataXMLNode.h"
#import "DengLuXML.h"

@implementation RemDengLu

+(NSMutableArray*)recommendedParser:(NSString*)string
{
    
    
    NSMutableArray *array = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    NSLog(@"解析字符串 %@",string);
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    if (doc) {
        NSArray * item = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        NSArray * item1 = [doc nodesForXPath:@"//INFO/Name" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//INFO/Gender" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//INFO/Cardtype" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//INFO/Total_reward" error:nil];
        NSArray * item5 = [doc nodesForXPath:@"//INFO/pay_reward" error:nil];
        
        NSArray * item6 = [doc nodesForXPath:@"//INFO/User_id" error:nil];
        NSArray * item7 = [doc nodesForXPath:@"//INFO/Company_id" error:nil];
        NSArray * item8 = [doc nodesForXPath:@"//INFO/Dept_id" error:nil];
        NSArray * item9 = [doc nodesForXPath:@"//INFO/Role_id" error:nil];
        NSArray * item10 = [doc nodesForXPath:@"//INFO/Passport_type" error:nil];
        NSArray * item11 = [doc nodesForXPath:@"//INFO/Email" error:nil];
        NSArray * item12 = [doc nodesForXPath:@"//INFO/Passport_no" error:nil];
        
        DengLuXML * deng = [[[DengLuXML alloc]init] autorelease];
        
        GDataXMLElement * mRESULT = [item objectAtIndex:0];
        
        deng.RESULT = [NSString stringWithFormat:@"%@",mRESULT.stringValue];
        
        if ([item1 count] != 0) {
            GDataXMLElement * mName = [item1 objectAtIndex:0];
            deng.Name = [NSString stringWithFormat:@"%@",mName.stringValue];
        }
        
        if ([item2 count] != 0) {
            GDataXMLElement * mGender = [item2 objectAtIndex:0];
            deng.Gender = [NSString stringWithFormat:@"%@",mGender.stringValue];
        }
        
        
        if ([item3 count] != 0) {
            GDataXMLElement * mCardtype = [item3 objectAtIndex:0];
            deng.Cardtype = [NSString stringWithFormat:@"%@",mCardtype.stringValue];
            
        }
        if ([item4 count] != 0){
            GDataXMLElement * mTotal_reward = [item4 objectAtIndex:0];
            deng.Total_reward = [NSString stringWithFormat:@"%@",mTotal_reward.stringValue];
            
        }
        if ([item5 count] != 0){
            GDataXMLElement * mpay_reward = [item5 objectAtIndex:0];
            deng.pay_reward = [NSString stringWithFormat:@"%@",mpay_reward.stringValue];
            
        }if ([item6 count] != 0) {
            GDataXMLElement * mUser = [item6 objectAtIndex:0];
            deng.dUser_ID = [NSString stringWithFormat: @"%@",mUser.stringValue];
            
        }if ([item7 count] != 0) {
            GDataXMLElement * mCompany = [item7 objectAtIndex:0];
            deng.dCompany = [NSString stringWithFormat:@"%@",mCompany.stringValue];
            
        }if ([item8 count] != 0) {
            GDataXMLElement * mDept = [item8 objectAtIndex:0];
            deng.dDept_ID = [NSString stringWithFormat:@"%@",mDept.stringValue];
            
        }if ([item9 count] != 0) {
            GDataXMLElement * mRole = [item9 objectAtIndex:0];
            deng.dRole_ID = [NSString stringWithFormat:@"%@",mRole.stringValue];
            
        }if ([item10 count] != 0) {
            GDataXMLElement * mPassport = [item10 objectAtIndex:0];
            deng.dPassport = [NSString stringWithFormat:@"%@",mPassport.stringValue];
            
        }if ([item11 count] != 0) {
            GDataXMLElement * mEmail = [item11 objectAtIndex:0];
            deng.dEmail = [NSString stringWithFormat:@"%@",mEmail.stringValue];
        }if ([item12 count] != 0) {
            GDataXMLElement * mPassport_no = [item12 objectAtIndex:0];
            deng.Passport_no =[NSString stringWithFormat:@"%@",mPassport_no.stringValue];
        }
        
        
        
        
        
        [array addObject:deng];
        deng = nil;
        NSLog(@"预定数组长度 %d",[array count]);
        
        
        
    }
    
    return  array;
}


@end
