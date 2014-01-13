//
//  DengLuXML.m
//  Flights
//
//  Created by mac on 12-12-13.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "DengLuXML.h"

@interface DengLuXML ()

@end

@implementation DengLuXML

@synthesize RESULT,Name,Gender,Cardtype,Total_reward,pay_reward;
@synthesize dUser_ID,dCompany,dDept_ID,dRole_ID,dPassport,dEmail,Passport_no;

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
    
    [RESULT release];
    [Name release];
    [Gender release];
    [Cardtype release];
    [Total_reward release];
    [pay_reward release];
    [Passport_no release];

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
