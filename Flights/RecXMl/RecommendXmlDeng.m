//
//  RecommendXmlDeng.m
//  TripgCustomer
//
//  Created by XmL on 13-1-15.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecommendXmlDeng.h"
#import "GDataXMLNode.h"
#import "DeXMlModel.h"

@implementation RecommendXmlDeng

+(NSMutableArray *)recommendedParser:(NSString *)string
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
        NSArray * item6 = [doc nodesForXPath:@"//INFO/CNphoalphabet" error:nil];
        NSArray * item7 = [doc nodesForXPath:@"//INFO/Company_id" error:nil];
        NSArray * item8 = [doc nodesForXPath:@"//INFO/Dept_id" error:nil];
        NSArray * item9 = [doc nodesForXPath:@"//INFO/Role_id" error:nil];
        NSArray * item10 = [doc nodesForXPath:@"//INFO/Passport_no" error:nil];
        NSArray * item11 = [doc nodesForXPath:@"//INFO/Birthday" error:nil];
        NSArray * item12 = [doc nodesForXPath:@"//INFO/Approved_status" error:nil];
        NSArray * item13 = [doc nodesForXPath:@"//INFO/User_id" error:nil];
        
        
        DeXMlModel * dXml = [[[DeXMlModel alloc] init] autorelease];
        
        GDataXMLElement * mRes = [item objectAtIndex:0];
        dXml.mResult = [NSString stringWithFormat:@"%@",mRes.stringValue];
        if ([item1 count] != 0) {
            GDataXMLElement * mNa = [item1 objectAtIndex:0];
            dXml.mName = [NSString stringWithFormat:@"%@",mNa.stringValue];
            
        }if ([item2 count] != 0) {
            GDataXMLElement * mGen = [item2 objectAtIndex:0];
            dXml.mGender = [NSString stringWithFormat:@"%@",mGen.stringValue];
            
        }if ([item3 count] != 0) {
            GDataXMLElement * mCar = [item3 objectAtIndex:0];
            dXml.mCardtype = [NSString stringWithFormat:@"%@",mCar.stringValue];
            
        }if ([item4 count] != 0) {
            GDataXMLElement * mTot = [item4 objectAtIndex:0];
            dXml.mTotal_raward = [NSString stringWithFormat:@"%@",mTot.stringValue];
            
        }if ([item5 count] != 0) {
            GDataXMLElement * mPay = [item5 objectAtIndex:0];
            dXml.mPay_raward = [NSString stringWithFormat:@"%@",mPay.stringValue];
            
        }if ([item6 count] != 0) {
            GDataXMLElement * mCNp = [item6 objectAtIndex:0];
            dXml.mCnphoal = [NSString stringWithFormat:@"%@",mCNp.stringValue];
        }if ([item7 count] != 0) {
            GDataXMLElement * mCom = [item7 objectAtIndex:0];
            dXml.mCompany = [NSString stringWithFormat:@"%@",mCom.stringValue];
            
        }if ([item8 count] != 0) {
            GDataXMLElement * mDep = [item8 objectAtIndex:0];
            dXml.mDept_id = [NSString stringWithFormat:@"%@",mDep.stringValue];
            
        }if ([item9 count] != 0) {
            GDataXMLElement * mRol = [item9 objectAtIndex:0];
            dXml.mRole_id = [NSString stringWithFormat:@"%@",mRol.stringValue];
            
        }if ([item10 count] != 0) {
            GDataXMLElement * mPass = [item10 objectAtIndex:0];
            dXml.mPassport_no = [NSString stringWithFormat:@"%@",mPass.stringValue];
        }if ([item11 count] != 0) {
            GDataXMLElement * mBir = [item11 objectAtIndex:0];
            dXml.mBirthday = [NSString stringWithFormat:@"%@",mBir.stringValue];
            
        }if ([item12 count] != 0) {
            GDataXMLElement * mAp = [item12 objectAtIndex:0];
            dXml.mApproved = [NSString stringWithFormat:@"%@",mAp.stringValue];
            
        }if ([item13 count] != 0) {
            GDataXMLElement * mUser = [item13 objectAtIndex:0];
            dXml.mUserID = [NSString stringWithFormat:@"%@",mUser.stringValue];
        }
        
        [array addObject:dXml];
        dXml = nil;
        NSLog(@"预定数组长度 %d",[array count]);
        
        
        
        
    }
    
    
    
    
    
    
    
    

    return array;
}


@end
