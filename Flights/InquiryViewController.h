//
//  InquiryViewController.h
//  Flights
//
//  Created by mac on 12-10-18.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RiLiBoViewController.h"
#import "CListViewController.h"
#import "CompanyViewController.h"
@interface InquiryViewController : UIViewController<CListViewControllerProtocol,RiLiBoView,CompanyViewControllerProtocol>
{
    CListViewController *detailViewController;
    
    UIImageView *imageView;

    UILabel * labs;
    UILabel * labw;
    UILabel * labe;
    UILabel * labl;
    
    
    UIButton *Onewaybtn;
    UIButton *Twowaybtn;
    UIBarButtonItem *leftItems;//导航条左按钮
    UIImage *leftItem;//导航条左按钮图片
    UIImage *rightItem;//导航条右按钮图片
    UIView *oneview;
    UIButton *btn0;
    UIButton *btn1;
    UIButton *btn2;
    UIButton *btn3;
    UIButton *btn4;
    UIButton *btn5;
    UIImageView *myimageView;
    UILabel *_lable;
    UILabel *_lable1;
    UILabel *_lable2;
    UILabel *_lable3;
    UILabel *_lable4;
    
    UIButton *_btn1;
    UIButton *_btn2;
    UIButton *_btn3;
    UIButton *_btn4;
    UIButton *_btn5;
    UILabel *lable1;
    UILabel *lable2;
    UILabel *lable3;
    UILabel *lable4;
    
    NSString* str;
    NSString* str1 ;
    NSString* str2 ;
    NSString* str3 ;
    NSString *str21;
    NSString * str22;
    NSDictionary *dict1;
    NSDictionary *dict;
    
    NSString * sten;
    NSString * yueJm;
    NSString * ster;
    
    NSData *senddate;
    
    
    

}


@property(nonatomic,retain)NSString * ster;
@property(nonatomic,retain)NSString * yueJm;
@property(nonatomic,retain)NSString * sten;
@property(nonatomic,retain)NSString * str1;
@property(nonatomic,retain)NSString * str2;
@property(nonatomic,retain)NSString * str3;
@property(nonatomic,retain)NSString * str;
@property(nonatomic,retain)NSString * str21;
@property(nonatomic,retain)NSString * str22;
@property (nonatomic,retain)NSDictionary * dict1;
@property (nonatomic,retain)NSDictionary * dict;
@property NSUInteger curSection;
@property NSUInteger curRow;

@end
