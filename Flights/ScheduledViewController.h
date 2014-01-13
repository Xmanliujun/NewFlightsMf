//
//  ScheduledViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "DengLuXML.h"
#import "MyNewXmlMolde.h"


@interface ScheduledViewController : UIViewController
<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIApplicationDelegate>
{
    UILabel *la;
    
    UILabel *lba;
    UILabel *lbb;
    UILabel *lbc;
    UILabel *lbd;
    UILabel *labue;
    UILabel *lasb;
    UILabel *ls;
    UILabel * lab1;
    UILabel * latt;
    
    UILabel * awardLabel;
    UILabel * alipayLabel;
    UILabel * phoneCardLabel;
    UILabel * onpheLabel;
    
    UITextField *tf;
    UITextField *tfq;
    UITextField *tfw;
    UITextField *tfr;
    UITextField *tft;
    
    UIButton *bbtn;
    UIButton *btnn;
    UIButton *bbrn;
    UIButton * buutton;
    
    UIButton * awardChoBtn_ali;
    UIButton * awardChoBtn_Pho;
    UIButton * awardChoBtnu_Pho;
    
    UIButton * sureBtn;
    UIButton * cancelBtn;
    
    UIWindow *aWindow;
    UIView * awardBackGroundView;
    UIView * awardBGView;
    
    UITableView *tabView;
    UIImageView *imageView;
    

    
    UIView * q_awardBackGroundView;  
    UIView * q_awardBGView;          
    
    UILabel * q_awardLabel;      
    UILabel * q_alipayLabel;     
    UILabel * q_phoneCardLabel;  
    UILabel * q_onpheLabel;      
    
    
    UIButton * q_awardChoBtn_ali;
    UIButton * q_awardChoBtn_Pho;
    UIButton * q_awardChoBtnu_Pho;
    
    UIButton * q_sureBtn;
    UIButton * q_cancelBtn;
    UIWindow * _bWindow;
    
   // NewsIteme * fristOne;
    MyNewXmlMolde *fristOne;
    
    NSMutableArray *_array;
    NSString * zPirce;
    NSString * chufaming;
    NSString * didaming;
    
    NSString * baoXian;
    NSString * dingDanZh;
    
    NSString * User_ID;
    
    NSString * ssr;
    
    NSMutableArray * tiJiArray;
   
    NSString * name;
    NSString * Passport_no;
    
    NSMutableArray *yy_Array;
    
    NSString * y_sto;
    NSString * y_stp;
    NSString * cssanzm;
    NSString * cssanzm2;
    UILabel * yy_label1;
    UILabel * yy_label2;
    UILabel * yy_label3;
    UILabel * yy_label4;
    UILabel * yy_label5;
    UILabel * yy_label6;
    
    UIView * yy_view;
    
    UIButton *yy_butt;
    UITextField *yy_tp;
    UITextField *yy_tf;
    
  
    NSString *twoString;
    
    
    
    NSString *yy_ZheKou;
    NSString *yy_Qi;
    NSString *yy_Di;
    NSString *yy_Jia;
    NSString *yy_Ji;
    NSString *yy_Ran;
    NSString *yy_Tui;
    NSString *jixing;
   
                  
    


}
@property (nonatomic, retain)NSString *jixing;
@property (nonatomic, retain)NSString *yy_Tui;
@property (nonatomic, retain)NSString *yy_Ji;
@property (nonatomic, retain)NSString *yy_Ran;
@property (nonatomic, retain)NSString *yy_Jia;
@property (nonatomic, retain)NSString *yy_Di;
@property (nonatomic, retain) NSString *yy_Qi;
@property (nonatomic, retain)NSString *yy_ZheKou;
@property (nonatomic, retain)NSString *twoString;
@property (nonatomic, retain)UILabel *yy_label1;
@property (nonatomic, retain)UILabel *yy_label2;
@property (nonatomic, retain)UILabel *yy_label3;
@property (nonatomic, retain)UILabel *yy_label4;
@property (nonatomic, retain)UILabel *yy_label5;
@property (nonatomic, retain)UILabel *yy_label6;
@property (nonatomic, retain)NSString *cssanzm2;
@property (nonatomic, retain)NSString *cssanzm;
@property (nonatomic, retain)NSString *y_stp;
@property (nonatomic, retain)NSString *y_sto;
@property (nonatomic, retain)NSMutableArray *yy_Array;
@property (nonatomic, retain)NSString * name;
@property (nonatomic, retain)NSString * Passport_no;
@property (nonatomic, retain)NSString *ssr;
@property (nonatomic,retain)NSString * dingDanZh;
@property (nonatomic,retain)NSString * baoXian;
@property (nonatomic,retain)NSString * chufaming;
@property (nonatomic,retain)NSString * didaming;
@property (nonatomic,retain)NSString * zPirce;
@property (nonatomic,retain)UILabel * awardLabel;
@property (nonatomic,retain)UILabel * alipayLabel;
@property (nonatomic,retain)UILabel * phoneCardLabel;
@property (nonatomic,retain)UILabel * onpheLabel;

@property (nonatomic, retain)UIButton * awardChoBtn_ali;
@property (nonatomic, retain)UIButton * awardChoBtn_Pho;
@property (nonatomic, retain)UIButton * awardChoBtnu_Pho;
@property (nonatomic, retain)UIButton * sureBtn;
@property (nonatomic, retain)UIButton * cancelBtn;
@property (nonatomic, retain)NSMutableArray *_array;
@property (nonatomic, retain)UILabel *la;

////

//@property (nonatomic,retain)NewsIteme * fristOne;

@property (nonatomic, retain)MyNewXmlMolde *fristOne;

@property (nonatomic, retain)NSMutableArray * tiJiArray;
@property (nonatomic, retain)UILabel * q_awardLabel;
@property (nonatomic, retain) UILabel * q_alipayLabel;;
@property (nonatomic, retain)UILabel * q_phoneCardLabel;
@property (nonatomic, retain)UILabel * q_onpheLabel;
@property (nonatomic, retain)UIButton * q_awardChoBtn_ali;
@property (nonatomic, retain)UIButton * q_awardChoBtn_Pho;
@property (nonatomic, retain)UIButton * q_awardChoBtnu_Pho;
@property (nonatomic, retain) UIButton * q_sureBtn;
@property (nonatomic, retain)UIButton * q_cancelBtn;


-(id)initWithOneItem:(MyNewXmlMolde * )oneItem WithArray:(NSMutableArray *)myarray withtwoArray:(NSMutableArray *)twomyArray;

@end
