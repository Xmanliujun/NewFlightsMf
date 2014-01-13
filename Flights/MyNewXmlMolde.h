//
//  MyNewXmlMolde.h
//  Flights
//
//  Created by mac on 13-3-23.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyNewXmlMolde : UIViewController
{
    NSString * yCode;
    NSString * yMessage;
    NSString * xCarrier;//航空公司二字码、
    NSString * xCarrierFullName;//航空公司中文名、
    NSString * xCarrierReferred;//航空公司名 如： 国航
    NSString * xFlightNo;//航班号、
    NSString * xIsShare;//是否共享航班
    NSString * xShareCarrier;//共享承运公司
    NSString * xShareFlightNo;//共享航班号
    NSString * xDepCity;//起飞城市三字码、
    NSString * xDepCityFullName;//起飞机场全称
    NSString * xArrCity;//抵达城市三字码、
    NSString * xArrCityFullName;//抵达机场全称
    NSString * xDepCityReferred;//起飞机场名
    NSString * xArrCityReferred;//降落机场名
    
    //NSString * xArrCityCN;
    NSString * xDepTime;//起飞时间、
    NSString * xArrTime;//抵达时间、
    NSString * xAircraft;//机型、
    NSString * xStop;//经停
    NSString * xMeal;//餐食
    NSString * xETicket;//电子客票标识
    NSString * xDepTower;//起飞航站楼
    NSString * xArrTower;//抵达航站楼
    NSString * xFlightDate;//航班日期
    
    
    NSString * ccName;//舱位名称
    NSString * ccTicketStatus;//客票状态
    NSString * ccSinglePrice;//单程价格
    NSString * ccFuel;//燃油附加费
    NSString * ccTax;//机场建设费
    NSString * ccEi;//退改签
    NSString * ccDiscount;//折扣

    
}
@property (nonatomic,retain) NSString * xDepCityReferred;
@property (nonatomic,retain) NSString * xArrCityReferred;
@property (nonatomic,retain) NSString * xCarrierReferred;
@property (nonatomic,retain) NSString * yMessage;
@property (nonatomic,retain) NSString * yCode;
@property (nonatomic,retain) NSString * xCarrier;
@property (nonatomic,retain) NSString * xCarrierFullName;;
@property (nonatomic,retain) NSString * xFlightNo;
@property (nonatomic,retain) NSString * xIsShare;
@property (nonatomic,retain) NSString * xShareCarrier;
@property (nonatomic,retain) NSString * xShareFlightNo;
@property (nonatomic,retain) NSString * xDepCity;
@property (nonatomic,retain) NSString * xDepCityFullName;
@property (nonatomic,retain) NSString * xArrCity;
@property (nonatomic,retain) NSString * xArrCityFullName;
@property (nonatomic,retain) NSString * xDepTime;
@property (nonatomic,retain) NSString * xArrTime;
@property (nonatomic,retain) NSString * xAircraft;
@property (nonatomic,retain) NSString * xStop;
@property (nonatomic,retain) NSString * xMeal;
@property (nonatomic,retain) NSString * xETicket;
@property (nonatomic,retain) NSString * xDepTower;
@property (nonatomic,retain) NSString * xArrTower;
@property (nonatomic,retain) NSString * xFlightDate;
@property (nonatomic,retain) NSString * ccName;
@property (nonatomic,retain) NSString * ccTicketStatus;
@property (nonatomic,retain) NSString * ccSinglePrice;
@property (nonatomic,retain) NSString * ccFuel;
@property (nonatomic,retain) NSString * ccTax;
@property (nonatomic,retain) NSString * ccEi;
@property (nonatomic,retain) NSString * ccDiscount;


@end
