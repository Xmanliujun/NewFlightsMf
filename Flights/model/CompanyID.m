//
//  CompanyID.m
//  TripgCustomer
//
//  Created by XmL on 13-1-15.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "CompanyID.h"

@interface CompanyID ()

@end

@implementation CompanyID
@synthesize mComOperat,mComResult,mComSort;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

-(void)dealloc
{
    [mComOperat release];
    [mComResult release];
    [mComSort release];
    

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
