//
//  ShenQingViewController.h
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiLiBoViewController.h"
#import "ASIHTTPRequest.h"

@interface ShenQingViewController : UIViewController
<RiLiBoView,UITextFieldDelegate,UITextViewDelegate,UITableViewDelegate,UITableViewDataSource>

{
    UITableView *tableView;
    
    ASIHTTPRequest * shRequest;
    BOOL start;
    
    ASIHTTPRequest * yanRequset;
    
    ASIHTTPRequest * yy_request;
    BOOL yanStart;
    
    UILabel * labtn;
    UILabel * chLabtn;
    UILabel * fanLabtn;
    UILabel * sqLabel;
    UILabel *  alipayLabel;
    UILabel *  phoneCardLabel;
    UILabel *  onpheLabel;
    UILabel * yRmbLa;
    UILabel * jRmbLa;
    UILabel * slabel;
    UILabel * cityLab1;
    UILabel * cityLab2 ;
    UILabel * jiaoLab;
    UILabel * jLabAir;
    UILabel * jLabTri;
    UILabel * sslabel;
    UILabel * sflabel;
    
    UIButton * sqBtn;
    UIButton * ssBtn;
    UIButton * awardChoBtn_ali;
    UIButton *  awardChoBtn_Pho;
    UIButton *   awardChoBtnu_Pho;
    UIButton * btnChuf;
    UIImageView * image;
    UIButton * btnHuil;
    UIButton * jiaoTgjbtn;
    UIButton * jiaoBtnAir;
    UIButton * jiaoBtnTrip;

    UIImageView * image7;
    UIImageView * image8;
    UIImageView * image9;
    UIImageView * image10;
    
    
    
    UITextField * yJrmbField;
    UITextField * jKrmbField;
    
    UITextField * chuCityField;
    UITextField * didaCityField;
    
    UITextView * myTextView;
    
    UIImageView * imageSq;
    UIView * awardBackGroundView;
    UIView * awardBGView;
    UIView * jiaoViewBg;
    UIView * jiaoView;
    
    NSString * shTag;
    NSString * str;
    NSString * str1;
    NSString * str2;
    NSString * str3;
    
    NSString * text;
    NSString * text1;
    NSString * cText;
    NSString * cText1;
    NSString * mtextViewStr;
    
    UIActivityIndicatorView * activity;
    NSMutableArray * myShArray;
    NSMutableArray * myshTwoArray;
    NSMutableArray * myXmlArray;
    
    UIView *qview;
    NSMutableArray *wwarray;
    
    UILabel *lab;
    
    UIImageView * image6t;
    
    
    
}
@property(nonatomic,retain)UILabel *lab;
@property(nonatomic,retain)NSMutableArray *wwarray;
@property(nonatomic,retain)NSString * mtextViewStr;
@property(nonatomic,assign)BOOL start;
@property(nonatomic,assign)BOOL yanStart;
@property(nonatomic,retain)NSString * shTag;
@property(nonatomic,retain)NSString * str;
@property(nonatomic,retain)NSString * str1;
@property(nonatomic,retain)NSString * str2;
@property(nonatomic,retain)NSString * str3;
@property(nonatomic,retain)NSString * text;
@property(nonatomic,retain)NSString * text1;
@property(nonatomic,retain)NSString * cText;
@property(nonatomic,retain)NSString * cText1;
@property(nonatomic,retain)NSMutableArray * myShArray;
@property(nonatomic,retain)NSMutableArray * myXmlArray;
@property(nonatomic,retain)NSMutableArray * myshTwoArray;



-(id)initWithArray:(NSMutableArray * )dArray ;

-(NSString* )GetTomorrowDay:(NSDate *)date withDay:(int)day;
@end
