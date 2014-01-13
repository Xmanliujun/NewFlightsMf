//
//  YuDingXMLaa.m
//  Flights
//
//  Created by XmL on 12-11-14.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "YuDingXMLaa.h"

@interface YuDingXMLaa ()

@end

@implementation YuDingXMLaa

@synthesize pnr,resid,tkt_price,tax_fee,yq,ins_price,price,mmberid;
@synthesize p_name,agt_price,out_price,card_ID,d_tax,d_yq;


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
    [pnr release];
    [resid release];
    [tkt_price release];
    [tax_fee release];
    [yq release];
    [ins_price release];
    [price release];
    [mmberid release];
    
    [p_name release];
    [agt_price release];
    [out_price release];
    [d_tax release];
    [d_yq release];
    [card_ID release];
    
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
