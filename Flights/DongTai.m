//
//  DongTai.m
//  Flights
//
//  Created by mac on 13-2-20.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "DongTai.h"

@interface DongTai ()

@end

@implementation DongTai

@synthesize FlightDate,FlightNote,FlightNullCode,FlightCompany,FlightNo,FlightDepcode,FlightArrcode,FlightDep,FlightArr,FlightDeptimePlan,FlightArrtimePlan,FlightDeptime,FlightArrtime,FlightState,FlightTerminal,FlightHTerminal;


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
    [FlightDate release];
    [FlightNote release];
    [FlightNullCode release];
    [FlightCompany release];
    [FlightNo release];
    [FlightDepcode release];
    [FlightArrcode release];
    [FlightDep release];
    [FlightArr release];
    [FlightDeptimePlan release];
    [FlightArrtimePlan release];
    [FlightDeptime release];
    [FlightArrtime release];
    [FlightState release];
    [FlightTerminal release];
    [FlightHTerminal release];
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
