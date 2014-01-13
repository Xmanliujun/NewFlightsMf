//
//  DongTai.h
//  Flights
//
//  Created by mac on 13-2-20.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DongTai : UIViewController
{
    NSString * FlightDate;          // 时间
    NSString * FlightNote;          //成功
    NSString * FlightNullCode;      //0
    NSString * FlightCompany;       //航空公司
    NSString * FlightNo;            //航班号
    NSString * FlightDepcode;       //出发城市三字码
    NSString * FlightArrcode;       //抵达城市三字码
    NSString * FlightDep;           //出发城市名
    NSString * FlightArr;           //抵达城市名
    NSString * FlightDeptimePlan;   //出发时间
    NSString * FlightArrtimePlan;   //抵达时间
    NSString * FlightDeptime;       //false
    NSString * FlightArrtime;       //false
    NSString * FlightState;         //计划
    NSString * FlightTerminal;      //T3
    NSString * FlightHTerminal;     //false
}
@property (nonatomic,retain)NSString * FlightDate;
@property (nonatomic,retain)NSString * FlightNote;
@property (nonatomic,retain)NSString * FlightNullCode;
@property (nonatomic,retain)NSString * FlightCompany;
@property (nonatomic,retain)NSString * FlightNo;
@property (nonatomic,retain)NSString * FlightDepcode;
@property (nonatomic,retain)NSString * FlightArrcode;
@property (nonatomic,retain)NSString * FlightDep;
@property (nonatomic,retain)NSString * FlightArr;
@property (nonatomic,retain)NSString * FlightDeptimePlan;
@property (nonatomic,retain)NSString * FlightArrtimePlan;
@property (nonatomic,retain)NSString * FlightDeptime;
@property (nonatomic,retain)NSString * FlightArrtime;
@property (nonatomic,retain)NSString * FlightState;
@property (nonatomic,retain)NSString * FlightTerminal;
@property (nonatomic,retain)NSString * FlightHTerminal;

@end
