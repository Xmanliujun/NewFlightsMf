//
//  RecomShenPiXml.m
//  TripgCustomer
//
//  Created by XmL on 13-1-16.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "RecomShenPiXml.h"
#import "GDataXMLNode.h"
#import "NewItem.h"
@implementation RecomShenPiXml

+(NSMutableArray *)recomShenPimend:(NSString *)string
{
    NSMutableArray * array = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
    
    GDataXMLDocument * doc = [[[GDataXMLDocument alloc] initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        
        NSArray * item = [doc nodesForXPath:@"//INFO/Approver/Travel_info" error:nil];
        
        NSArray * item1 = [doc nodesForXPath:@"//Travel_info/Travel_id" error:nil];
        NSArray * item2 = [doc nodesForXPath:@"//Travel_info/Dept_name" error:nil];
        NSArray * item3 = [doc nodesForXPath:@"//Travel_info/Complete_status" error:nil];
        NSArray * item4 = [doc nodesForXPath:@"//Travel_info/Cost_id" error:nil];
        NSArray * item5 = [doc nodesForXPath:@"//Travel_info/Travel_username" error:nil];
        NSArray * item6 = [doc nodesForXPath:@"//Travel_info/Travel_realname" error:nil];
        NSArray * item7 = [doc nodesForXPath:@"//Travel_info/Start_date" error:nil];
        NSArray * item8 = [doc nodesForXPath:@"//Travel_info/End_date" error:nil];
        NSArray * item9 = [doc nodesForXPath:@"//Travel_info/Sab_leave" error:nil];
        NSArray * item10 = [doc nodesForXPath:@"//Travel_info/Description" error:nil];
        NSArray * item11 = [doc nodesForXPath:@"//Travel_info/Currency" error:nil];
        NSArray * item12 = [doc nodesForXPath:@"//Travel_info/Estimated_amounts" error:nil];
        NSArray * item13 = [doc nodesForXPath:@"//Travel_info/Loan_amounts" error:nil];
        NSArray * item14 = [doc nodesForXPath:@"//Travel_info/Approval_type" error:nil];
        NSArray * item15 = [doc nodesForXPath:@"//Travel_info/Flight_type" error:nil];
        NSArray * item16 = [doc nodesForXPath:@"//Travel_info/Expired" error:nil];
        NSArray * item17 = [doc nodesForXPath:@"//Travel_info/Sort_no" error:nil];
        
        if ([item count] != 0) {
            
       
        
        for (int i = 0 ; i < [item count]; i++) {
            NewItem * trXml = [[[NewItem alloc] init] autorelease];
            
            GDataXMLElement * nTraID = [item1 objectAtIndex:i];
            trXml.nTravel = [NSString stringWithFormat:@"%@",nTraID.stringValue];
            
            GDataXMLElement * nDept = [item2 objectAtIndex:i];
            trXml.nDept_name = [NSString stringWithFormat:@"%@",nDept.stringValue];
            
            GDataXMLElement * nComp = [item3 objectAtIndex:i];
            trXml.nComplete_status = [NSString stringWithFormat:@"%@",nComp.stringValue];
            
            GDataXMLElement * nCost = [item4 objectAtIndex:i];
            trXml.nCost_id = [NSString stringWithFormat:@"%@",nCost.stringValue];
            
            GDataXMLElement * nTraUser =[item5 objectAtIndex:i];;
            trXml.nTravel_username = [NSString stringWithFormat:@"%@",nTraUser.stringValue];
            
            GDataXMLElement * nTraReal = [item6 objectAtIndex:i];
            trXml.nTravel_realname = [NSString stringWithFormat:@"%@",nTraReal.stringValue];
            
            GDataXMLElement * nStDate = [item7 objectAtIndex:i];
            trXml.nStart_date = [NSString stringWithFormat:@"%@",nStDate.stringValue];
            
            GDataXMLElement * nEnDate = [item8 objectAtIndex:i];
            trXml.nEnd_date = [NSString stringWithFormat:@"%@",nEnDate.stringValue];
            
            GDataXMLElement * nSab = [item9 objectAtIndex:i];
            trXml.nSab_leave = [NSString stringWithFormat:@"%@",nSab.stringValue];
            
            GDataXMLElement * nDes = [item10 objectAtIndex:i];
            trXml.nDescription = [NSString stringWithFormat:@"%@",nDes.stringValue];
            
            GDataXMLElement * nCur = [item11 objectAtIndex:i];
            trXml.nCurrency = [NSString stringWithFormat:@"%@",nCur.stringValue];
            
            GDataXMLElement * nEst = [item12 objectAtIndex:i];
            trXml.nEstimated_amounts = [NSString stringWithFormat:@"%@",nEst.stringValue];
            
            GDataXMLElement * nLoa = [item13 objectAtIndex:i];
            trXml.nLoan_amounts = [NSString stringWithFormat:@"%@",nLoa.stringValue];
            
            GDataXMLElement * nApp = [item14 objectAtIndex:i];
            trXml.nApproval_type = [NSString stringWithFormat:@"%@",nApp.stringValue];
            
            GDataXMLElement * nFil = [item15 objectAtIndex:i];
            trXml.nFlight_type = [NSString stringWithFormat:@"%@",nFil.stringValue];
            
            GDataXMLElement * nExp = [item16 objectAtIndex:i];
            trXml.nExpired = [NSString stringWithFormat:@"%@",nExp.stringValue];
            
            GDataXMLElement * nSor = [item17 objectAtIndex:i];
            trXml.nSort_no = [NSString stringWithFormat:@"%@",nSor.stringValue];
            
            
            [array addObject:trXml];
            trXml = nil;
        }
        
        } 
    }
    
    
    
    

    return array;
}
@end
