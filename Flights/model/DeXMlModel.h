//
//  DeXMlModel.h
//  TripgCustomer
//
//  Created by XmL on 13-1-15.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeXMlModel : UIViewController


{

    NSString * mResult;
    NSString * mName;
    NSString * mGender;
    NSString * mCompany;
    NSString * mDept_id;
    NSString * mRole_id;
    NSString * mPassport_type;
    NSString * mPassport_no;
    NSString * mBirthday;
    NSString * mTotal_raward;
    NSString * mPay_raward;
    NSString * mApproved;
    NSString * mCnphoal;
    NSString * mCardtype;
    NSString * mUserID;

}
@property(nonatomic,retain)NSString *mPassport_no;
@property(nonatomic,retain)NSString * mUserID;
@property(nonatomic,retain)NSString * mResult;
@property(nonatomic,retain)NSString * mName;
@property(nonatomic,retain)NSString * mGender;
@property(nonatomic,retain)NSString * mCompany;
@property(nonatomic,retain)NSString * mDept_id;
@property(nonatomic,retain)NSString * mRole_id;
@property(nonatomic,retain)NSString * mPassport_type;
@property(nonatomic,retain)NSString * mBirthday;
@property(nonatomic,retain)NSString * mTotal_raward;
@property(nonatomic,retain)NSString * mPay_raward;
@property(nonatomic,retain)NSString * mApproved;
@property(nonatomic,retain)NSString * mCnphoal;
@property(nonatomic,retain)NSString * mCardtype;
@end
