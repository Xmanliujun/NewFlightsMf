//
//  WangDingViewController.h
//  Flights
//
//  Created by XmL on 12-11-14.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ASIAuthenticationDialog.h"
#import "MyNewXmlMolde.h"
#import "ASIHTTPRequest.h"

@interface WangDingViewController : UIViewController
<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * myTableView;
    
    UIActivityIndicatorView * activity;
    NSString *yy_aLoup;
    NSString *yy_bLoup;
    NSString *klstring;
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
    
    
    MyNewXmlMolde * danChMo;
    MyNewXmlMolde * wangFMo;
    MyNewXmlMolde * ya;
    
    NSArray * newArray;
    NSArray * array;
    NSMutableArray * myArray;
    
    NSString * sten;
    NSString * yueJm;
    NSString * ster;
   
    NSString * User_id;
    
    UIButton * btn;
    
    UIImageView *imageView;
    
    NSString *svn;
    
    NSString *row;
    NSString *eru;
    NSString *yueJ;

    
    NSMutableArray * tiJiArray;
    ASIHTTPRequest * gEleRequest;
    BOOL gEleStart;
    
    NSString *xitongTime;
    NSString *yy_pnr;
    NSString *dingdanhao;
    
    ASIHTTPRequest * yy_request;
    
    NSString *yy_Zhe;
    NSString *yy_QiFei;
    NSString *yy_DiDa;
    NSString *yy_JiaGe;
    NSString *yy_JiJian;
    NSString *yy_RanYou;
    NSString *yy_TuiGai;
    NSString *yy_jixing;
    
    NSString *liv;
    NSString * aa;
    NSString * bb;
    NSString *y_srr;
    NSString *bao;

   
    NSString * yyy_danQiFei;
    NSString * yyy_danDiDa;
    NSString * yyy_danQiFeiTime;
    NSString * yyy_danDiDaTime;
    NSString * yyy_danCangWei;
    NSString * yyy_danJiaGe;
    NSString * yyy_danZheKou;
    NSString * yyy_danJiJian;
    NSString * yyy_danRanYou;
    NSString * yyy_danTuiGaiQian;
    NSString * yyy_danHangBanHao;
    NSString * yyy_danjixing;
    
    NSString * y_wangQiTime;
    NSString * y_wangDiTime;
    NSString * y_wangCangWei;
    NSString * y_wangJiaGe;
    NSString * y_wangZheKou;
    NSString * y_wangJiJian;
    NSString * y_wangRanYou;
    NSString * y_wangTuiGaiQian;
    NSString * y_wangJiXing;
    NSString *hah;
    NSString *fanhangban;
    
    NSString *sanzima;
    NSString *sanzima2;
    NSString * wangSinglePrice;
    NSString * wangQiTime;
    NSString * wangDiTime;
    NSString *danhangban;
    NSString *wanghangban;
    
}


@property(nonatomic,retain)NSString*yy_aLoup;
@property(nonatomic,retain)NSString*yy_bLoup;
@property(nonatomic,retain)NSString*klstring;
@property(nonatomic,retain)NSString *fanhangban;
@property(nonatomic,retain)NSString *wanghangban;
@property(nonatomic,retain)NSString *danhangban;
@property(nonatomic,retain)NSString *wangQiTime;
@property(nonatomic,retain)NSString *wangDiTime;
@property (nonatomic,retain)NSString * bb;

@property(nonatomic,retain)NSString * y_wangJiXing;
@property(nonatomic,retain)NSString *sanzima;
@property(nonatomic,retain)NSString *sanzima2;
@property(nonatomic,retain)NSString * yyy_danjixing;
@property(nonatomic,retain)NSString * y_wangQiTime;
@property(nonatomic,retain)NSString * y_wangDiTime;
@property(nonatomic,retain)NSString * y_wangCangWei;
@property(nonatomic,retain)NSString * y_wangJiaGe;
@property(nonatomic,retain)NSString * y_wangZheKou;
@property(nonatomic,retain)NSString * y_wangJiJian;
@property(nonatomic,retain)NSString * y_wangRanYou;
@property(nonatomic,retain)NSString * y_wangTuiGaiQian;
@property(nonatomic,retain)NSString * yyy_danHangBanHao;
@property(nonatomic,retain)NSString * yyy_danQiFei;
@property(nonatomic,retain)NSString * yyy_danDiDa;
@property(nonatomic,retain)NSString * yyy_danQiFeiTime;
@property(nonatomic,retain)NSString * yyy_danDiDaTime;
@property(nonatomic,retain)NSString * yyy_danCangWei;
@property(nonatomic,retain)NSString * yyy_danJiaGe;
@property(nonatomic,retain)NSString * yyy_danZheKou;
@property(nonatomic,retain)NSString * yyy_danJiJian;
@property(nonatomic,retain)NSString * yyy_danRanYou;
@property(nonatomic,retain)NSString * yyy_danTuiGaiQian;
@property(nonatomic,retain)NSString *bao;
@property(nonatomic,retain)NSString *yy_Zhe;
@property(nonatomic,retain)NSString *yy_QiFei;
@property(nonatomic,retain)NSString *yy_DiDa;
@property(nonatomic,retain)NSString *yy_JiaGe;
@property(nonatomic,retain)NSString *yy_JiJian;
@property(nonatomic,retain)NSString *yy_RanYou;
@property(nonatomic,retain)NSString *yy_TuiGai;
@property(nonatomic,retain)NSString *yy_jixing;
@property(nonatomic,retain)NSString *liv;
@property(nonatomic,retain)ASIHTTPRequest * yy_request;
@property(nonatomic,retain)NSString *yy_pnr;
@property(nonatomic,retain)NSString *dingdanhao;
@property(nonatomic,retain)NSString *xitongTime;
@property(nonatomic,retain)MyNewXmlMolde * ya;
@property (nonatomic,assign) BOOL gEleStart;
@property(nonatomic,retain)NSString *row;
@property(nonatomic,retain)NSString *eru;
@property(nonatomic,retain)NSString *yueJ;
@property(nonatomic,retain)NSString * svn;
@property(nonatomic,retain)NSString * User_id;
@property(nonatomic,retain)NSString * sten;
@property(nonatomic,retain)NSString * yueJm;
@property(nonatomic,retain)NSString * ster;
@property(nonatomic,retain)MyNewXmlMolde * danChMo;
@property(nonatomic,retain)MyNewXmlMolde * wangFMo;
@property(nonatomic,retain)NSArray * array;
@property(nonatomic,retain)NSMutableArray * myArray;
@property(nonatomic,retain)NSMutableArray * tiJiArray;



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

-(id)initWithOneItem:(MyNewXmlMolde * )woneItem withTwoItem:(MyNewXmlMolde *)wtwoItem WithArray:(NSMutableArray *)amArray withthree:(MyNewXmlMolde *) threeItem;




@end
