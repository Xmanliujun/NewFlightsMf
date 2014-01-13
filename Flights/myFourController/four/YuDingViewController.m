//
//  YuDingViewController.m
//  jiudian
//
//  Created by XmL on 12-10-30.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "YuDingViewController.h"
#import "TimesView.h"
#import "ASIFormDataRequest.h"
#import "ASIHTTPRequest.h"
#import "RecommendYDXml.h"
#import "WinViewController.h"
#import "YuDingXml.h"
#import "DengLuXML.h"



@interface YuDingViewController ()
@property (nonatomic, retain) UIImageView* checkImgView;
@property NSUInteger defaultSelectionRow;
@property NSUInteger defaultSelectionSection;
@end


//static NSString * kError = @"Errors";


@implementation YuDingViewController

@synthesize cities, keys, checkImgView, curSection, curRow,array,zArray,laArray,schoolArray,dengArray,gstrat;

@synthesize defaultSelectionRow, defaultSelectionSection,taga,httpYu;

@synthesize hotelCode,hotelName,startDate,endDate,ratePlanCode,roomTypeName,amountPrice,roomTypeCode,vendorCode,vendorName,cSanZim,phone,renMing,roomName,hotelEnName,roomTypeDesc,string21,string22,text,text1,myMuch,intStr,payMent;

@synthesize workingString,elementArray,storingCharacterData,dataToParse,trackingCategoryName,trackingReleaseDate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithTag:(NSString *)tag WithArray:(NSMutableArray *)ary
{
    if (self = [super init]) {
        taga = [NSString stringWithString:tag];
        self.dengArray = [NSMutableArray arrayWithArray:ary];
    }


    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 123) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else if (alertView.tag == 234){
        
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else if (alertView.tag == 345){
    
        self.text = nil;
        self.text1 = nil;
    }
	
    
    
}






-(void)tijiaoYDing:(UIButton *)button
{

   
    renMing.text =@"";
    phone.text = @"";

    
    if (self.text.length != 0 && ![self.text isEqualToString:@"(null)"] && ![self.text1 isEqualToString:@"(null)"]  &&self.string21!=nil && self.text1.length!= 0) {
      [activity startAnimating];
        [self httpAsi];
    }else {
    
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"预定信息有误！"
                                                         message:@"请核实个人信息！"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        
        alertView.tag = 345;
        [alertView show];
        [alertView release];
        renMing.tag = 222;
        phone.tag = 333;

    
    
    }

   
    
}

-(void)btnOne:(UIButton *)button
{
    
    double mouch =  [self.amountPrice intValue];
    double mouchTwo;
    if (button.tag == 1) {
        UIAlertView* alertView=[[UIAlertView alloc]
                                initWithTitle:@"房间数最少为1"
                                message:nil
                                delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
        
    }else if (button.tag == 10){
        mouchTwo = 9 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 9;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    }else if (button.tag == 9){
        mouchTwo = 8 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 8;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
    
    }else if (button.tag == 8){
        mouchTwo = 7 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 7;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 7){
        mouchTwo = 6 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 6;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 6){
        mouchTwo = 5 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 5;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 5){
        mouchTwo = 4 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 4;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 4){
        mouchTwo = 3 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 3;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 3){
        mouchTwo = 2 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 2;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    }else if (button.tag == 2){
        mouchTwo = 1 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 1;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

    
    
    }
    
}

-(void)btnAdd:(UIButton *)button
{
    double mouch =  [self.amountPrice intValue];
    double mouchTwo;
    
   
  
    if (button.tag == 1) {
        mouchTwo = 2 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 2;
         self.intStr = [NSString stringWithFormat:@"%d",i];
         labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
        
    }else if (button.tag == 2){
        mouchTwo = 3 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 3;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
        
    }else if (button.tag == 3){
        mouchTwo = 4 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 4;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

       
    }else if (button.tag == 4){
        mouchTwo = 5 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 5;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
        
    
    }else if (button.tag == 5){
        mouchTwo = 6 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 6;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

        
    }else if (button.tag == 6){
        mouchTwo = 7 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 7;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
        
    
    }else if (button.tag == 7){
        mouchTwo = 8 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 8;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

        
    }else if (button.tag == 8){
        mouchTwo = 9 * mouch;
        self.myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 9;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;

        
    }else if (button.tag == 9){
        mouchTwo = 10 * mouch;
       self. myMuch = [NSString stringWithFormat:@"%.1f",mouchTwo];
        i = 10;
        self.intStr = [NSString stringWithFormat:@"%d",i];
        labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
        btnone.tag = i;
        btnAdd.tag = i;
    
    }else if (button.tag == 10){
        UIAlertView* alertView=[[UIAlertView alloc]
                                initWithTitle:@"房间数最多为10"
                                message:nil
                                delegate:self
                                cancelButtonTitle:nil
                                otherButtonTitles:@"确定", nil];
        [alertView show];
        [alertView release];
    
    
    }

}

-(void)newView
{
   
    oneView = [[[UIView alloc] initWithFrame:CGRectMake(10,50 , 300, 120)] autorelease];
    oneView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
   
    [self.view addSubview:oneView];
   
    
    UILabel * oneLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 150, 30)];
    oneLa.textAlignment = NSTextAlignmentLeft;
    oneLa.font = [UIFont fontWithName:@"Arial" size:18];
    oneLa.text = self.roomName;
    oneLa.backgroundColor = [UIColor clearColor];
    [oneView addSubview:oneLa];
    [oneLa release];
    
    i = 1;
    btnone = [UIButton buttonWithType:UIButtonTypeCustom];
    btnone.frame = CGRectMake(140, 18, 25, 25);
    btnone.tag = i;
    [btnone setImage:[UIImage imageNamed:@"减号.png"] forState:UIControlStateNormal];
    [btnone addTarget:self action:@selector(btnOne:) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:btnone];
    
    btnAdd = [UIButton buttonWithType:UIButtonTypeCustom];
    btnAdd.frame = CGRectMake(275, 18, 25, 25);
    btnAdd.tag = i;
    [btnAdd setImage:[UIImage imageNamed:@"加号.png"] forState:UIControlStateNormal];
    [btnAdd addTarget:self action:@selector(btnAdd:) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:btnAdd];
    

    
    self.intStr = [NSString stringWithFormat:@"%d",i];
    float sss= [self.amountPrice  intValue];
    self.myMuch = [NSString stringWithFormat:@"%.1f",sss];
  
    labtn = [[UILabel alloc] initWithFrame:CGRectMake(150, 10, 130, 40)];
    labtn.textAlignment = NSTextAlignmentCenter;
    labtn.text = [NSString stringWithFormat:@"%@间(￥%@)",self.intStr,self.myMuch];
    labtn.backgroundColor = [UIColor clearColor];
    labtn.font = [UIFont fontWithName:@"Arial" size:15];
    [oneView addSubview:labtn];
    [labtn release];
    
    
    UILabel * twoLa = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 150, 30)];
    twoLa.textAlignment = NSTextAlignmentLeft;
    twoLa.font = [UIFont fontWithName:@"Arial" size:18];
    twoLa.text = @"房间保留时间:";
    twoLa.backgroundColor = [UIColor clearColor];
    [oneView addSubview:twoLa];
    [twoLa release];
    
    UIButton * btntwo = [UIButton buttonWithType:UIButtonTypeCustom];
    btntwo.frame = CGRectMake(150, 60, 160, 40);
    [btntwo setTitle:nil forState:UIControlStateNormal];
    [btntwo addTarget:self action:@selector(btntwo:) forControlEvents:UIControlEventTouchUpInside];
    [oneView addSubview:btntwo];
    
    lattbtn = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 120, 40)];
    lattbtn.textAlignment = NSTextAlignmentLeft;
    lattbtn.text = @"请输入预留时间";
    lattbtn.backgroundColor = [UIColor clearColor];
    lattbtn.font = [UIFont fontWithName:@"Arial" size:15];
    [btntwo addSubview:lattbtn];
    [lattbtn release];
    
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(280, 75, 10, 10)];
    image.image = [UIImage imageNamed:@"01-055.png"];
    [oneView addSubview:image];
    [image release];
    
    
    twoView = [[[UIView alloc] initWithFrame:CGRectMake(10, 200, 300, 120)] autorelease];
    twoView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1.0];
    [self.view addSubview:twoView];
    
    
   
    
    UILabel * latwo = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 80, 30)];
    latwo.textAlignment = NSTextAlignmentLeft;
    latwo.font = [UIFont fontWithName:@"Arial" size:18];
    latwo.backgroundColor = [UIColor clearColor];
    latwo.text = @"入住人:";
    [twoView addSubview:latwo];
    [latwo release];
    
    UILabel * labtw = [[UILabel alloc] initWithFrame:CGRectMake(10, 65, 80, 30)];
    labtw.textAlignment = NSTextAlignmentLeft;
    labtw.font = [UIFont fontWithName:@"Arial" size:18];
    labtw.backgroundColor = [UIColor clearColor];
    labtw.text = @"手机号:";
    [twoView addSubview:labtw];
    [labtw release];

    renMing = [[[UITextField alloc] initWithFrame:CGRectMake(90, 15, 180,30)] autorelease];
    renMing.placeholder = @"请输入姓名！";
    renMing.borderStyle = UITextBorderStyleRoundedRect;
    renMing.contentVerticalAlignment = UIControlContentHorizontalAlignmentLeft;
    renMing.keyboardType = UIKeyboardTypeNamePhonePad;
    
    renMing.returnKeyType = UIReturnKeyDone;
    
    renMing.tag = 222;
    renMing.delegate = self;
    [twoView addSubview:renMing];
   
    
    phone = [[[UITextField alloc] initWithFrame:CGRectMake(90, 70, 180, 30)] autorelease];
    phone.placeholder = @"用于接收通知短信";
    phone.borderStyle = UITextBorderStyleRoundedRect;
    phone.contentVerticalAlignment = UIControlContentHorizontalAlignmentLeft;
    phone.keyboardType = UIKeyboardTypeNamePhonePad;
    phone.returnKeyType = UIReturnKeyDone;
    phone.tag = 333;
    phone.delegate = self;
    [twoView addSubview:phone];
    
    UIButton * tiJiaoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    tiJiaoBtn.frame = CGRectMake(100, 340, 120, 40);
    [tiJiaoBtn setImage:[UIImage imageNamed:@"提交订单.png"] forState:UIControlStateNormal];
    [tiJiaoBtn addTarget:self action:@selector(tijiaoYDing:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:tiJiaoBtn];
    
    

}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    
    
    if (textField.tag == 222) {
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.6f];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        oneView.frame = CGRectMake(10, -200, 300, 120);
        twoView.frame = CGRectMake(10, 50, 300, 120);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
    }else if (textField.tag == 333){
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.6f];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        oneView.frame = CGRectMake(10, -200, 300, 120);
        twoView.frame = CGRectMake(10, 50, 300, 120);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
    }
    


}

-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 222) {
        self.text = [NSString stringWithFormat:@"%@",textField.text];
        self.text1 = [NSString stringWithFormat:@"%@",phone.text];
        NSLog(@"输入记录:%@",text);
        NSLog(@"输入记录:%@",text1);
        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.6f];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        oneView.frame = CGRectMake(10, 70, 300, 120);
        twoView.frame = CGRectMake(10, 200, 300, 120);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        [renMing resignFirstResponder];
        [phone resignFirstResponder];

    }else if (textField.tag == 333){
         self.text = [NSString stringWithFormat:@"%@",renMing.text];
        self.text1 = [NSString stringWithFormat:@"%@",phone.text];
        NSLog(@"输入记录:%@",text);
        NSLog(@"输入记录:%@",text1);

        CGContextRef context = UIGraphicsGetCurrentContext();
        [UIView beginAnimations:nil context:context];
        [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
        [UIView setAnimationDuration:0.6f];
        [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
        oneView.frame = CGRectMake(10, 70, 300, 120);
        twoView.frame = CGRectMake(10, 200, 300, 120);
        [UIView setAnimationDelegate:self];
        [UIView commitAnimations];
        [phone resignFirstResponder];
        [renMing resignFirstResponder];
    
    }
    
    return YES;


}
-(void)btnFanHui:(UIButton *)button
{
    if (httpYu == YES) {
        [formDataRequest clearDelegatesAndCancel];
         [self dismissViewControllerAnimated:YES completion:NULL];        
    }if (gstrat == YES) {
        [mget11Request clearDelegatesAndCancel];
         [self dismissViewControllerAnimated:YES completion:NULL];
        
    }else{
        
         [self dismissViewControllerAnimated:YES completion:NULL];
        
        
    }



}
-(void)btntwo:(UIButton *)button
{
    
    NSLog(@"twoButton");
    times.hidden = NO;
    
}


-(void)guanBi:(UIButton *)button
{

    times.hidden = YES;


}

-(void)httpG11next
{
    if ([self.schoolArray count] != 0) {
        
        YuDingXml * yuXmlaa = [self.schoolArray objectAtIndex:0];
               
        
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        
        NSString * mName = [defaults objectForKey:@"name"];
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept_show/create_hotel.php?Order_resid=%@&Order_vendorresid=%@&Order_people=%@&Order_number=%@&Order_sdate=%@&Order_edate=%@&Order_scity=%@&Order_jpice=%@&Order_total=%@&Order_hotelname=%@&Order_username=%@&Realname=%@&Telphone=%@&Address=%@&Order_type=1",yuXmlaa.ResOrderID,yuXmlaa.ResOrderID,yuXmlaa.PersonName,yuXmlaa.Quantity,yuXmlaa.StartDate,yuXmlaa.EndDate,yuXmlaa.cityName,self.amountPrice,yuXmlaa.TotalAmount,yuXmlaa.HotelName,mName,yuXmlaa.PersonName,yuXmlaa.Mobile,yuXmlaa.Address,nil];
        
        
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        NSLog(@" strurl  is %@ ",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        mget11Request = [ASIHTTPRequest requestWithURL:url];
        [mget11Request setTag:1200];
        [mget11Request setDelegate:self];
        [mget11Request startAsynchronous];
        gstrat = YES;
        
    }else {
        [activity stopAnimating];
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"房间已满！"
                                                         message:@"请重新预定！"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        
        alertView.tag = 234;
        [alertView show];
        [alertView release];
        
        
    }

    
}



- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    if (request.tag==1001) {
        
        NSData * responData = [request responseData];
        
        NSString *stringxx = [[NSString alloc] initWithData:responData encoding:NSUTF8StringEncoding];
        NSLog(@"%@",stringxx);
       
        self.schoolArray = [RecommendYDXml recommendedParser:stringxx];
        
        [stringxx release];
        
        httpYu = NO;
        
        
        
        
        [self httpG11next];
        
        
        
        
    }if (request.tag == 1200) {
        NSLog(@"g11 申请成功 %@",[request responseString]);
        gstrat = NO;
        NSData * responData = [request responseData];
        
        NSString *stringxx = [[[NSString alloc] initWithData:responData encoding:NSUTF8StringEncoding] autorelease];
        NSLog(@"%@",stringxx);
        
        
        [activity stopAnimating];
        
        if ([taga isEqualToString:@"chGui"]&& [self.schoolArray count] > 0) {
            WinViewController * win = [[[WinViewController alloc] initWithArray:self.schoolArray withTag:@"changGui"] autorelease];
            
            UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:win] autorelease];
            win.roomNum = self.intStr;
            win.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:nav animated:YES completion:NULL];
            self.text1 = nil;
            self.text = nil;
            
        }else if ([taga isEqualToString:@"zhBian"] && [self.schoolArray count] > 0){
            WinViewController * wina = [[[WinViewController alloc] initWithArray:self.schoolArray withTag:@"zhouBian"] autorelease];
            UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:wina] autorelease];
            wina.roomNum = self.intStr;

            wina.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
            [self presentViewController:nav animated:YES completion:NULL];
            self.text1 = nil;
            self.text = nil;
        }else {
            [activity stopAnimating];
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"房间已满！"
                                                             message:@"请重新预定！"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            
            alertView.tag = 234;
            [alertView show];
            [alertView release];
 
        
        }

   
    }
    
       
    
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    gstrat = NO;
    httpYu = NO;
    NSError * error = [request error];
    NSLog(@"request error is %@",error);
       [activity stopAnimating];
       
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时！"
                                                     message:@"请重新预定！"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    
    alertView.tag = 234;
    [alertView show];
    [alertView release];
    
    
    
}


-(void)httpAsi
{
    
    
  
    
    if(self.text.length != 0 && ![self.text1 isEqualToString:@"(null)"] &&self.string21!=nil){
    
        NSString * stringAsi = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/booking_order_iphone?HotelId=%@&RoomTypeId=%@&RatePlanID=%@&RoomAmount=%@&TotalPrice=%@&UserName=%@&Mobile=%@&AllowTime=%@ %@&HotelName=%@&HotelAddress=%@&RoomType=%@&PlanName=%@&ArriveTime=%@",self.hotelCode,self.roomTypeCode,self.ratePlanCode,self.intStr,self.myMuch,self.text,self.text1,self.startDate,self.string21,self.hotelName,self.hotelEnName,self.roomName,self.payMent,self.string21,nil];
        
        NSLog(@"string  %@",stringAsi);
        
        
    
        stringAsi = [stringAsi stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
    NSURL * url = [NSURL URLWithString:stringAsi];
    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1001];
    [formDataRequest setTimeOutSeconds:20];
    [formDataRequest setPostValue:stringAsi forKey:@"request"];
    [formDataRequest setDelegate:self];
    [formDataRequest startAsynchronous];
    
    httpYu = YES;
        
              
        
    }
    else {

        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"预定信息有误！"
                                                         message:@"请核实个人信息！"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        
        alertView.tag = 345;
        [alertView show];
        [alertView release];



    }   
    

}






- (void)viewDidLoad
{
    [super viewDidLoad];
    
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000

    schoolArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    NSLog(@"hotelCode is%@",self.hotelCode);
    NSLog(@"roomtypeCode is %@",self.roomTypeCode);
    NSLog(@"ratePlanCode is%@",self.ratePlanCode);
    NSLog(@"startDate is%@",self.startDate);
    NSLog(@"hotelEnName is%@",self.hotelEnName);
    NSLog(@"RoomType is%@",self.roomName);
    NSLog(@"Payment is%@",self.payMent);
    NSLog(@"hotelName is %@",self.hotelName);
    NSLog(@"tol is %@",self.amountPrice);
	// Do any additional setup after loading the view.
    NSLog(@" %d",[self.dengArray count]);

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 35, 30);
    [btn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkbtn = [[[UIBarButtonItem alloc] initWithCustomView:btn] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkbtn;
    
  
    UIImageView * imagevi = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"通栏背景.png"]];
    imagevi.frame = CGRectMake(0, 0, 320, 40);
    
    UILabel * la = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 160, 20)];
    la.textAlignment = NSTextAlignmentCenter;
    la.backgroundColor = [UIColor clearColor];
    la.font = [UIFont fontWithName:@"Arial" size:15];
    la.text = [NSString stringWithFormat:@"入住时间:%@",startDate];
    la.textColor = [UIColor whiteColor];
    [imagevi addSubview:la];
    [la release];
    UILabel * latwo = [[UILabel alloc] initWithFrame:CGRectMake(160, 10, 160, 20)];
    latwo.textAlignment = NSTextAlignmentCenter;
    latwo.textColor = [UIColor whiteColor];
    latwo.backgroundColor = [UIColor clearColor];
    latwo.font = [UIFont fontWithName:@"Arial" size:15];
    latwo.text = [NSString stringWithFormat:@"离店时间:%@",endDate];
    [imagevi addSubview:latwo];
    [latwo release];
    
    [self.view addSubview:imagevi];
    [imagevi release];



    
    
    [self newView];
    
    times = [[TimesView alloc] initWithFrame:CGRectMake(60, 140, 200, 240)];
    times.backgroundColor = [UIColor whiteColor];
    times.hidden = YES;
    [self.view addSubview:times];
    [times release];
   
    
    
    
    
    UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 200, 240)];
    sxImage.image = [UIImage imageNamed:@"弹窗背景a.png"];
    [times addSubview:sxImage];
    [sxImage release];
    
    
    UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imgeBtn.frame = CGRectMake(160, 2, 25, 25);
    imgeBtn.tag = 32;
    [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭.png"] forState:UIControlStateNormal];
    [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
    [times addSubview:imgeBtn];


    
    
    myTableView = [[UITableView alloc] initWithFrame:CGRectMake(4, 27, 194, 209) style:UITableViewStyleGrouped];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    
    [times addSubview:myTableView];
    [myTableView release];
    
    array = [[NSArray alloc] initWithObjects:@"12:00",@"13:00",@"14:00",@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00", nil];
    zArray = [[NSArray alloc] initWithObjects:@"15:00",@"16:00",@"17:00",@"18:00",@"19:00",@"20:00",@"21:00",@"22:00",@"23:00",@"23:59",@"06:00", nil];
    
    laArray = [[NSArray alloc] initWithObjects:@"12:00-15:00",@"13:00-16:00",@"14:00-17:00",@"15:00-18:00",@"16:00-19:00",@"17:00-20:00",@"18:00-21:00",@"19:00-22:00",@"20:00-23:00",@"21:00-23:59",@"22:00-次日6:00", nil];
    
    
    
    
    checkImgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"check"]];
    checkImgView.tag = 1111;
    
    NSString *path=[[NSBundle mainBundle] pathForResource:@"time"
                                                   ofType:@"plist"];
    self.cities = [[[NSDictionary alloc]
                   initWithContentsOfFile:path] autorelease];
    
    self.keys = [[cities allKeys] sortedArrayUsingSelector:
                 @selector(compare:)];
    NSLog(@"keys %d",[keys count]);
    NSLog(@"nochser  %d",self.curSection);
    NSLog(@"%d",self.curRow);

    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
    [myTableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionMiddle animated:YES];
    
    
    
    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 220)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];

    
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * CellID = @"timesView";
     NSString *key = [keys objectAtIndex:indexPath.section];
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
        
        
    }
    
    
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.text = [[cities objectForKey:key] objectAtIndex:indexPath.row];
    
    if (indexPath.section == curSection && indexPath.row == curRow)
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    else
        cell.accessoryType = UITableViewCellAccessoryNone;
    return cell;
    
}
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return keys;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSString *key = [keys objectAtIndex:section];
    return key;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return [keys count];
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSIndexPath *prevIndexPath = [NSIndexPath indexPathForRow:curRow inSection:curSection];
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:prevIndexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    
    self.curSection = indexPath.section;
    self.curRow = indexPath.row;
    NSLog(@"section  row  %d%d",curSection,curRow);
    
    cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    string21 = [array objectAtIndex:indexPath.row];
    string22 = [zArray objectAtIndex:indexPath.row];
    
    lattbtn.text = [NSString stringWithFormat:@"%@",[laArray objectAtIndex:indexPath.row]];
    
    NSLog(@"%@",string21);
    NSLog(@"%@",string22);
  
    
    
    
    
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    NSString *key = [keys objectAtIndex:section];
    NSArray *citySection = [cities objectForKey:key];
    return [citySection count];


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 30;
}
-(void)dealloc
{

    
    
    [checkImgView release];
    [cities release];
    [keys release];

    
    [super dealloc];

}
UIBackgroundTaskIdentifier backgroundTask;

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    if (([[[UIDevice currentDevice] systemVersion] floatValue] >= 6.0))
    {
        // Acquired additional time
        UIDevice *device = [UIDevice currentDevice];
        BOOL backgroundSupported = NO;
        if ([device respondsToSelector:@selector(isMultitaskingSupported)])
        {
            backgroundSupported = device.multitaskingSupported;
        }
        if (backgroundSupported)
        {
            backgroundTask = [application beginBackgroundTaskWithExpirationHandler:^{
                [application endBackgroundTask:backgroundTask];
                backgroundTask = UIBackgroundTaskInvalid;
            }];
        }
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
