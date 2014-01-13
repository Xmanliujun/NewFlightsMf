//
//  TijiaoViewController.h
//  Flights
//
//  Created by mac on 12-11-23.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "ImageViewCon.h"


@interface TijiaoViewController : UIViewController

{
    NSMutableArray *rMyarray;
    
    NSMutableArray *Qarray;
    NSMutableArray *Rarray;
    
    NSString * ttag;
    
   ImageViewCon * myImageView;
    UIButton *yy_btn;
    
    NSString *pnr;
    NSString *y_danhao;
    NSString *piaoJia;
    NSString *changshui;
    NSString *youshui;
    NSString *baoxian;
    NSString *zong;
    
    NSString * ming;
    NSString * shenfen;
    NSString *Tel;
    
    
    NSString *oo_pnr;
    NSString *oo_y_danhao;
    NSString *oo_piaoJia;
    NSString *oo_changshui;
    NSString *oo_youshui;
    NSString *oo_baoxian;
    NSString *oo_zong;
    
    NSString * fanPnr;
    NSString * fanDanhao;
    NSString * fanMing;
    NSString * fanShenFen;
    NSString * fanTel;
    
    UIButton *y_button;
   

}
@property(nonatomic,retain)NSString * fanPnr;
@property(nonatomic,retain)NSString * fanDanhao;
@property(nonatomic,retain)NSString * fanMing;
@property(nonatomic,retain)NSString * fanShenFen;
@property(nonatomic,retain)NSString * fanTel;
@property(nonatomic,retain)NSString *oo_pnr;
@property(nonatomic,retain)NSString *oo_y_danhao;
@property(nonatomic,retain)NSString *oo_piaoJia;
@property(nonatomic,retain)NSString *oo_changshui;
@property(nonatomic,retain)NSString *oo_youshui;
@property(nonatomic,retain)NSString *oo_baoxian;
@property(nonatomic,retain)NSString *oo_zong;
@property(nonatomic,retain)NSString *Tel;
@property(nonatomic,retain)NSString * shenfen;
@property(nonatomic,retain)NSString * ming;
@property(nonatomic,retain)NSString *zong;
@property(nonatomic,retain)NSString *baoxian;
@property(nonatomic,retain)NSString *youshui;
@property(nonatomic,retain)NSString * changshui;
@property(nonatomic,retain)NSString *piaoJia;
@property(nonatomic,retain)NSString *y_danhao;
@property(nonatomic,retain)NSString *pnr;
@property(nonatomic,retain)UIButton *yy_btn;
@property(nonatomic,retain)NSMutableArray * rMyarray;
@property(nonatomic,retain)NSMutableArray * Qarray;
@property(nonatomic,retain)NSMutableArray * Rarray;
@property(nonatomic,retain)NSString *ttag;

//-(id)initWithArray:(NSMutableArray *)mTarray;
-(id)initWithArray:(NSMutableArray *)wanArray WithTag:(NSString *)tag;
@end
