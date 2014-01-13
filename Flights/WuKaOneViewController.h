//
//  WuKaOneViewController.h
//  Flights
//
//  Created by XmL on 13-5-7.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"

@interface WuKaOneViewController : UIViewController
<UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>
{
    NSMutableArray * jArray;
    NSMutableArray * xyArray;
    NSDictionary * jDict;
    NSDictionary * xDict;
    
    NSMutableArray * numArray;
    
    
    
    UIView * oneView;
    UIView * twoView;
    UIView * threeView;
    
    UIButton * xButton;
    UIButton * jButton;
    UIButton * yButton;
    UIButton * zButton;
    UIButton * vButton;
    
    UIButton * vzButton;
    UIButton * vzButton2;
    UIButton * vzButton3;
    
    UIButton * zhiFuButton;
    
    UITextField * codeNumText;
    UITextField * certNameText;
    UITextField * certCodeText;
    UITextField * certPhoneText;
    UITextField * xbankNumText;
    UILabel * bankLabel;
    UILabel * zhengLabel;
    UILabel * label6;
    UILabel * label5;
    UILabel * label4;
    UILabel * label3;
    UILabel * label2;
    UILabel * label1;
    
    
    UIImageView * imageView1;
    UIImageView * imageView2;
    
    UITableView * myTableViewBank;
    UITableView * jMytableViewBank;
    
    
    
    NSString * stringBank;
    NSString * bankNameString;
    NSString * xBankNumString;
    NSString * jString;
    NSString * xString;
    NSString * sZhString;
    
    NSString * codeNumString;
    NSString * certNameString;
    NSString * certOnString;
    NSString * certPhoneString;
    
    NSString * pnr;
    NSString * dinghao;
    NSString * y_ming;
    NSString * y_shenfen;
    NSString * y_Tel;
    ASIHTTPRequest * yy_request;
    
    BOOL start;
    
    NSString * fan_pnr;
    NSString * fan_danhao;
    NSString * fan_ming;
    NSString * fan_shenfen;
    NSString * fan_tel;
    NSString *  stringTag;
    
}
@property (nonatomic, retain)NSString * stringTag;
@property (nonatomic, retain)NSString * fan_pnr;
@property (nonatomic, retain)NSString * fan_danhao;
@property (nonatomic, retain)NSString * fan_ming;
@property (nonatomic, retain)NSString * fan_shenfen;
@property (nonatomic, retain)NSString * fan_tel;
@property (nonatomic, assign)BOOL start;
@property (nonatomic, retain)ASIHTTPRequest * yy_request;
@property (nonatomic,retain)NSString * y_Tel;
@property (nonatomic,retain)NSString * y_ming;
@property (nonatomic,retain)NSString * y_shenfen;
@property (nonatomic,retain)NSString * pnr;
@property (nonatomic,retain)NSString * dinghao;
@property (nonatomic,retain) NSString * certPhoneString;
@property (nonatomic,retain) NSString * bankNameString;
@property (nonatomic,retain) NSString * codeNumString;
@property (nonatomic,retain) NSString * certNameString;
@property (nonatomic,retain) NSString * certOnString;
@property (nonatomic,retain) NSString * xBankNumString;

@property (nonatomic,retain) NSString * stringBank;
@property (nonatomic,retain) NSString * jString;
@property (nonatomic,retain) NSString * xString;
@property (nonatomic,retain) NSString * sZhString;

@property (nonatomic,retain) NSMutableArray * jArray;
@property (nonatomic,retain) NSMutableArray * xyArray;
@property (nonatomic,retain) NSDictionary * jDict;
@property (nonatomic,retain) NSDictionary * xDict;
@property (nonatomic,retain) NSMutableArray * numArray;

-(id)initWithArray:(NSMutableArray *)array ;
- (void)moveLoginView:(UIView *)loginView setFrame:(CGRect)rect;




@end
