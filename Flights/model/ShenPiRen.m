//
//  ShenPiRen.m
//  Flights
//
//  Created by mac on 13-4-18.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "ShenPiRen.h"

@interface ShenPiRen ()

@end

@implementation ShenPiRen
@synthesize mmResult,mmSort_no,mmOperates,mmOperate_id,mmOperate_name,mmOperate;

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
    
    [mmResult release];
    [mmSort_no release];
    [mmOperates release];
    [mmOperate_id release];
    [mmOperate_name release];
    [mmOperate release];
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
