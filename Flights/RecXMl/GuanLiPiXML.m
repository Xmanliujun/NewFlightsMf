//
//  GuanLiPiXML.m
//  Flights
//
//  Created by mac on 13-4-19.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "GuanLiPiXML.h"
#import "GDataXMLNode.h"
#import "GuanLiPi.h"

@implementation GuanLiPiXML
+(NSMutableArray *)recommendedParser:(NSString *)string
{
    NSLog(@"要解析的xml文件%@",string);
    
    
    
    

    NSMutableArray *twoAry = [[[NSMutableArray alloc]initWithCapacity:0] autorelease];
    NSLog(@"解析被调用");
    GDataXMLDocument *doc = [[[GDataXMLDocument alloc]initWithXMLString:string options:0 error:nil] autorelease];
    
    if (doc) {
        NSArray * item0 = [doc nodesForXPath:@"//INFO" error:nil];
        NSLog(@"item0数组长度 %d",[item0 count]);
        NSArray * item01 = [doc nodesForXPath:@"//INFO/RESULT" error:nil];
        
        
        NSArray * item2 = [doc nodesForXPath:@"//INFO/APPROVALS" error:nil];
        NSLog(@"item2数组长度 %d",[item2 count]);
        NSArray * item1 = [doc nodesForXPath:@"//APPROVALS/APPROVAL/APPROVAL_ID" error:nil];
        NSLog(@"item1数组长度 %d",[item1 count]);
        NSArray * item3 = [doc nodesForXPath:@"//APPROVALS/APPROVAL/APPROVAL_DEPT" error:nil];
        NSLog(@"item3数组长度%d",[item3 count]);
        NSArray * item4 = [doc nodesForXPath:@"//APPROVALS/APPROVAL/APPROVAL_ROLE" error:nil];
        NSLog(@"item4数组长度%d",[item4 count]);
        NSArray * item5 = [doc nodesForXPath:@"//APPROVALS/APPROVAL/APPROVAL_NAME" error:nil];
        NSLog(@"item5数组长度%d",[item5 count]);


        
        
        if ([item2 count] != 0) {
            
            
            
            for (int i = 0 ; i < [item2 count]; i++) {
                GDataXMLNode * node = [item2 objectAtIndex:i];
                
                NSLog(@"item%d",1+i);
                
                
    
         
                    
                    for (int j  = 0; j < node.childCount; j++) {
                        NSLog(@"j is %d",j +1);
                        GuanLiPi * mewWork =[[[GuanLiPi alloc] init] autorelease];
                        
                            
                        
                        GDataXMLElement * aPPROVAL_ID = [item1 objectAtIndex:j];
                        GDataXMLElement * aPPROVAL_DEPT = [item3 objectAtIndex:j];
                        GDataXMLElement * aPPROVAL_ROLE = [item4 objectAtIndex:j];
                        GDataXMLElement * aPPROVAL_NAME = [item5 objectAtIndex:j];
                                                
                        NSLog(@"%d",1+j );
                        
                        GDataXMLElement * aRESULT = [item01 objectAtIndex:0];
                        
                        mewWork.yy_RESULT = [NSString stringWithFormat:@"%@",aRESULT.stringValue];
                        
                        mewWork.yy_APPROVAL_ID = [NSString stringWithFormat:@"%@",aPPROVAL_ID.stringValue];
                        
                        mewWork.yy_APPROVAL_DEPT = [NSString stringWithFormat:@"%@",aPPROVAL_DEPT.stringValue];
                        
                        mewWork.yy_APPROVAL_ROLE = [NSString stringWithFormat:@"%@",aPPROVAL_ROLE.stringValue];
                        
                        mewWork.yy_APPROVAL_NAME =[NSString stringWithFormat:@"%@",aPPROVAL_NAME.stringValue];
                        
     
                        
                        
                        [twoAry addObject:mewWork];
                        NSLog(@" twoAry %d",[twoAry count]);
                        mewWork = nil;
                       
                        
                        
                    }
                    NSLog(@"***************************************************");

                
                    NSLog(@"内部数组长度 %d",[twoAry count]);
                    
                    GuanLiPi * twoe = [twoAry objectAtIndex:0];
                    NSLog(@"2121数组内容%@",twoe.yy_APPROVAL_ID);
                    
                                       
                   
                  
                                       
                
            
            }
        }
    }
    
    
    return twoAry;
}

@end
