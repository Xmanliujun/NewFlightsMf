//
//  GuanLiPi.m
//  Flights
//
//  Created by mac on 13-4-19.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "GuanLiPi.h"

@interface GuanLiPi ()

@end

@implementation GuanLiPi
@synthesize yy_RESULT,yy_APPROVAL_ID,yy_APPROVAL_DEPT,yy_APPROVAL_ROLE,yy_APPROVAL_NAME;
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
    [yy_RESULT release];
    [yy_APPROVAL_ID release];
    [yy_APPROVAL_DEPT release];
    [yy_APPROVAL_ROLE release];
    [yy_APPROVAL_NAME release];
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
