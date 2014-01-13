//
//  ShenQingViewController.m
//  TripgCustomer
//
//  Created by XmL on 13-1-14.
//  Copyright (c) 2013年 XmL. All rights reserved.
//

#import "ShenQingViewController.h"
#import "RootViewController.h"
#import "RiLiBoViewController.h"
#import "AppDelegate.h"
#import "DeXMlModel.h"
#import "CompanyID.h"
#import "ASIHTTPRequest.h"
#import "RecomTiJiaoXMl.h"
#import "ShQXmlmodel.h"
#import "RecomYanzhXml.h"
#import "ShenPiRenXML.h"
#import "ShenPiRen.h"

@interface ShenQingViewController ()

@end

@implementation ShenQingViewController
@synthesize shTag,str,str1,str2,str3,text,text1,cText,cText1,myShArray,myXmlArray,myshTwoArray,start,mtextViewStr,yanStart,lab;
@synthesize wwarray;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithArray:(NSMutableArray *)dArray 
{

    if (self = [super init]) {
        self.myShArray = [NSMutableArray arrayWithArray:dArray];
        
    }

    return self;
}

-(NSString* )GetTomorrowDay:(NSDate *)date withDay:(int)day
{
    
    NSCalendar * gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents * comp = [gregorian components:NSWeekCalendarUnit | NSYearCalendarUnit|NSMonthCalendarUnit | NSDayCalendarUnit fromDate:date];
    [comp setDay:([comp day] + day)];
    
    NSDate * beginWeek = [gregorian dateFromComponents:comp];
    NSDateFormatter * dateDay = [[[NSDateFormatter alloc] init] autorelease];
    [dateDay setDateFormat:@"yyyy-MM-dd"];
    
    return [dateDay stringFromDate:beginWeek];
    
    
}

-(void)btnFanHui:(UIButton * )btnn
{
    if (start == YES) {
        [activity stopAnimating];
        [shRequest clearDelegatesAndCancel];
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
  
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:rvc animated:YES completion:NULL];
        start = NO;
    }else{
    
        RootViewController * rvc = [[[RootViewController alloc] init] autorelease];
    
        rvc.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:rvc animated:YES completion:NULL];
    }
    
}


-(void)btnChufa:(UIButton *)btn
{
    
    
    RiLiBoViewController * myRiLi = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:myRiLi] autorelease];
    
    myRiLi.tag = @"shenqing";
    myRiLi.delegate = self;
    myRiLi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    

}

-(void)btnHuilai:(UIButton *)btn
{
    
    RiLiBoViewController * fanRiLi = [[[RiLiBoViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:fanRiLi] autorelease];

    fanRiLi.tag = @"fanhui";
    fanRiLi.delegate = self;
    fanRiLi.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];


}

-(void)jiaotong:(UIButton *)button
{

    
    jiaoView.hidden = NO;
    jiaoViewBg.hidden = NO;
    
    [jiaoBtnAir setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    [jiaoBtnTrip setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];

}

-(void)jTongBtnXuan:(UIButton *)button
{
    if (button.tag==1001) {
        
        [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
        [jiaoBtnTrip setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
              jiaoLab.text = jLabAir.text;
        
    }else if (button.tag==1002) {
        
        [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
        [jiaoBtnAir setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
       
        jiaoLab.text = jLabTri.text;
    }


}
-(void)jTongSure:(UIButton *)button
{
    
    jiaoViewBg.hidden = YES;
    jiaoView.hidden = YES;
    

}
-(void)jTongCan:(UIButton *)button
{
    jiaoViewBg.hidden = YES;
    jiaoView.hidden = YES;
    jiaoLab.text = @"交通工具";

}
-(void)jiaoViewContro
{

    jiaoViewBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    jiaoViewBg.tag = 1003;
    jiaoViewBg.backgroundColor = [UIColor blackColor];
    jiaoViewBg.alpha = 0.6;
    jiaoViewBg.hidden = YES;
    jiaoView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 263, 258)];
    jiaoView.tag = 1004;
    jiaoView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景.png"]];
    jiaoView.hidden = YES;
 
    
    
    UILabel * awardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 , 5, 263,19 )];
    awardLabel.text = @"请选择出行方式";
    awardLabel.font = [UIFont systemFontOfSize:15.0f];
    awardLabel.textAlignment = NSTextAlignmentCenter;
    awardLabel.backgroundColor = [UIColor clearColor];
    [jiaoView addSubview:awardLabel];
    [awardLabel release];
    
    jLabAir = [[UILabel alloc] initWithFrame:CGRectMake(39, 45, 100, 30)];
    jLabAir.text = @"乘飞机至";
    jLabAir.font = [UIFont systemFontOfSize:15.0f];
    jLabAir.textAlignment = NSTextAlignmentCenter;
    jLabAir.backgroundColor = [UIColor clearColor];
    [jiaoView addSubview:jLabAir];
    [jLabAir release];
    
    jLabTri = [[UILabel alloc] initWithFrame:CGRectMake(39, 105, 100, 30)];
    jLabTri.text = @"乘火车至";
    jLabTri.font = [UIFont systemFontOfSize:15.0f];
    jLabTri.textAlignment = NSTextAlignmentCenter;
    jLabTri.backgroundColor = [UIColor whiteColor];
    [jiaoView addSubview:jLabTri];
    [jLabTri release];
    
        
    jiaoBtnAir = [UIButton buttonWithType:UIButtonTypeCustom];
    [jiaoBtnAir setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    jiaoBtnAir.tag = 1001;
    [jiaoBtnAir addTarget:self action:@selector(jTongBtnXuan:) forControlEvents:UIControlEventTouchUpInside];
    jiaoBtnAir.frame = CGRectMake(207, 45, 35, 35);
    [jiaoView addSubview:jiaoBtnAir];
    
    jiaoBtnTrip = [UIButton buttonWithType:UIButtonTypeCustom];
    jiaoBtnTrip.tag = 1002;
    [jiaoBtnTrip addTarget:self action:@selector(jTongBtnXuan:) forControlEvents:UIControlEventTouchUpInside];
    [jiaoBtnTrip setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    jiaoBtnTrip.frame = CGRectMake(207, 105, 35, 35);
    [jiaoView addSubview:jiaoBtnTrip];
    
       
    
    UIButton*  sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(50, 220, 66, 29);
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(jTongSure:) forControlEvents:UIControlEventTouchUpInside];
    [jiaoView addSubview:sureBtn];
    
    UIButton*  cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(148, 220, 66, 29);
    [cancelBtn addTarget:self action:@selector(jTongCan:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
    [jiaoView addSubview:cancelBtn];
    
    
    [jiaoViewBg addSubview:jiaoView];
    [ShareApp.window addSubview:jiaoViewBg];
    [jiaoViewBg release];
    [ShareApp.window addSubview:jiaoView];
    [jiaoView release];



}



-(void)shenqingBtn:(UIButton *)btn
{

    
    awardBackGroundView.hidden = NO;
    awardBGView.hidden = NO;
    
    [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];


}

-(void)chuanzhiString:(NSString *)strNian withStrt:(NSString *)strYue withStr:(NSString *)strDay withTag:(NSString *)tag
{
    self.str1 = strNian;
    
    
    int strY = [strYue intValue];
    int strD = [strDay intValue];
    
    if (strY <=9) {
        
        self.str2 = [NSString stringWithFormat:@"%d%d",0,strY];
    }else {
        self.str2 = [NSString stringWithFormat:@"%d",strY];
        
    }
    
    if (strD <= 9){
        
        self.str3 = [NSString stringWithFormat:@"%d%d",0,strD];
    } else{
        
        self.str3 = [NSString stringWithFormat:@"%d",strD];
        
    }
    
    
    self.str = [NSString stringWithFormat:@"%@-%@-%@",self.str1,self.str2,self.str3];
    NSLog(@"%@",self.str);
    
    
    if ([tag isEqualToString:@"shenqing"]) {
        chLabtn.text= self.str;
    }else if ([tag isEqualToString:@"fanhui"]){
        
        fanLabtn.text= self.str;
        
    }
    
    
    
}
-(void)xuanzeLeixing:(UIButton *)button
{
   
    if (button.tag==10001) {
        
        [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
        [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        sqLabel.text = alipayLabel.text;
        self.shTag = [NSString stringWithFormat:@"1"];
        
    }else if (button.tag==10002) {
        
        [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
        [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        sqLabel.text = phoneCardLabel.text;
        self.shTag = [NSString stringWithFormat:@"2"];

    }else if (button.tag==10005) {
        
        
        [button setImage:[UIImage imageNamed:@"选择-选中.png"] forState:UIControlStateNormal];
        [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
        sqLabel.text = onpheLabel.text;
        self.shTag = [NSString stringWithFormat:@"3"];

    }



}

-(void)sureBtnPressed:(UIButton *)button
{
    
    awardBackGroundView.hidden = YES;
    awardBGView.hidden = YES;
    
    
}

-(void)cancelBtnPressed:(UIButton *)button
{
    
    awardBackGroundView.hidden = YES;
    awardBGView.hidden = YES;
    sqLabel.text= @"选择类型";
}

-(void)leixing
{
    awardBackGroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 568)];
    awardBackGroundView.tag = 10003;
    awardBackGroundView.backgroundColor = [UIColor blackColor];
    awardBackGroundView.alpha = 0.6;
    awardBackGroundView.hidden = YES;
    
    awardBGView = [[UIView alloc] initWithFrame:CGRectMake(30, 100, 263, 258)];
    awardBGView.tag = 10004;
    awardBGView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"弹窗背景.png"]];
    awardBGView.hidden = YES;
    
    
   UILabel * awardLabel = [[UILabel alloc] initWithFrame:CGRectMake(0 , 5, 263,19 )];
    awardLabel.text = @"请选择申请方式";
    awardLabel.font = [UIFont systemFontOfSize:15.0f];
    awardLabel.textAlignment = NSTextAlignmentCenter;
    awardLabel.backgroundColor = [UIColor clearColor];
    [awardBGView addSubview:awardLabel];
    [awardLabel release];
    
    alipayLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 45, 100, 30)];
    alipayLabel.text = @"机票申请";
    alipayLabel.font = [UIFont systemFontOfSize:15.0f];
    alipayLabel.textAlignment = NSTextAlignmentCenter;
    alipayLabel.backgroundColor = [UIColor clearColor];
    [awardBGView addSubview:alipayLabel];
    [alipayLabel release];
    
    phoneCardLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 105, 100, 30)];
    phoneCardLabel.text = @"酒店申请";
    phoneCardLabel.font = [UIFont systemFontOfSize:15.0f];
    phoneCardLabel.textAlignment = NSTextAlignmentCenter;
    phoneCardLabel.backgroundColor = [UIColor whiteColor];
    [awardBGView addSubview:phoneCardLabel];
    [phoneCardLabel release];
    
    onpheLabel = [[UILabel alloc] initWithFrame:CGRectMake(39, 170, 100, 30)];
    onpheLabel.text = @"其他申请";
    onpheLabel.font = [UIFont systemFontOfSize:15.0f];
    onpheLabel.textAlignment = NSTextAlignmentCenter;
    onpheLabel.backgroundColor = [UIColor clearColor];
    [awardBGView addSubview:onpheLabel];
    [onpheLabel release];
    
    awardChoBtn_ali = [UIButton buttonWithType:UIButtonTypeCustom];
    [awardChoBtn_ali setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    awardChoBtn_ali.tag = 10001;
    [awardChoBtn_ali addTarget:self action:@selector(xuanzeLeixing:) forControlEvents:UIControlEventTouchUpInside];
    awardChoBtn_ali.frame = CGRectMake(207, 45, 35, 35);
    [awardBGView addSubview:awardChoBtn_ali];
    
    awardChoBtn_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
    awardChoBtn_Pho.tag = 10002;
    [awardChoBtn_Pho addTarget:self action:@selector(xuanzeLeixing:) forControlEvents:UIControlEventTouchUpInside];
    [awardChoBtn_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    awardChoBtn_Pho.frame = CGRectMake(207, 105, 35, 35);
    [awardBGView addSubview:awardChoBtn_Pho];
    
    awardChoBtnu_Pho = [UIButton buttonWithType:UIButtonTypeCustom];
    awardChoBtnu_Pho.tag = 10005;
    [awardChoBtnu_Pho addTarget:self action:@selector(xuanzeLeixing:) forControlEvents:UIControlEventTouchUpInside];
    [awardChoBtnu_Pho setImage:[UIImage imageNamed:@"选择-空.png"] forState:UIControlStateNormal];
    awardChoBtnu_Pho.frame = CGRectMake(207, 170, 35, 35);
    [awardBGView addSubview:awardChoBtnu_Pho];
    
    
    UIButton*  sureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sureBtn.frame = CGRectMake(50, 220, 66, 29);
    [sureBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
    [sureBtn addTarget:self action:@selector(sureBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [awardBGView addSubview:sureBtn];
    
    UIButton*  cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(148, 220, 66, 29);
    [cancelBtn addTarget:self action:@selector(cancelBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [cancelBtn setBackgroundImage:[UIImage imageNamed:@"弹窗-取消机票.png"] forState:UIControlStateNormal];
    [awardBGView addSubview:cancelBtn];
    
  
    [awardBackGroundView addSubview:awardBGView];
    [ShareApp.window addSubview:awardBackGroundView];
    [awardBackGroundView release];
    [ShareApp.window addSubview:awardBGView];
    [awardBGView release];
    



}

-(void)httpXmlAsi
{
    if ( [self.myshTwoArray count] != 0) {
        
    
   
    CompanyID * ctiXml = [self.myshTwoArray objectAtIndex:0];
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
        NSString * mCompany = [defaults objectForKey:@"dcompany"];
         NSString * mUser = [defaults objectForKey:@"duser_ID"];
        NSLog(@"mDept_id is  %@",mDept_id);
        NSLog(@"mUser  is %@",mUser);
        ShenPiRen * sren = [self.wwarray objectAtIndex:0];
    
        NSLog(@"审批人ID %@",sren.mmOperate_id);
    NSString * tiString = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/create_travel.php?Company_id=%@&Sort_no=%@&Applicant=%@&Start_date=%@&End_date=%@&Sab_leave=y&Desc=%@&Currency=RMB&Cur_approver=%@&Est_amounts=%@&Loan_amounts=%@&Route=%@|乘飞机至|%@&Types=%@&Flight_type=1",mCompany,ctiXml.mComSort,mUser,chLabtn.text,fanLabtn.text,self.mtextViewStr,sren.mmOperate_id,self.text,self.text1,self.cText,self.cText1,self.shTag];

    NSLog(@"tijiao  %@",tiString);
    tiString = [tiString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    

    
    NSURL * url = [NSURL URLWithString:tiString];
    
    shRequest = [ASIHTTPRequest requestWithURL:url];
    [shRequest setTag:1005];
    [shRequest setDelegate:self];
    [shRequest startAsynchronous];
    
    start = YES;
        [activity startAnimating];
    }

}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    start = NO;
     NSLog(@" %@",[request responseString]);
    [activity stopAnimating];
    if (request.tag == 1005) {
        NSLog(@"%@",[request responseString]);
        
        self.myXmlArray = [RecomTiJiaoXMl recomtijiaoshenqing:[request responseString]];
        
        if ([self.myXmlArray count] != 0) {
            ShQXmlmodel * shqa = [self.myXmlArray objectAtIndex:0];
            
            if ([shqa.sResult isEqualToString:@"SUCCEED"]) {
                
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提交申请成功!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
                [alertView release];
            }else{
                UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"提交申请失败!" message:nil delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
                [alertView show];
                [alertView release];
            
            
            }
            
            
        }
        
    }if (request.tag == 9999) {

        NSLog(@" %@",[request responseString]);
        
        self.myshTwoArray = [RecomYanzhXml recommendYanzheng:[request responseString]];
        NSLog(@"  %d",[self.myshTwoArray count]);
        
        
        
        
    }if (request.tag == 1000) {
        
        NSLog(@" 审批人： post  is %@",[request responseString]);
        
        [self hellView];
      
        self.wwarray=[ShenPiRenXML recommendYanzheng:[request responseString]];
        
        
        NSLog(@"审批人 数组 %d",[self.wwarray count]);
        
        ShenPiRen * sren = [self.wwarray objectAtIndex:0];
        NSLog(@"%@",sren.mmResult);
        NSLog(@"%@",sren.mmOperate_id);
        NSLog(@"%@",sren.mmOperate_name);
        NSLog(@"%@",sren.mmSort_no);
        
        [tableView reloadData];
    
        
    }


}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    NSLog(@"error");
    start=NO;
    
    UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"网络链接超时!" message:@"提交申请失败!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
    [alertView show];
    [alertView release];

}


-(void)yuDtijiao:(UIButton * )button
{

    NSLog(@"tijiao");
    
    if (self.text != nil || self.text1 != nil || self.cText != nil || self.cText1 != nil || self.mtextViewStr != nil || self.shTag != nil) {
        
        [self httpXmlAsi];
        
    }else{
    
        UIAlertView *alertView=[[UIAlertView alloc] initWithTitle:@"请将信息填写完整!" message:@"提交申请失败!" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    
    
    
    }
    




}


-(void)httpXmly
{

   
    
    
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mDept_id = [defaults objectForKey:@"dept_ID"];
        NSString * mRole_id = [defaults objectForKey:@"role_ID"];
        NSString * mCompany = [defaults objectForKey:@"dcompany"];
        
        NSLog(@"mDept_id is  %@",mDept_id);
        NSLog(@"mRole_id  is %@",mRole_id);
        
        
        [activity startAnimating];
        

        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/apply_travel.php?Company_id=%@&Dept_id=%@&Role_id=%@",mCompany,mDept_id,mRole_id];

        NSLog(@" 二次上传 %@",strUrl);
        NSURL * url = [NSURL URLWithString:strUrl];

        yanRequset = [ASIHTTPRequest requestWithURL:url];
        [yanRequset setTag:9999];
        [yanRequset setDelegate:self];
        [yanRequset startAsynchronous];
    
        yanStart = YES;



 



}



-(void)myView
{
    
    NSDateFormatter * taFormater = [[[NSDateFormatter alloc] init] autorelease];
    NSDate * tadayDate =[NSDate date];
    [taFormater setDateFormat:@"yyyy-MM-dd"];
    NSString * taTime = [taFormater stringFromDate:tadayDate];
    NSLog(@"tadayDate %@",taTime);
    
    
    
    CGRect rect = self.view.bounds;

    labtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 25, 70, 30)];
    labtn.text = @"出差日期:";
    labtn.textAlignment = NSTextAlignmentLeft;
    labtn.font = [UIFont fontWithName:@"Arial" size:15 ];
    labtn.backgroundColor = [UIColor clearColor];
    [self.view addSubview:labtn];
    [labtn release];
    
    btnChuf = [UIButton buttonWithType:UIButtonTypeCustom];
    btnChuf.frame = CGRectMake(72, 25, 110, 30);
  
    [btnChuf setImage:[UIImage imageNamed:@"cc_01.png"] forState:UIControlStateNormal];
    [btnChuf addTarget:self action:@selector(btnChufa:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnChuf];
    
    
    
    chLabtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 30)];
    chLabtn.backgroundColor = [UIColor clearColor];
    chLabtn.textAlignment = NSTextAlignmentCenter;
    chLabtn.font = [UIFont fontWithName:@"Arial" size:15];
    chLabtn.text = taTime;
    [btnChuf addSubview:chLabtn];
    [chLabtn release];
    
    
    image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"01-055.png"]];
    image.frame =CGRectMake(185, 30, 24, 24);
    [self.view addSubview:image];
    [image release];
    
    btnHuil = [UIButton buttonWithType:UIButtonTypeCustom];
    btnHuil.frame = CGRectMake(210, 25, 110, 30);
 
    [btnHuil setImage:[UIImage imageNamed:@"cc_01.png"] forState:UIControlStateNormal];
    [btnHuil addTarget:self action:@selector(btnHuilai:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btnHuil];
    
   
    
    fanLabtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 110, 30)];
    fanLabtn.backgroundColor = [UIColor clearColor];
    fanLabtn.textAlignment = NSTextAlignmentCenter;
    fanLabtn.font = [UIFont fontWithName:@"Arial" size:15];
    fanLabtn.text = [self GetTomorrowDay:tadayDate withDay:1];
    [btnHuil addSubview:fanLabtn];
    [fanLabtn release];
    
    yRmbLa = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width - 280, 60, 80, 30)];
    yRmbLa.text = @"预计金额";
    yRmbLa.backgroundColor = [UIColor clearColor];
    yRmbLa.textAlignment = NSTextAlignmentCenter;
    yRmbLa.font = [UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:yRmbLa];
    [yRmbLa release];
    
    jRmbLa = [[UILabel alloc] initWithFrame:CGRectMake(rect.size.width/2 +40, 60, 80, 30)];
    jRmbLa.text = @"借款金额";
    jRmbLa.textAlignment = NSTextAlignmentCenter;
    jRmbLa.backgroundColor = [UIColor clearColor];
    jRmbLa.font = [UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:jRmbLa];
    [jRmbLa release];
    
    image7 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cc_03.png"]];
    image7.frame = CGRectMake(rect.size.width - 313, 93, 144, 34);
    [self.view addSubview:image7];
    [image7 release];
    
    yJrmbField = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width - 310, 95, 140, 30)];
    yJrmbField.placeholder = @"例如:2000";
    yJrmbField.borderStyle = UITextBorderStyleNone;
    yJrmbField.keyboardType = UIKeyboardTypeNamePhonePad;
    yJrmbField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    yJrmbField.returnKeyType = UIReturnKeyDone;
    yJrmbField.tag = 321;
    yJrmbField.delegate = self;
    [self.view addSubview:yJrmbField];
    [yJrmbField release];
    
    image8 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cc_03.png"]];
    image8.frame = CGRectMake(rect.size.width/2 +8, 93, 144, 34);
    [self.view addSubview:image8];
    [image8 release];
    
    jKrmbField = [[UITextField alloc] initWithFrame:CGRectMake(rect.size.width/2 +10, 95, 140, 30)];
    jKrmbField.placeholder = @"例如:2000";
    jKrmbField.borderStyle = UITextBorderStyleNone;
    jKrmbField.keyboardType = UIKeyboardTypeNamePhonePad;
    jKrmbField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    jKrmbField.returnKeyType = UIReturnKeyDone;
    jKrmbField.tag = 322;
    jKrmbField.delegate = self;
    [self.view addSubview:jKrmbField];
    [jKrmbField release];
    
    
    slabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 70, 30)];
    slabel.text =@"申请类型:";
    slabel.textAlignment = NSTextAlignmentLeft;
    slabel.backgroundColor = [UIColor clearColor];
    slabel.font = [UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:slabel];
    [slabel release];
    
    sqBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sqBtn.frame = CGRectMake(70, 130, 80, 30);
    [sqBtn setTitle:nil forState:UIControlStateNormal];
    [sqBtn setImage:[UIImage imageNamed:@"cc_04.png"] forState:UIControlStateNormal];
    [sqBtn addTarget:self action:@selector(shenqingBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sqBtn];
    
    sqLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 30)];
    sqLabel.text = @"选择类型";
    sqLabel.textAlignment = NSTextAlignmentCenter;
    sqLabel.backgroundColor = [UIColor clearColor];
    sqLabel.font = [UIFont fontWithName:@"Arial" size:15];
    [sqBtn addSubview:sqLabel];
    [sqLabel release];
    
    sslabel=[[UILabel alloc]initWithFrame:CGRectMake(160, 130, 80, 30)];
    sslabel.text=@"上级审批人:";
    sslabel.textAlignment=NSTextAlignmentLeft;
    sslabel.backgroundColor=[UIColor clearColor];
    sslabel.font=[UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:sslabel];
    [sslabel release];
    
    ssBtn =[UIButton buttonWithType:UIButtonTypeCustom];
    ssBtn.frame=CGRectMake(240, 130, 80, 30);
    [ssBtn setImage:[UIImage imageNamed:@"cc_04.png"] forState:UIControlStateNormal];
    [ssBtn addTarget:self action:@selector(xjsprBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ssBtn];
    
    sflabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 30)];
    sflabel.text=@"审批人";
    sflabel.textAlignment=NSTextAlignmentCenter;
    sflabel.backgroundColor=[UIColor clearColor];
    sflabel.font=[UIFont fontWithName:@"Arial" size:15];
    [ssBtn addSubview:sflabel];
    [sflabel release];
    
    
    cityLab1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 165, 100, 30)];
    cityLab1.text = @"出发地";
    cityLab1.textAlignment = NSTextAlignmentCenter;
    cityLab1.backgroundColor = [UIColor clearColor];
    cityLab1.font = [UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:cityLab1];
    [cityLab1 release];
    
    cityLab2 = [[UILabel alloc] initWithFrame:CGRectMake(200, 165, 100, 30)];
    cityLab2.text = @"到达地";
    cityLab2.textAlignment = NSTextAlignmentCenter;
    cityLab2.backgroundColor = [UIColor clearColor];
    cityLab2.font = [UIFont fontWithName:@"Arial" size:15];
    [self.view addSubview:cityLab2];
    [cityLab2 release];
    
    jiaoTgjbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    jiaoTgjbtn.frame = CGRectMake(rect.size.width/2 - 40, 190, 80, 30);
   
    [jiaoTgjbtn setImage:[UIImage imageNamed:@"cc_06.png"] forState:UIControlStateNormal];
    
    [jiaoTgjbtn addTarget:self action:@selector(jiaotong:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:jiaoTgjbtn];
    
    
    
    jiaoLab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
    jiaoLab.text = @"交通工具";
    jiaoLab.textAlignment = NSTextAlignmentCenter;
    jiaoLab.backgroundColor = [UIColor clearColor];
    jiaoLab.font = [UIFont fontWithName:@"Arial" size:15];
    [jiaoTgjbtn addSubview:jiaoLab];
    [jiaoLab release];
    
    
    image9 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cc_05.png"]];
    image9.frame = CGRectMake(3, 198, 114, 34);
    [self.view addSubview:image9];
    [image9 release];
    
    chuCityField = [[UITextField alloc] initWithFrame:CGRectMake(5, 200, 110, 30)];
    chuCityField.placeholder = @"请输入";
    chuCityField.borderStyle = UITextBorderStyleNone;
    chuCityField.keyboardType = UIKeyboardTypeNamePhonePad;
    chuCityField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    chuCityField.returnKeyType = UIReturnKeyDone;
    chuCityField.tag = 333;
    chuCityField.delegate = self;
    [self.view addSubview:chuCityField];
    [chuCityField release];
    
    image10 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cc_05.png"]];
    image10.frame = CGRectMake(203, 198, 114, 34);
    [self.view addSubview:image10];
    [image10 release];
    
    
    didaCityField = [[UITextField alloc] initWithFrame:CGRectMake(205, 200, 110, 30)];
    didaCityField.placeholder = @"请输入";
    didaCityField.borderStyle = UITextBorderStyleNone;
    didaCityField.keyboardType = UIKeyboardTypeNamePhonePad;
    didaCityField.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    didaCityField.returnKeyType = UIReturnKeyDone;
    didaCityField.tag = 344;
    didaCityField.delegate = self;
    [self.view addSubview:didaCityField];
    [didaCityField release];
    
    
    image6t = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"cc_08.png"]];
    image6t.frame = CGRectMake(3, 230, 316, 106);
    [self.view addSubview:image6t];
    [image6t release];
    
    myTextView = [[UITextView alloc] initWithFrame:CGRectMake(5, 233, 310, 100)];
    myTextView.font = [UIFont fontWithName:@"Arial" size:15];
    myTextView.keyboardType = UIKeyboardTypeNamePhonePad;
    myTextView.returnKeyType = UIReturnKeyDone;
    myTextView.tag = 400;
    myTextView.delegate = self;
    image6t.hidden=YES;
    [self.view addSubview:myTextView];
    [myTextView release];
    
    
    UIButton * tiJiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [tiJiaoBtn addTarget:self action:@selector(yuDtijiao:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiJiaoBtn];
    
    if (self.view.bounds.size.height >460.0f) {
        
        tiJiaoBtn.frame = CGRectMake(rect.size.width/2 - 40, 385, 80, 30);
        
       // [tiJiaoBtn setTitle:nil forState:UIControlStateNormal];
        
        [tiJiaoBtn setImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
        

        
        
        
    }else{
        
        
        tiJiaoBtn.frame = CGRectMake(rect.size.width/2 - 40, 335, 80, 30);
     
        
        [tiJiaoBtn setImage:[UIImage imageNamed:@"弹窗-确定机票.png"] forState:UIControlStateNormal];
        

        
        
        
    }
    
    
}

-(void)textViewDidBeginEditing:(UITextView *)textView
{
    
    CGRect rect = self.view.bounds;
    
    labtn.frame = CGRectMake(0, -295, 80, 30);
    btnChuf.frame = CGRectMake(72, -295, 110, 30);
    image.frame =CGRectMake(185, -290, 24, 24);
    btnHuil.frame = CGRectMake(210, -295, 110, 30);
    yRmbLa.frame = CGRectMake(rect.size.width - 280, -260, 80, 30);
    jRmbLa.frame = CGRectMake(rect.size.width/2 +40, -260, 80, 30);
    yJrmbField.frame = CGRectMake(rect.size.width - 310, -245, 140, 30);
    jKrmbField.frame = CGRectMake(rect.size.width/2 +10, -245, 140, 30);
    slabel.frame = CGRectMake(0, -190, 100, 30);
    sqBtn.frame = CGRectMake(70, -190, 80, 30);
    ssBtn.frame = CGRectMake(240, -190, 80, 30);
    sslabel.frame = CGRectMake(160, -190, 80, 30);
    cityLab1.frame =CGRectMake(10, -155, 100, 30);
    cityLab2.frame = CGRectMake(200, -155, 100, 30);
    chuCityField.frame = CGRectMake(5, -120, 110, 30);
    didaCityField.frame =CGRectMake(205, -120, 110, 30);
    jiaoTgjbtn.frame = CGRectMake(rect.size.width/2 - 40, -40, 80, 30);
    myTextView.frame = CGRectMake(5, 10, 310, 145);
    image7.frame = CGRectMake(rect.size.width - 313, -247, 144, 34);
    image8.frame = CGRectMake(rect.size.width/2 +8, -247, 144, 34);
    image9.frame = CGRectMake(3, -124, 114, 34);
    image10.frame = CGRectMake(203, -124, 114, 34);
}

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    CGRect rect = self.view.bounds;

    
   
    if ([text isEqualToString:@"\n"]) {
        [myTextView resignFirstResponder];
        
        
        self.mtextViewStr = myTextView.text;
        NSLog(@"textView %@",self.mtextViewStr);
        
        labtn.frame = CGRectMake(0, 25, 80, 30);
        btnChuf.frame = CGRectMake(72, 25, 110, 30);
        image.frame =CGRectMake(185, 30, 24, 24);
        btnHuil.frame = CGRectMake(210, 25, 110, 30);
        yRmbLa.frame = CGRectMake(rect.size.width - 280, 60, 80, 30);
        jRmbLa.frame = CGRectMake(rect.size.width/2 +40, 60, 80, 30);
        yJrmbField.frame = CGRectMake(rect.size.width - 310, 95, 140, 30);
        jKrmbField.frame = CGRectMake(rect.size.width/2 +10, 95, 140, 30);
        slabel.frame = CGRectMake(0, 130, 100, 30);
        sqBtn.frame = CGRectMake(70, 130, 80, 30);//
        ssBtn.frame = CGRectMake(240, 130, 80, 30);//
        cityLab1.frame =CGRectMake(10, 165, 100, 30);
        cityLab2.frame = CGRectMake(200, 165, 100, 30);
        chuCityField.frame = CGRectMake(5, 200, 110, 30);
        didaCityField.frame =CGRectMake(205, 200, 110, 30);
        jiaoTgjbtn.frame = CGRectMake(rect.size.width/2 - 40, 190, 80, 30);
        myTextView.frame = CGRectMake(5, 235, 310, 100);
        image7.frame = CGRectMake(rect.size.width - 313, 93, 144, 34);
        image8.frame = CGRectMake(rect.size.width/2 +8, 93, 144, 34);
        image9.frame = CGRectMake(3, 198, 114, 34);
        image10.frame = CGRectMake(203, 198, 114, 34);
        sslabel.frame = CGRectMake(160, 130, 80, 30);
    }
    

    return YES;
}


-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    NSLog(@"键盘启动");
    
    
      CGRect rect = self.view.bounds;
    if (textField.tag == 333 || textField.tag == 344) {
        labtn.frame = CGRectMake(0, -30, 80, 30);
        btnChuf.frame = CGRectMake(72, -30, 110, 30);
        image.frame =CGRectMake(185, -30, 24, 24);
        btnHuil.frame = CGRectMake(210, -30, 110, 30);
        yRmbLa.frame = CGRectMake(rect.size.width - 280, -60, 80, 30);
        jRmbLa.frame = CGRectMake(rect.size.width/2 +40, -60, 80, 30);
        yJrmbField.frame = CGRectMake(rect.size.width - 310, -30, 140, 30);
        jKrmbField.frame = CGRectMake(rect.size.width/2 +10, -30, 140, 30);
        slabel.frame = CGRectMake(0, 30, 100, 30);
        sqBtn.frame = CGRectMake(70, 30, 80, 30);
        ssBtn.frame = CGRectMake(240, 30, 80, 30);
        sslabel.frame = CGRectMake(160, 30, 80, 30);
        cityLab1.frame =CGRectMake(10, 65, 100, 30);
        cityLab2.frame = CGRectMake(200, 65, 100, 30);
        chuCityField.frame = CGRectMake(5, 100, 110, 30);
        didaCityField.frame =CGRectMake(205, 100, 110, 30);
        jiaoTgjbtn.frame = CGRectMake(rect.size.width/2 - 40, 90, 80, 30);
        image7.frame = CGRectMake(rect.size.width - 313, -34, 144, 34);
        image8.frame = CGRectMake(rect.size.width/2 +8, -34, 144, 34);
        image9.frame = CGRectMake(3, 98, 114, 34);
        image10.frame = CGRectMake(203, 98, 114, 34);
        
        
    }
    
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    CGRect rect = self.view.bounds;
    if (textField.tag == 321) {
        self.text = [NSString stringWithFormat:@"%@",textField.text];
        self.text1 = [NSString stringWithFormat:@"%@",jKrmbField.text];
        NSLog(@"输入记录:%@",text);
        NSLog(@"输入记录:%@",text1);
       
        
        
        
        [yJrmbField resignFirstResponder];
        [jKrmbField resignFirstResponder];
        
        
    }else if (textField.tag == 322){
        self.text = [NSString stringWithFormat:@"%@",yJrmbField.text];
        self.text1 = [NSString stringWithFormat:@"%@",jKrmbField.text];
        
        
        [yJrmbField resignFirstResponder];
        [jKrmbField resignFirstResponder];
        
        
    }else if (textField.tag == 333 || textField.tag == 344){
        
        self.cText = [NSString stringWithFormat:@"%@",chuCityField.text];
        self.cText1 = [NSString stringWithFormat:@"%@",didaCityField.text];
        
        labtn.frame = CGRectMake(0, 25, 80, 30);
        btnChuf.frame = CGRectMake(72, 25, 110, 30);
        image.frame =CGRectMake(185, 30, 24, 24);
        btnHuil.frame = CGRectMake(210, 25, 110, 30);
        yRmbLa.frame = CGRectMake(rect.size.width - 280, 60, 80, 30);
        jRmbLa.frame = CGRectMake(rect.size.width/2 +40, 60, 80, 30);
        yJrmbField.frame = CGRectMake(rect.size.width - 310, 95, 140, 30);
        jKrmbField.frame = CGRectMake(rect.size.width/2 +10, 95, 140, 30);
        slabel.frame = CGRectMake(0, 130, 80, 30);
        sqBtn.frame = CGRectMake(70, 130, 80, 30);
        ssBtn.frame = CGRectMake(240, 130, 80, 30);
        sslabel.frame = CGRectMake(160, 130, 80, 30);
        cityLab1.frame =CGRectMake(10, 165, 100, 30);
        cityLab2.frame = CGRectMake(200, 165, 100, 30);
        chuCityField.frame = CGRectMake(5, 200, 110, 30);
        didaCityField.frame =CGRectMake(205, 200, 110, 30);
        jiaoTgjbtn.frame = CGRectMake(rect.size.width/2 - 40, 190, 80, 30);
        image7.frame = CGRectMake(rect.size.width - 313, 93, 144, 34);
        image8.frame = CGRectMake(rect.size.width/2 +8, 93, 144, 34);
        image9.frame = CGRectMake(3, 198, 114, 34);
        image10.frame = CGRectMake(203, 198, 114, 34);
        
        [chuCityField resignFirstResponder];
        [didaCityField resignFirstResponder];
    
        
        
        NSLog(@"输入记录:%@",cText);
        NSLog(@"输入记录:%@",cText1);
        
    }    
    
    return YES;
    
    
}

-(void) changeColor:(NSNotification *) notify {
    
    NSDictionary *dict = [notify userInfo];
    
    
    NSString *mThem = [dict objectForKey:@"ThemeName"];
    NSLog(@"sh themeName  is  %@",mThem);
    
    
    
    
}
-(void)dealloc
{
    
    [tableView release];

    [super dealloc];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    NSLog(@" %d",[self.myShArray count]);
    NSLog(@"two %d",[self.myshTwoArray count]);
    self.view.backgroundColor = [UIColor whiteColor];
    myshTwoArray = [[NSMutableArray alloc] initWithCapacity:0];
    myXmlArray = [[NSMutableArray alloc] initWithCapacity:0];
    

    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 50, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem * barBtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    self.navigationItem.leftBarButtonItem = barBtn;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeColor:) name:@"ChangeTheme" object:nil];
    
    UIImageView * imageView = [[[UIImageView alloc] init] autorelease];
    imageView.frame = self.view.bounds;
    imageView.image = [UIImage imageNamed:@"登录背景.png"];
    [self.view addSubview:imageView];
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 220)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    [self httpXmly];
    [self myView];
    [self leixing];
    [self jiaoViewContro];
}

-(void)hellView
{
    
    if (self.view.bounds.size.height > 460.0f) {
        
        qview.hidden=YES;
        
        qview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320,768)];
        [self.view addSubview:qview];
        qview.backgroundColor=[UIColor whiteColor];
        
    
        
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 320, 416) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableView.delegate = self;
        tableView.dataSource = self;
        [qview addSubview:tableView];
    
    }else{
        qview.hidden=YES;
        
        qview=[[UIView alloc]initWithFrame:CGRectMake(30, 125, 210,105)];
        [self.view addSubview:qview];
        qview.backgroundColor=[UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
        
   
        tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, 210, 105) style:UITableViewStylePlain];
        tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        tableView.backgroundColor = [UIColor colorWithRed:168/255.0 green:217/255.0 blue:226/255.0 alpha:1.0];
        tableView.delegate = self;
        tableView.dataSource = self;
        [qview addSubview:tableView];

        
        
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [wwarray count] ;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 30.0f;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSLog(@"123");
    
    qview.hidden= YES;
    
       
    if ([self.wwarray count] >= indexPath.row) {
        
        ShenPiRen * sren = [self.wwarray objectAtIndex:indexPath.row];
        NSLog(@"cell %@",sren.mmOperate_name);
        sflabel.text=[NSString stringWithFormat:@"%@",sren.mmOperate_name];

        
    }
    
   
    

}


-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * cellID = [NSString stringWithFormat:@"id%d%d",indexPath.section,indexPath.row];
    UITableViewCell * cell = [[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID]autorelease];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
        
       
    }
   // cell.contentView.backgroundColor =[UIColor greenColor];
    if (self.wwarray.count != 0) {
        ShenPiRen * sren = [self.wwarray objectAtIndex:0];
        // cell.backgroundColor=[UIColor greenColor];
        lab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 210, 30)];
        lab.text=[NSString stringWithFormat:@"%@",sren.mmOperate_name];
        lab.font=[UIFont fontWithName:@"Arial" size:17];
        lab.backgroundColor = [UIColor clearColor];
        lab.textAlignment = NSTextAlignmentCenter;
        [cell.contentView addSubview:lab];
    }
    
    
    return cell;

}


-(void)xjsprBtn:(id)sender
{
    NSLog(@"选择审批人");
    
    //[self hellView];

    qview.hidden=YES;
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSString * company = [defaults objectForKey:@"dcompany"];
    NSString * dept_id = [defaults objectForKey:@"dept_ID"];
    
    NSLog(@"mResurl is %@",company);
    NSLog(@"mUser_ID is %@",dept_id);
    
    NSString *strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/apply_travel.php?Company_id=%@&Dept_id=%@",company,dept_id];
    
    NSLog(@"******* is %@",strUrl);
    
    NSURL * url=[NSURL URLWithString:strUrl];
    
    yy_request = [ASIHTTPRequest requestWithURL:url];
    [yy_request setTag:1000];
    [yy_request setTimeOutSeconds:100];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    start = YES;

    
}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
