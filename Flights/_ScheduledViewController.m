//
//  _ScheduledViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "_ScheduledViewController.h"
#import "_BerthViewController.h"
#import "Sched_NHViewController.h"
#import "NSString+MD5.h"
#import "ASIFormDataRequest.h"
#import "ScBerthController.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"
#import "DesUtil.h"


@interface _ScheduledViewController ()

@end

@implementation _ScheduledViewController

@synthesize helloezm;
@synthesize pop;
@synthesize she;
@synthesize st,start,yy_request;
@synthesize schoolArrayaa,arrya,cellarray,str1,str2,rzmdict,myNewTime;
@synthesize sanzima,sanzima1,timeQi,timeDi,berDingItem,zongPrice,mmenItem;
@synthesize chuFam,diDam;
@synthesize rqcz,cscz,cscz2,md5String;
@synthesize arrayBtn;
@synthesize erzima,twozima;
@synthesize st1,st2;
@synthesize ya;
@synthesize danCangWei,danJiaGe,danJiJian,danRanYou,danTuiGaiQian,danZheKou,danHangBanHao,danjixing;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


-(id)initWithNewItem:(MyNewXmlMolde *)newItem withTwoItem:(MyNewXmlMolde *)twoNewItem
{

    if (self = [super init]) {
        self.berDingItem = newItem;
        self.ya = twoNewItem;
    }

    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSString *)addDesString:(NSString *)string
{
    
    string = [string stringByReplacingOccurrencesOfString:@"+" withString:@"-"];
    string = [string stringByReplacingOccurrencesOfString:@"/" withString:@"_"];
    string = [string stringByReplacingOccurrencesOfString:@"=" withString:@"@"];
    
    return string;
}

-(NSString *)jDesString:(NSString *)string
{
    string = [string stringByReplacingOccurrencesOfString:@"-" withString:@"+"];
    string = [string stringByReplacingOccurrencesOfString:@"_" withString:@"/"];
    string = [string stringByReplacingOccurrencesOfString:@"@" withString:@"="];
    
    return string;
}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    start = NO;
    
    NSError * error = [request error];
    NSLog(@"%@",error);
    [activity stopAnimating];
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时！"
                                                     message:@"返回上一界面"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
    
}

-(NSMutableArray *)jsonStringDict:(NSDictionary *)responseDate
{
    NSArray *flights = [responseDate objectForKey:@"Flights"];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    for (NSDictionary * dic in flights) {
        NSMutableArray * a = [[NSMutableArray alloc] initWithCapacity:0];
        MyNewXmlMolde *m = [[MyNewXmlMolde alloc] init];
        m.yCode = [dic objectForKey:@"Code"];
        m.yMessage = [dic objectForKey:@"Message"];
        m.xCarrierFullName = [dic objectForKey:@"CarrierFullName"];
        m.xCarrierReferred = [dic objectForKey:@"CarrierReferred"];
        m.xCarrier = [dic objectForKey:@"Carrier"];
        m.xDepCityFullName = [dic objectForKey:@"DepCityFullName"];
        m.xDepCityReferred = [dic objectForKey:@"DepCityReferred"];
        m.xDepCity = [dic objectForKey:@"DepCity"];
        m.xDepTime = [dic objectForKey:@"DepTime"];
        m.xArrTime = [dic objectForKey:@"ArrTime"];
        m.xFlightNo = [dic objectForKey:@"FlightNo"];
        m.xArrCityFullName = [dic objectForKey:@"ArrCityFullName"];
         m.xArrCityReferred = [dic objectForKey:@"ArrCityReferred"];
        m.xArrCity = [dic objectForKey:@"ArrCity"];
        m.xDepTower = [dic objectForKey:@"DepTower"];
        m.xArrTower = [dic objectForKey:@"ArrTower"];
        m.xAircraft = [dic objectForKey:@"Aircraft"];
        m.xFlightDate = [dic objectForKey:@"FlightDate"];
        
        [a addObject:m];
        [m release];
        
        NSArray * cabins = [dic objectForKey:@"Cabins"];
        for (NSDictionary * d in cabins) {
            NSMutableArray *b = [[NSMutableArray alloc] initWithCapacity:0];
            MyNewXmlMolde * mJsonMolde = [[MyNewXmlMolde alloc] init];
            mJsonMolde.ccName = [d objectForKey:@"Name"];
            mJsonMolde.ccTicketStatus = [d objectForKey:@"TicketStatus"];
            mJsonMolde.ccTax = [d objectForKey:@"Tax"];
            mJsonMolde.ccSinglePrice = [d objectForKey:@"SinglePrice"];
            mJsonMolde.ccFuel =[d objectForKey:@"Fuel"];
            mJsonMolde.ccEi = [d objectForKey:@"Ei"];
            mJsonMolde.ccDiscount = [d objectForKey:@"Discount"];
            
            [b addObject:mJsonMolde];
            
            [mJsonMolde release];
            [a addObject:b];
            [b release];
        }
        [arr addObject:a];
        [a release];
    }
    
    return arr;
}


-(void)dealloc
{
    [super dealloc];
    [label_o release];
    [label_a release];
    [label_r release];
    [label_u release];
    [as_la_o release];
    [tabelView_tab release];
    [str1 release];
    [str2 release];
    [sanzima1 release];
    [sanzima release];
    [timeDi release];
    [timeQi release];
    [chuFam release];
    [diDam release];
    [zongPrice release];
    [berDingItem release];
    
   
    
    
    
}



- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (request.tag==1000) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.schoolArrayaa = [self jsonStringDict:dic];
        NSLog(@"%@", self.schoolArrayaa);
        for (MyNewXmlMolde *m in self.schoolArrayaa) {
            
        }
        
     
        NSLog(@"schoolArray 长度 : %d",[self.schoolArrayaa count]);
        
        [activity stopAnimating];
        
        start = NO;
        
        if ([self.schoolArrayaa count] > 0) {
            
            [tabelView_tab reloadData];
            
            
        }
        else{
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时！"
                                                             message:@"返回上一界面"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            [alertView show];
            [alertView release];
            
            
        }
        
        
    }else if (request.tag==1001) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.schoolArrayaa = [self jsonStringDict:dic];
        NSLog(@"%@", self.schoolArrayaa);
        for (MyNewXmlMolde *m in self.schoolArrayaa) {
            
        }
        
      
        
        NSLog(@"schoolArray 长度 : %d",[self.schoolArrayaa count]);
        
        [activity stopAnimating];
        
        start = NO;
        
        if ([self.schoolArrayaa count] > 0) {
            
            [tabelView_tab reloadData];
            
            
        }
        
    }else if (request.tag==1002) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.schoolArrayaa = [self jsonStringDict:dic];
        NSLog(@"%@", self.schoolArrayaa);
        for (MyNewXmlMolde *m in self.schoolArrayaa) {
            
        }
        
    
        
        NSLog(@"schoolArray 长度 : %d",[self.schoolArrayaa count]);
        
        [activity stopAnimating];
        
        start = NO;
        
        if ([self.schoolArrayaa count] > 0) {
            
            [tabelView_tab reloadData];
            
            
        }
        
    }

}

-(void)httpOn
{
    
    
    
    
    if (start == YES) {
        
        [activity stopAnimating];
        [yy_request clearDelegatesAndCancel];
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"正在下载请不要重复操作!"
                                                         message:@"返回上一界面重新选择!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else{

    self.arrya = [NSMutableArray arrayWithArray:[self.schoolArrayaa objectAtIndex:0]];
    MyNewXmlMolde * timeIng = [self.arrya objectAtIndex:0];
    NSRange range = NSMakeRange(8, 2);
    NSString * time = [timeIng.xFlightDate substringWithRange:range];
    
    NSRange range1 = NSMakeRange(0, 4);
    NSString * time1 = [timeIng.xFlightDate substringWithRange:range1];
    
    NSRange range2 = NSMakeRange(5, 2);
    NSString *time2 = [timeIng.xFlightDate substringWithRange:range2];
    
    int timeData = [time intValue];
    int timeYue = [time2 intValue];
    int timeNian = [time1 intValue];
    int newData;
    
    if ( timeYue == 8 ) {
        
        if (timeData == 1) {
            timeData = 31;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
        
    }else if (timeYue == 5 || timeYue == 7){
        if (timeData == 1) {
            timeData = 30;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }
    else if (timeYue == 1){
        if (timeData == 1) {
            timeData = 31;
            timeYue = 12;
            int newYear = timeNian - 1;
            myNewTime = [NSString stringWithFormat:@"%d-0%d-%d",newYear,timeYue,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
    }
    else if (timeYue == 12){
        
        if (timeData == 1) {
            timeData = 30;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }
    
    
    else if (timeYue == 4 || timeYue == 6 || timeYue == 9 ){
        if (timeData == 1) {
            timeData = 31;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=11 && timeData <= 30){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }else if (timeYue == 10){
        
        if (timeData == 1) {
            timeData = 30;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
    }else if (timeYue == 11){
        if (timeData == 1) {
            timeData = 31;
            int newYeu = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 11 && timeData <= 30){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }else if (timeYue == 3){
        if (timeData == 1) {
            if (timeNian/4==0) {
                timeData = 29;
                int newYue = timeYue - 1;
                myNewTime = [NSString stringWithFormat:@"%d-0%d-%d",timeNian,newYue,timeData];
            }else {
                timeData = 28;
                int newYue = timeYue - 1;
                myNewTime = [NSString stringWithFormat:@"%d-0%d-%d",timeNian,newYue,timeData];
                
            }
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 11 && timeData <= 31){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData < 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }else if(timeYue == 2 ){
        
        if (timeData == 1) {
            timeData = 31;
            int newYue = timeYue - 1;
            myNewTime = [NSString stringWithFormat:@"%d-0%d-%d",timeNian,newYue,timeData];
            
        }else if (timeData < 11 ){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
            
        }else if (timeData >= 11)
        {
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
            
        }else if(timeData == 11){
            newData = timeData - 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
    }
    
        NSString * str =[NSString stringWithFormat:@"%@%@",sanzima1,myNewTime];
        NSLog(@"00000000000000 %@",str);
        NSString * str1_r = @"11119688";
        
        //加密
        NSString * string = [DesUtil encryptUseDES:str key:str1_r];
        NSLog(@"加密之后 %@",string);
        
        
        //加密转译
        NSString * adString =  [self addDesString:string];
        NSLog(@"加密后转译 %@",adString);
        
        
        //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
        NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
        NSLog(@"拼接好的串 %@",mstring);
        
        
        //将拼接好的串进行二次加密
        NSString * oostring=[DesUtil encryptUseDES:mstring key:str1_r];
        NSLog(@"二次加密 %@",oostring);
        
        
        //二次加密后得到的串进行转译
        NSString * tstring=[self addDesString:oostring];
        NSLog(@"二次加密转译 %@",tstring);
        
        
        
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&sign=%@",sanzima1,sanzima,self.twozima,myNewTime,tstring];
        
        
        NSLog(@"self.berDingItem.xCarrier %@ ",self.twozima);
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1001];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
    }
        
}


-(void)httpNext
{
    if (start == YES) {
        
        [activity stopAnimating];
        [yy_request clearDelegatesAndCancel];
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"正在下载请不要重复操作!"
                                                         message:@"返回上一界面重新选择!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }else{

    
    self.arrya = [NSMutableArray arrayWithArray:[self.schoolArrayaa objectAtIndex:0]];
    MyNewXmlMolde * timeIng = [self.arrya objectAtIndex:0];
    
    NSRange range = NSMakeRange(8, 2);
    NSString * time = [timeIng.xFlightDate substringWithRange:range];
    
    NSRange range1 = NSMakeRange(0, 4);
    NSString * time1 = [timeIng.xFlightDate substringWithRange:range1];
    
    NSRange range2 = NSMakeRange(5, 2);
    NSString *time2 = [timeIng.xFlightDate substringWithRange:range2];
    
    int timeData = [time intValue];
    int timeYue = [time2 intValue];
    int timeNian = [time1 intValue];
    int newData;
    
    if (timeYue == 1 || timeYue == 3 || timeYue == 5 || timeYue == 7 || timeYue == 8  ) {
        
        if (timeData == 31) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 9 && timeData < 31){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
        
    }
    
    else if (timeYue == 4 || timeYue == 6 || timeYue == 9 ){
        if (timeData == 30) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=9 && timeData < 30){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }else if (timeYue == 10){
        
        if (timeData == 31) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-0%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >=9 && timeData < 31){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
    }else if (timeYue == 11){
        if (timeData == 30) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-0%d",time1,newYeu,timeData];
            NSLog(@" %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if(timeData >= 9 && timeData < 30){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
        
    }else if (timeYue == 12){
        
        if (timeData ==31){
            int newYear = timeNian + 1;
            timeYue = 1;
            timeData = 1;
            myNewTime = [NSString stringWithFormat:@"%d-0%d-0%d",newYear,timeYue,timeData];
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if (timeData >= 9 && timeData < 31){
            
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }
        
    }else if (timeYue == 2 ){
        if (timeData ==29 && timeNian/4 == 0) {
            int newYue = timeYue + 1;
            timeData = 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYue,timeData];
        }else if(timeData ==28 && timeNian/4 != 0){
            int newYue = timeYue + 1;
            timeData = 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYue,timeData];
            
        }else if (timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
        }else if (timeData >= 9 ){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@" %@",myNewTime);
            
            
        }
        
        
    }

    
    
        NSString * str =[NSString stringWithFormat:@"%@%@",sanzima1,myNewTime];
        NSLog(@"00000000000000 %@",str);
        NSString * str1_q = @"11119688";
        
        //加密
        NSString * string = [DesUtil encryptUseDES:str key:str1_q];
        NSLog(@"加密之后 %@",string);
        
        
        //加密转译
        NSString * adString =  [self addDesString:string];
        NSLog(@"加密后转译 %@",adString);
        
        
        //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
        NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
        NSLog(@"拼接好的串 %@",mstring);
        
        
        //将拼接好的串进行二次加密
        NSString * oostring=[DesUtil encryptUseDES:mstring key:str1_q];
        NSLog(@"二次加密 %@",oostring);
        
        
        //二次加密后得到的串进行转译
        NSString * tstring=[self addDesString:oostring];
        NSLog(@"二次加密转译 %@",tstring);
        
        
        
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&sign=%@",sanzima1,sanzima,self.twozima,myNewTime,tstring];
        
        NSLog(@"78977777777777777777779 %@",self.berDingItem.xCarrier);
        
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1002];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
    }
    
}


-(void)httpWang
{
    NSString * str =[NSString stringWithFormat:@"%@%@",sanzima1,timeDi];
    NSLog(@"00000000000000 %@",str);
    NSString * str1_i = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:str1_i];
    NSLog(@"加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"加密后转译 %@",adString);
    
    
    //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
    NSLog(@"拼接好的串 %@",mstring);
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:str1_i];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    

    NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&sign=%@",sanzima1,sanzima,self.ya.xCarrier,timeDi,tstring];
    
    NSLog(@"78977777777777777777779 %@",self.ya.xCarrier);
    self.twozima = [NSString stringWithFormat:@"%@",self.ya.xCarrier];
    NSLog(@"666666667777777  %@",self.twozima);
        
    NSLog(@"asdsdsd%@",strUrL);
    NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
    yy_request = [ASIHTTPRequest requestWithURL:urll];
    [yy_request setTag:1000];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
        
        start = YES;
    
    
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
   
    NSLog(@"单程出发时间 %@",str1);
    NSLog(@"单程抵达时间 %@",str2);
    NSLog(@"单程出发名 %@",self.chuFam);
    NSLog(@"单程抵达名 %@",self.diDam);
    NSLog(@"单程舱位 %@",self.danCangWei);
    NSLog(@"单程价格 %@",self.danJiaGe);
    NSLog(@"单程折扣 %@",self.danZheKou);
    NSLog(@"单程机场建设费 %@",self.danJiJian);
    NSLog(@"单程燃油 %@",self.danRanYou);
    NSLog(@"单程退改签 %@",self.danTuiGaiQian);
    NSLog(@"单程航班号 %@",self.danHangBanHao);
    NSLog(@"单程机型 %@",self.danjixing);
    
    
    NSLog(@"4444444 %@",self.ya.xCarrier);
    CGRect rect=self.view.bounds;
    
    tabelView_tab = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, rect.size.height-40) style:UITableViewStylePlain];
    
        activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)] autorelease];
        [activity setCenter:CGPointMake(160, 200)];

    
    
    schoolArrayaa = [[NSMutableArray alloc]initWithCapacity:0];
    //arrya = [[NSMutableArray alloc]initWithCapacity:0];
    cellarray = [[NSMutableArray alloc]initWithCapacity:0];
    
    
    

    
    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    UIButton * _btnb_bxo = [UIButton buttonWithType:UIButtonTypeCustom];
    _btnb_bxo.frame = CGRectMake(0, 0, 35, 25);
    [_btnb_bxo setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [_btnb_bxo addTarget:self action:@selector(_btnb_bxoFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *_bkqbtn_ifo = [[[UIBarButtonItem alloc] initWithCustomView:_btnb_bxo] autorelease];
    
    self.navigationItem.leftBarButtonItem = _bkqbtn_ifo;
    
    tabelView_tab.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tabelView_tab.delegate = self;
    tabelView_tab.dataSource = self;
    [self.view addSubview:tabelView_tab];
    
    [self buttoop_btn];

    
    
    
    self.rzmdict = [NSDictionary dictionaryWithObjectsAndKeys:@"3Ua.png",@"四川航空股份有限公司",@"all.png",@"云南祥鹏航空有限责任公司",@"BKc.png",@"奥凯航空有限公司",@"CAd.png",@"中国国际航空公司",@"CZe.png",@"中国南方航空公司",@"all.png",@"成都航空有限公司",@"FMg.png",@"上海航空有限公司",@"G5h.png",@"北京首都航空公司",@"all.png",@"天津航空有限责任公司",@"HOj.png",@"上海吉祥航空有限公司",@"all.png",@"海南航空股份有限公司",@"KNl.png",@"中国联合航空有限公司",@"MFm.png",@"厦门航空有限公司",@"MUn.png",@"中国东方航空公司",@"PNo.png",@"西部航空有限责任公司",@"SCp.png",@"山东航空股份有限公司",@"ZHq.png",@"深圳航空有限责任公司",@"KYr.png",@"昆明航空有限公司",@"all.png",@"河北航空有限公司",@"all.png",@"幸福航空有限责任公司",@"all.png",@"华夏航空有限公司",@"CNv.png",@"大新华航空有限公司",@"VDw.png",@"河南航空有限公司",@"all.png",@"武汉东星航空有限公司",@"all.png",@"西藏航空有限公司",@"all.png",@"春秋航空有限公司",@"香港航空.png",@"香港航空",@"all.png",@"香港快运航空公司",nil];
    
    
    self.erzima=[NSDictionary dictionaryWithObjectsAndKeys:@"3U",@"四川航空股份有限公司",@"8L",@"云南祥鹏航空有限责任公司",@"BK",@"奥凯航空有限公司",@"CA",@"中国国际航空公司",@"CZ",@"中国南方航空公司",@"EU",@"成都航空有限公司",@"FM",@"上海航空有限公司",@"G5",@"华夏航空有限公司",@"GS",@"天津航空有限责任公司",@"HO",@"上海吉祥航空有限公司",@"HU",@"海南航空股份有限公司",@"KN",@"中国联合航空有限公司",@"MF",@"厦门航空有限公司",@"MU",@"中国东方航空公司",@"PN",@"西部航空有限责任公司",@"SC",@"山东航空股份有限公司",@"ZH",@"深圳航空有限责任公司",@"KY",@"昆明航空有限公司",@"NS",@"河北航空有限公司",@"JR",@"幸福航空有限责任公司",@"JD",@"北京首都航空公司",@"CN",@"大新华航空有限公司",@"VD",@"河南航空有限公司",@"8C",@"武汉东星航空有限公司",@"9C",@"春秋航空有限公司",@"TV",@"西藏航空有限公司" ,nil];

    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activity];
    [activity startAnimating];
    
    [self httpWang];
   
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    NSMutableArray * ma = [[NSMutableArray alloc] initWithCapacity:0] ;
    ma = [self.schoolArrayaa objectAtIndex:indexPath.row];
   
    
//   MyNewXmlMolde * m = [self.cellarray objectAtIndex:0];
//    
//    NSRange rangN = NSMakeRange(0, 1);
//    NSString * ddef = [m.ccSinglePrice substringWithRange:rangN];
//    int b =[[ddef substringWithRange:rangN ]intValue];
//    
//    
//    if (b == 0) {
//        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"没有此航班"
//                                                         message:@"返回上一界面"
//                                                        delegate:self
//                                               cancelButtonTitle:@"确定"
//                                               otherButtonTitles:nil];
//        [alertView show];
//        [alertView release];
//        
//    }else{

    
    ScBerthController * scb = [[[ScBerthController alloc] initWithArray:ma WithNewItem:self.berDingItem withtwoNewItem:ya] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:scb] autorelease];
    scb.timeStr1 = self.str1;
    
    
    NSLog(@"jjjjj %@",self.berDingItem.ccSinglePrice);
    NSLog(@"ccccc %@",self.berDingItem.ccName);
    
    scb.timeStr2 = self.str2;
    scb.cszima = self.sanzima;
    scb.cszima2 = self.sanzima1;
    scb.qiFeish = self.timeQi;
    scb.didaMing = self.timeDi;
    scb.myNewPrice = self.zongPrice;
    scb.chufaMing = self.chuFam;
    scb.didaMing = self.diDam;
    scb.jbk = self.pop;
    scb.suv = self.she;
    
    scb.y_danQiFei = self.str1;
    scb.y_danDiDa = self.str2;
    scb.y_danQiFeiTime = self.chuFam;
    scb.y_danDiDaTime = self.diDam;
    scb.y_danJiaGe = self.danJiaGe;
    scb.y_danCangWei = self.danCangWei;
    scb.y_danZheKou = self.danZheKou;
    scb.y_danJiJian =self.danJiJian;
    scb.y_danRanYou = self.danRanYou;
    scb.y_danTuiGaiQian =self.danTuiGaiQian;
    scb.y_danHangBanHao =self.danHangBanHao;
    scb.y_danjixing = self.danjixing;
//    scb.wangQitimer = st11;
//    scb.wangDitimer =st22;
    
    

    
    scb.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    [tabelView_tab deselectRowAtIndexPath:[tabelView_tab indexPathForSelectedRow] animated:YES];
    
   // }
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
       
    return [schoolArrayaa count];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

        
    return 70.0f;
 

}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * cellID = @"cell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    
    if (nil == cell) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID] autorelease];
        
        
                    
            label_o = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 120, 20)];
            label_o.tag = 1001;
            label_o.font = [UIFont fontWithName:@"Arial" size:16];
            label_o.backgroundColor = [UIColor clearColor];
            label_o.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_o];
            
            label_a = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 120, 20)];
            label_a.tag = 1002;
            label_a.font = [UIFont fontWithName:@"Arial" size:16];
            label_a.backgroundColor = [UIColor clearColor];
            label_a.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_a];
        
        depHzl = [[UILabel alloc] initWithFrame:CGRectMake(170, 5, 100, 20)];
        depHzl.tag = 1012;
        depHzl.font = [UIFont fontWithName:@"Arial" size:16];
        depHzl.backgroundColor = [UIColor clearColor];
        depHzl.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:depHzl];
        
        arrHzl = [[UILabel alloc] initWithFrame:CGRectMake(170, 30, 100, 20)];
        arrHzl.tag = 1013;
        arrHzl.font = [UIFont fontWithName:@"Arial" size:16];
        arrHzl.backgroundColor = [UIColor clearColor];
        arrHzl.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:arrHzl];
        
        zheLab = [[UILabel alloc] initWithFrame:CGRectMake(5, 55, 40, 15)];
        zheLab.tag = 1010;
        zheLab.font = [UIFont fontWithName:@"Arial" size:13];
        zheLab.backgroundColor = [UIColor clearColor];
        zheLab.textColor =[UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
        zheLab.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:zheLab];
        
        jixinglab = [[UILabel alloc] initWithFrame:CGRectMake(45, 55, 60, 15)];
        jixinglab.tag = 1014;
        jixinglab.font = [UIFont fontWithName:@"Arial" size:13];
        jixinglab.backgroundColor = [UIColor clearColor];
        jixinglab.textColor =[UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
        jixinglab.textAlignment = NSTextAlignmentCenter;
        [cell addSubview:jixinglab];
        
        hangNameLab = [[UILabel alloc] initWithFrame:CGRectMake(220, 55, 70, 15)];
        hangNameLab.tag = 1011;
        hangNameLab.font = [UIFont fontWithName:@"Arial" size:13];
        hangNameLab.backgroundColor = [UIColor clearColor];
        hangNameLab.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
        hangNameLab.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:hangNameLab];
        
            label_r = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 120, 15)];
            label_r.tag = 1003;
            label_r.font = [UIFont fontWithName:@"Arial" size:13];
            label_r.backgroundColor = [UIColor clearColor];
            label_r.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            
            label_r.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_r];
            
            label_u=[[UILabel alloc]initWithFrame:CGRectMake(240, 15, 80, 30)];
            label_u.tag=1004;
            label_u.font=[UIFont fontWithName:@"Arial" size:15];
            label_u.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            label_u.backgroundColor=[UIColor clearColor];
            label_u.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:label_u];
            
            UIImageView * imgView_a = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
            imgView_a.tag = 1005;
            [cell addSubview:imgView_a];
            [imgView_a release];

 
    }
    
    
       
    if ([schoolArrayaa count] !=0) {
        self.cellarray =[self.schoolArrayaa objectAtIndex:indexPath.row];
//        self.cellarray = [self.schoolArrayaa objectAtIndex:indexPath.row];
        NSLog(@"schoolArrayaa  %d",[self.schoolArrayaa count]);
        NSLog(@"cellarry  %d",[self.cellarray count]);
        
        mmenItem = [self.cellarray objectAtIndex:0];
        NSMutableArray * a = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
        a = [self.cellarray objectAtIndex:1];
        NSLog(@"a  数组 %d",[a count]);
        twoItem = [a objectAtIndex:0];
        MyNewXmlMolde * bdm = [a objectAtIndex:0];
        
        
      
        
        as_la_o.text = [NSString stringWithFormat:@"%@",mmenItem.xFlightDate];
        
        
        NSRange rangN = NSMakeRange(0, 2);
        NSString * nianFen = [mmenItem.xDepTime substringWithRange:rangN];
        
        NSRange rangN1 = NSMakeRange(2, 2);
        NSString * nianFen1 = [mmenItem.xDepTime substringWithRange:rangN1];
       st11 = [NSString stringWithFormat:@"%@:%@",nianFen,nianFen1];
        
        
        NSRange rangN2 = NSMakeRange(0, 2);
        NSString * nianFen3 = [mmenItem.xArrTime substringWithRange:rangN2];
        
        NSRange rangN3 = NSMakeRange(2, 2);
        NSString * nianFen4 = [mmenItem.xArrTime substringWithRange:rangN3];
        st22 = [NSString stringWithFormat:@"%@:%@",nianFen3,nianFen4];
        

        
        UILabel * la = (UILabel *) [cell viewWithTag:1001];
        la.text = [NSString stringWithFormat:@"%@%@",mmenItem.xDepCityReferred,st11];
        
        UILabel * la2 = (UILabel *) [cell viewWithTag:1002];
        
        la2.text = [NSString stringWithFormat:@"%@%@",mmenItem.xArrCityReferred,st22];
        
        UILabel * la3 = (UILabel *)[cell viewWithTag:1003];
        la3.text = [NSString stringWithFormat:@"航班号: %@",mmenItem.xFlightNo];
        
        UILabel * la4 = (UILabel *) [cell viewWithTag:1004];
        la4.text = [NSString stringWithFormat:@"￥%@",bdm.ccSinglePrice];
        
        UILabel * la5 = (UILabel *)[cell viewWithTag:1010];
        la5.text = [NSString stringWithFormat:@"%@",mmenItem.xCarrierReferred];
        
        UILabel * la6 = (UILabel *)[cell viewWithTag:1011];
        la6.text = [NSString stringWithFormat:@"折扣:%@%%",twoItem.ccDiscount];
        
        UILabel * la7 = (UILabel *)[cell viewWithTag:1012];
        la7.text = [NSString stringWithFormat:@"航站楼:%@",mmenItem.xDepTower];
        UILabel * la8 = (UILabel *)[cell viewWithTag:1013];
        la8.text = [NSString stringWithFormat:@"航站楼:%@",mmenItem.xArrTower];
        
        UILabel * la9 = (UILabel *)[cell viewWithTag:1014];
        la9.text = [NSString stringWithFormat:@"机型:%@",mmenItem.xAircraft];
        
        UIImageView * image = (UIImageView*)[cell viewWithTag:1005];
        NSString * imger = [NSString stringWithFormat:@"%@",[rzmdict valueForKey:mmenItem.xCarrierFullName]];
        image.image = [UIImage imageNamed:imger];
        NSLog(@"%@",imger);

    }
    

    
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

-(void)buttoop_btn
{
    aw_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [aw_btn addTarget:self action:@selector(aw_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:aw_btn];
    
    bq_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [bq_btn addTarget:self action:@selector(bq_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:bq_btn];
    
    ce_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [ce_btn addTarget:self action:@selector(ce_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:ce_btn];
    
    
        aw_btn.frame=CGRectMake(5, 5,100 , 35);
        [aw_btn setImage:[UIImage imageNamed:@"01-0001.png"] forState:UIControlStateNormal];
        
    
        as_la_o=[[UILabel alloc] initWithFrame:CGRectMake(115, 5, 90, 35)];
        as_la_o.backgroundColor=[UIColor clearColor];
        as_la_o.textAlignment=NSTextAlignmentCenter;
        as_la_o.font=[UIFont fontWithName:@"Arial" size:15];
        as_la_o.textColor=[UIColor blackColor];
        as_la_o.text=she;
        [self.view addSubview:as_la_o];
    
    
        ce_btn.frame=CGRectMake(215, 5, 100, 35);
        [ce_btn setImage:[UIImage imageNamed:@"01-0003.png"] forState:UIControlStateNormal];
        
 

}

-(NSString *)GetTomorrowDay:(NSDate *)aDate WithDay:(int)howDay
{
    NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+howDay)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[[NSDateFormatter alloc] init] autorelease];
    [dateday setDateFormat:@"yyyy.MM.dd"];
    return [dateday stringFromDate:beginningOfWeek];
    
}


-(void)aw_btnPressed:(UIButton *)button;
{
    
    [self httpOn];
    
    [activity startAnimating];
}
-(void)bq_btnPressed:(UIButton *)button;
{
    NSLog(@"w");
}
-(void)ce_btnPressed:(UIButton *)button;
{
    
    [self httpNext];
    
    [activity startAnimating];
}

-(void)_btnb_bxoFanHui:(UIButton *)button
{
    
    if (start == YES) {
        [yy_request clearDelegatesAndCancel];
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
