//
//  DeXMlModel.m
//  TripgCustomer
//
//  Created by XmL on 13-1-15.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "DeXMlModel.h"

@interface DeXMlModel ()

@end

@implementation DeXMlModel


@synthesize mResult,mName,mGender,mCompany,mDept_id,mRole_id,mPassport_type,mPay_raward,mBirthday,mTotal_raward,mApproved,mCnphoal,mCardtype,mUserID,mPassport_no;

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
    
    [mPassport_no release];
    [mRole_id release];
    [mResult release];
    [mApproved release];
    [mDept_id release];
    [mCompany release];
    [mGender release];
    [mPassport_type release];
    [mTotal_raward release];
    [mPay_raward release];
    [mBirthday release];
    [mName release];
    [mCardtype release];
    [mCnphoal release];
    [mUserID release];

    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
