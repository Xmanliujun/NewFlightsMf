//
//  DingDanController.h
//  Flights
//
//  Created by XmL on 12-11-12.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIHTTPRequest.h"
#import "MyNewXmlMolde.h"
@interface DingDanController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * myTableView;
    
    UIActivityIndicatorView * activity;
    
    UIButton * btn;
    
    UILabel * la;
    UILabel * lable2;
    UILabel * labb;
    UILabel * lable1;
    UILabel * lable;
    UILabel * lableq;
    
    NSString * str01;
    NSString * str02;
    NSString * str1;
    NSString * str2;
    NSString * str3;
    NSString * str4;
    NSString * str5;
    NSString * str6;
    NSString * str7;
    NSString * str8;
    NSString * str9;
    NSString * str10;
    NSString * str11;
    NSString * str12;
    NSString * str13;
    NSString * str14;
    NSString * str15;
    NSString * str16;
    NSString * str17;
    NSString * str18;
    NSString * str19;
    NSString *yy_aLoup;
    NSString *yy_bLoup;
    
    NSArray * newArray;
    NSArray * array;
    NSMutableArray * myArray;

    NSString * sten;
    NSString * yueJm;
    NSString * ster;
    
    MyNewXmlMolde *myNewItem;
    
    NSMutableArray * nawAaay;
    
    NSString *User_id;
    
    UIImageView *imageView;
    
    ASIHTTPRequest * yy_request;
    
    ASIHTTPRequest * gEleRequest;
    BOOL gEleStart;
    
    NSString *sanzima;
    NSString *sanzima2;
    
    NSString *yy_pnr;
    NSString *dingdanhao;
    NSString *xitongTime;
    NSString * zongPJ;
    NSString *trString;
    NSString *twString;
    NSString *hah;
    
    
    
    NSString *yy_Zhe;
    NSString *yy_QiFei;
    NSString *yy_DiDa;
    NSString *yy_JiaGe;
    NSString *yy_JiJian;
    NSString *yy_RanYou;
    NSString *yy_TuiGai;
    NSString *yy_jixing;
    NSString *y_srr;
    NSString *bao;
    NSString *y_zop;
    NSString *a;
    NSString *b;
    
    


}
@property(nonatomic,retain)NSString *y_srr;
@property(nonatomic,retain)NSString *y_zop;
@property(nonatomic,retain)NSString *bao;
@property(nonatomic,retain)NSString *yy_jixing;
@property(nonatomic,retain)NSString *yy_JiaGe;
@property(nonatomic,retain)NSString *yy_JiJian;
@property(nonatomic,retain)NSString *yy_RanYou;
@property(nonatomic,retain)NSString *yy_TuiGai;
@property(nonatomic,retain)NSString *yy_QiFei;
@property(nonatomic,retain)NSString *yy_DiDa;
@property(nonatomic,retain)NSString *yy_Zhe;
@property(nonatomic,retain)NSString *trString;
@property(nonatomic,retain)NSString *twString;
@property(nonatomic,retain)NSString * zongPJ;
@property(nonatomic,retain)NSString *xitongTime;
@property(nonatomic,retain)NSString * dingdanhao;

@property(nonatomic,retain)NSString * yy_bLoup;
@property(nonatomic,retain)NSString * yy_aLoup;

@property(nonatomic,retain)NSString * yy_pnr;
@property(nonatomic,retain)NSString *klstring;
@property(nonatomic,retain)NSString * str01;
@property(nonatomic,retain)NSString * str02;
@property(nonatomic,retain)NSString * sanzima;
@property(nonatomic,retain)NSString * sanzima2;
@property(nonatomic,retain)ASIHTTPRequest * yy_request;
@property(nonatomic,assign) BOOL gEleStart;
@property(nonatomic,retain)NSString *User_id;
@property(nonatomic,retain)NSMutableArray *nawAaay;
@property(nonatomic,retain)NSMutableArray * myArray;
@property (nonatomic,retain)MyNewXmlMolde *myNewItem;
@property(nonatomic,retain)NSArray * array;
@property(nonatomic,retain)NSString * sten;
@property(nonatomic,retain)NSString * yueJm;
@property(nonatomic,retain)NSString * ster;

@property(nonatomic,retain)NSString * str1;
@property(nonatomic,retain)NSString * str2;
@property(nonatomic,retain)NSString * str3;
@property(nonatomic,retain)NSString * str4;
@property(nonatomic,retain)NSString * str5;
@property(nonatomic,retain)NSString * str6;
@property(nonatomic,retain)NSString * str7;
@property(nonatomic,retain)NSString * str8;
@property(nonatomic,retain)NSString * str9;
@property(nonatomic,retain)NSString * str10;
@property(nonatomic,retain)NSString * str11;
@property(nonatomic,retain)NSString * str12;
@property(nonatomic,retain)NSString * str13;
@property(nonatomic,retain)NSString * str14;
@property(nonatomic,retain)NSString * str15;
@property(nonatomic,retain)NSString * str16;
@property(nonatomic,retain)NSString * str17;
@property(nonatomic,retain)NSString * str18;
@property(nonatomic,retain)NSString * str19;


-(void)DingDanHaoHttp:(NSString *)spen;
-(id)initWithItem:(MyNewXmlMolde *)yuDingItem WithArray:(NSMutableArray *)marray;
@end
