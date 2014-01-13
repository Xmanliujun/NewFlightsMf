//
//  Sched_NHViewController.h
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyNewXmlMolde.h"

@interface Sched_NHViewController : UIViewController
<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate,UIApplicationDelegate>
{
    UILabel *_lba;
    UILabel *_lbb;
    UILabel *_lbc;
    UILabel *_lbd;
    UILabel *_labue;
    UILabel *lasb;
    UILabel *ls;
    UILabel *lab;
    
    UILabel * _awardLabel;
    UILabel * _alipayLabel;
    UILabel * _phoneCardLabel;
    UILabel * _onpheLabel;
    
    UITextField *_tf;
    UITextField *_tfq;
    UITextField *_tfw;
    UITextField *_tfr;
    UITextField *_tft;
    
    UIButton * _bbtn;
    UIButton * _btnn;
    UIButton * _bbrn;
    
    UIButton * _awardChoBtn_ali;
    UIButton * _awardChoBtn_Pho;
    UIButton * _awardChoBtnu_Pho;
    
    UIButton * _sureBtn;
    UIButton * _cancelBtn;
    
    UIWindow * _aWindow;
    UIView * _awardBackGroundView;
    UIView * _awardBGView;
    
    UITableView *_tabView;
    UIImageView *_imageView;

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
    
    
    
    MyNewXmlMolde * fristOne;
    MyNewXmlMolde * sectionTwo;
    NSMutableArray * tijiaoArray;
    
    NSMutableArray *_array;
    NSString * zPirce;
    NSString * chufaming;
    NSString * didaming;
    NSString *baoxian;
    NSString * dingDanZh;
    
    NSString * ssr;
    
    UIImageView *imageView;
    
    NSMutableArray *tiArray;
    
    NSString *spo;
    NSString *psb;
    
    NSString * name;
    NSString * Passport_no;
    MyNewXmlMolde * ya;
    
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
    
    UILabel *la;
    
    NSString * yy_danQiFei;
    NSString * yy_danDiDa;
    NSString * yy_danQiFeiTime;
    NSString * yy_danDiDaTime;
    NSString * yy_danCangWei;
    NSString * yy_danJiaGe;
    NSString * yy_danZheKou;
    NSString * yy_danJiJian;
    NSString * yy_danRanYou;
    NSString * yy_danTuiGaiQian;
    NSString * yy_danHangBanHao;
    NSString * yy_danjixing;
    
    NSString * wangQiTime;
    NSString * wangDiTime;
    NSString * wangCangWei;
    NSString * wangJiaGe;
    NSString * wangZheKou;
    NSString * wangJiJian;
    NSString * wangRanYou;
    NSString * wangTuiGaiQian;
    NSString * wangJiXing;
    
    NSString *y_String;
    NSString *t_String;
    
   
    
    NSString * w_String;
    NSString * l_String;
    
    NSString *ssm3;
    NSString *ssm4;
    
}
@property (nonatomic, retain)NSString * wangJiXing;
@property (nonatomic, retain)NSString * ssm3;
@property (nonatomic, retain)NSString * ssm4;
@property (nonatomic, retain)NSString * yy_danjixing;
@property (nonatomic, retain)NSString * y_String;
@property (nonatomic, retain)NSString * t_String;
@property (nonatomic, retain)NSString * w_String;
@property (nonatomic, retain)NSString * l_String;
@property (nonatomic, retain)NSString * wangQiTime;
@property (nonatomic, retain)NSString * wangDiTime;
@property (nonatomic, retain)NSString * wangCangWei;
@property (nonatomic, retain)NSString * wangJiaGe;
@property (nonatomic, retain)NSString * wangZheKou;
@property (nonatomic, retain)NSString * wangJiJian;
@property (nonatomic, retain)NSString * wangRanYou;
@property (nonatomic, retain)NSString * wangTuiGaiQian;
@property (nonatomic, retain)NSString * yy_danHangBanHao;
@property (nonatomic, retain)NSString * yy_danQiFei;
@property (nonatomic, retain)NSString * yy_danDiDa;
@property (nonatomic, retain)NSString * yy_danQiFeiTime;
@property (nonatomic, retain)NSString * yy_danDiDaTime;
@property (nonatomic, retain)NSString * yy_danCangWei;
@property (nonatomic, retain)NSString * yy_danJiaGe;
@property (nonatomic, retain)NSString * yy_danZheKou;
@property (nonatomic, retain)NSString * yy_danJiJian;
@property (nonatomic, retain)NSString * yy_danRanYou;
@property (nonatomic, retain)NSString * yy_danTuiGaiQian;
@property (nonatomic, retain)UILabel *la;
@property (nonatomic, retain)NSString *twoString;
@property (nonatomic, retain)UILabel *yy_label1;
@property (nonatomic, retain)UILabel *yy_label2;
@property (nonatomic, retain)UILabel *yy_label3;
@property (nonatomic, retain)UILabel *yy_label4;
@property (nonatomic, retain)UILabel *yy_label5;
@property (nonatomic, retain)UILabel *yy_label6;
@property (nonatomic,retain)MyNewXmlMolde * ya;
@property (nonatomic,retain)NSMutableArray * tijiaoArray;
@property (nonatomic,retain)NSString * name;
@property (nonatomic,retain)NSString * Passport_no;
@property (nonatomic,retain)NSMutableArray *tiArray;
@property (nonatomic,retain)NSString *psb;
@property (nonatomic,retain)NSString * spo;
@property (nonatomic,retain)NSString * ssr;
@property (nonatomic,retain)NSString * dingDanZh;
@property (nonatomic,retain)NSString * baoXian;
@property (nonatomic,retain)NSString * chufaming;
@property (nonatomic,retain)NSString * didaming;
@property (nonatomic,retain)NSString *zPirce;
@property(nonatomic,retain)NSMutableArray * _array;
@property (nonatomic,retain)UILabel *lab;
@property (nonatomic,retain)NSString *baoxian;
@property (nonatomic,retain)UILabel * _awardLabel;
@property (nonatomic,retain)UILabel * _alipayLabel;
@property (nonatomic,retain)UILabel * _phoneCardLabel;
@property (nonatomic,retain)UILabel * _onpheLabel;
@property (nonatomic, retain)UIButton * _awardChoBtn_ali;
@property (nonatomic, retain)UIButton * _awardChoBtn_Pho;
@property (nonatomic, retain)UIButton * _awardChoBtnu_Pho;
@property (nonatomic, retain)UIButton * _sureBtn;
@property (nonatomic, retain)UIButton * _cancelBtn;





@property (nonatomic,retain)MyNewXmlMolde * fristOne;
@property (nonatomic,retain)MyNewXmlMolde * sectionTwo;

@property (nonatomic, retain)UILabel * q_awardLabel;
@property (nonatomic, retain) UILabel * q_alipayLabel;;
@property (nonatomic, retain)UILabel * q_phoneCardLabel;
@property (nonatomic, retain)UILabel * q_onpheLabel;
@property (nonatomic, retain)UIButton * q_awardChoBtn_ali;
@property (nonatomic, retain)UIButton * q_awardChoBtn_Pho;
@property (nonatomic, retain)UIButton * q_awardChoBtnu_Pho;
@property (nonatomic, retain) UIButton * q_sureBtn;
@property (nonatomic, retain)UIButton * q_cancelBtn;



-(id)initWithOneItem:(MyNewXmlMolde * )oneItem withTwoItem:(MyNewXmlMolde *)twoItem withArray:(NSMutableArray *)ary withthree:(MyNewXmlMolde *)threeItem;

//-(id)initWithOneItem:(MyNewXmlMolde * )oneItem WithArray:(NSMutableArray *)myarray withtwoArray:(NSMutableArray *)twomyArray;



@end
