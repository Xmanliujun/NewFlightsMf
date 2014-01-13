//
//  MyNewXmlMolde.m
//  Flights
//
//  Created by mac on 13-3-23.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "MyNewXmlMolde.h"

@interface MyNewXmlMolde ()

@end

@implementation MyNewXmlMolde

@synthesize xCarrier,xCarrierFullName,xFlightNo,xIsShare,xShareCarrier,xShareFlightNo,xDepCity,xDepCityFullName,xArrCity,xArrCityFullName,xDepTime,xArrTime,xAircraft,xStop,xMeal,xETicket,xDepTower,xArrTower,xFlightDate,ccName,ccTicketStatus,ccSinglePrice,ccFuel,ccTax,ccEi,ccDiscount,yCode,yMessage,xCarrierReferred,xArrCityReferred,xDepCityReferred;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)dealloc
{
    
    [super dealloc];
    [xArrCityReferred release];
    [xDepCityReferred release];
    [xCarrierReferred release];
    [yMessage release];
    [yCode release];
    [xCarrier release];
    [xCarrierFullName release];
    [xFlightNo release];
    [xIsShare release];
    [xShareCarrier release];
    [xShareFlightNo release];
    [xDepCity release];
    [xDepCityFullName release];
    [xArrCityFullName release];
    [xDepTime release];
    [xArrTime release];
    [xAircraft release];
    [xStop release];
    [xMeal release];
    [xETicket release];
    [xDepTower release];
    [xArrTower release];
    [xFlightDate release];
    [ccName release];
    [ccTicketStatus release];
    [ccSinglePrice release];
    [ccFuel release];
    [ccTax release];
    [ccEi release];
    [ccDiscount release];

   
    
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
