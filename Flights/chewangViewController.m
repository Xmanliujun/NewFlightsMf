//
//  chewangViewController.m
//  Flights
//
//  Created by mac on 12-11-6.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "chewangViewController.h"
#import "InquiryViewController.h"
#import "_BerthViewController.h"
#import "NSString+MD5.h"
#import "ASIFormDataRequest.h"
#import "SXView.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"
#import "DesUtil.h"

@interface chewangViewController ()

@end

@implementation chewangViewController
@synthesize start,yy_request,nowt;
@synthesize st;
@synthesize schoolArray,arr,cellarray;
@synthesize arrayBtn,strary;
@synthesize manItem;
@synthesize erzima;
@synthesize hkgscz,cscz,cscz2,rqcz,erZim,chuFa,diDa,myNewTime,st1,st2,dRqca;
@synthesize md5String;
@synthesize rzmdict;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag ==123) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
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
    NSMutableArray *arsy = [[NSMutableArray alloc] initWithCapacity:0];
    
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
        [arsy addObject:a];
        [a release];
    }
    
    return arsy;
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    
    if (request.tag==1000) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        NSString * stringCode = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Code"]];
        NSString * stringMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Message"]];
        
        if ([stringCode isEqual:@"0"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            
            alert.tag=123;
            [alert show];
            [alert release];
            
            [activity stopAnimating];
            
            start = NO;
            
            
        }else{
            
            
            self.schoolArray = [self jsonStringDict:dic];
            NSLog(@"%@", self.schoolArray);
            for (MyNewXmlMolde *m in self.schoolArray)
                
                
                NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
            
            [activity stopAnimating];
            
            start = NO;
            
            if ([self.schoolArray count] > 0) {
                
                [tabelView reloadData];
                
                
                
            }
            
        }
        
        
    }else if (request.tag==1001) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.schoolArray = [self jsonStringDict:dic];
        NSLog(@"%@", self.schoolArray);
        for (MyNewXmlMolde *m in self.schoolArray) {
            
        }

        
        NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
        
        [activity stopAnimating];
        
        start = NO;
        
        if ([self.schoolArray count] > 0) {
            
            [tabelView reloadData];
            
            
        }
        
    }else if (request.tag==1002) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        self.schoolArray = [self jsonStringDict:dic];
        NSLog(@"%@", self.schoolArray);
        for (MyNewXmlMolde *m in self.schoolArray) {
            
        }
        
        
        NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
        
        [activity stopAnimating];
        
        start = NO;
        
        if ([self.schoolArray count] > 0) {
            
            [tabelView reloadData];
            
            
        }
        
    }else if (request.tag==1003) {
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        NSString * stringCode = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Code"]];
        NSString * stringMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Message"]];
        
        if ([stringCode isEqual:@"0"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            
          //  alert.tag=123;
            [alert show];
            [alert release];
            
            [activity stopAnimating];
            
            start = NO;
            
            
        }else{
            
            
            self.schoolArray = [self jsonStringDict:dic];
            NSLog(@"%@", self.schoolArray);
            for (MyNewXmlMolde *m in self.schoolArray)
                
                
                NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
            
            [activity stopAnimating];
            
            start = NO;
            
            if ([self.schoolArray count] > 0) {
                
                [tabelView reloadData];
                
                
                
            }
            
        }
        
    }
    
    else if (request.tag == 1004){
        
        
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        
        NSString * stringCode = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Code"]];
        NSString * stringMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Message"]];
        
        if ([stringCode isEqual:@"0"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            
            //  alert.tag=123;
            [alert show];
            [alert release];
            
            [activity stopAnimating];
            
            start = NO;
            
            
        }else{
            
            
            self.schoolArray = [self jsonStringDict:dic];
            NSLog(@"%@", self.schoolArray);
            for (MyNewXmlMolde *m in self.schoolArray)
                
                
                NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
            
            [activity stopAnimating];
            
            start = NO;
            
            if ([self.schoolArray count] > 0) {
                
                [tabelView reloadData];
                
                
                
            }
            
        }
        
    }else if (request.tag == 1005){
        
        
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        
        NSString * stringCode = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Code"]];
        NSString * stringMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Message"]];
        
        if ([stringCode isEqual:@"0"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
            
            //  alert.tag=123;
            [alert show];
            [alert release];
            
            [activity stopAnimating];
            
            start = NO;
            
            
        }else{
            
            
            self.schoolArray = [self jsonStringDict:dic];
            NSLog(@"%@", self.schoolArray);
            for (MyNewXmlMolde *m in self.schoolArray)
                
                
                NSLog(@"schoolArray 长度 : %d",[self.schoolArray count]);
            
            [activity stopAnimating];
            
            start = NO;
            
            if ([self.schoolArray count] > 0) {
                
                [tabelView reloadData];
                
                
                
            }
            
        }
        
    }
    
}


-(void)httpOn
{
    
    
    if ([schoolArray count] !=0) {
        NSDate *  senddate=[NSDate date];
        NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
        [dateformatter setDateFormat:@"YYYY-MM-dd"];
        NSString *  locationString=[dateformatter stringFromDate:senddate];
        
        NSLog(@"系统时间 %@",locationString);
        
        NSRange rangen = NSMakeRange(8, 2);
        NSString * xtrq = [locationString substringWithRange:rangen];
        NSLog(@"截取字符串后 %@",xtrq);
        
        int dd = [xtrq intValue];
        
        NSMutableArray * a = [[NSMutableArray alloc] initWithCapacity:0];
        
        a = [self.schoolArray objectAtIndex:0];
        NSLog(@"school  %d",[self.schoolArray count]);
        NSLog(@"arry  %d",[a count]);
        
        
        MyNewXmlMolde * ndd = [a objectAtIndex:0];
        NSLog(@"新时间 %@",ndd.xFlightDate);
        NSRange rangenc = NSMakeRange(8, 2);
        NSString * nddxp = [ndd.xFlightDate substringWithRange:rangenc];
        NSLog(@"截取字符串后 %@",nddxp);
        
        int ndxp = [nddxp intValue];
        
        
        
        
        
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
        }else
        {
            
            
            self.arr = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:0]];
            MyNewXmlMolde * timeIng = [self.arr objectAtIndex:0];
            NSRange range = NSMakeRange(8, 2);
            NSString * time = [timeIng.xFlightDate substringWithRange:range];
            NSLog(@" %@",time);
            
            NSRange range1 = NSMakeRange(0, 4);
            NSString * time1 = [timeIng.xFlightDate substringWithRange:range1];
            NSLog(@" %@",time1);
            
            NSRange range2 = NSMakeRange(5, 2);
            NSString *time2 = [timeIng.xFlightDate substringWithRange:range2];
            NSLog(@" %@",time2);
            
            int timeData = [time intValue];
            int timeYue = [time2 intValue];
            int timeNian = [time1 intValue];
            int newData = nil;
            
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
                    NSLog(@"%@",myNewTime);
                    
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
            
            
            NSString * str =[NSString stringWithFormat:@"%@%@",cscz,myNewTime];
            NSLog(@"00000000000000 %@",str);
            NSString * str1 = @"11119688";
            
            //加密
            NSString * string = [DesUtil encryptUseDES:str key:str1];
            NSLog(@"加密之后 %@",string);
            
            
            //加密转译
            NSString * adString =  [self addDesString:string];
            NSLog(@"加密后转译 %@",adString);
            
            
            //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
            NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
            NSLog(@"拼接好的串 %@",mstring);
            
            
            //将拼接好的串进行二次加密
            NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
            NSLog(@"二次加密 %@",oostring);
            
            
            //二次加密后得到的串进行转译
            NSString * tstring=[self addDesString:oostring];
            NSLog(@"二次加密转译 %@",tstring);
            
            
            NSLog(@" newdata is %d",newData);
            
            if (erZim == nil && dd < ndxp) {
                NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,myNewTime,tstring];
                
                
                
                NSLog(@"asdsdsd%@",strUrL);
                NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
                
                yy_request = [ASIHTTPRequest requestWithURL:urll];
                [yy_request setTag:1002];
                [yy_request setDelegate:self];
                [yy_request startAsynchronous];
                
                start = YES;
                
            }
            else if(erZim != nil && dd < ndxp){
                
                NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,erZim,myNewTime,tstring];
                
                
                
                NSLog(@"asdsdsd%@",strUrL);
                NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
                
                yy_request = [ASIHTTPRequest requestWithURL:urll];
                [yy_request setTag:1002];
                [yy_request setDelegate:self];
                [yy_request startAsynchronous];
                
                start = YES;
            }else{
                
                UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"日期有误或小于当日时间!"
                                                                 message:@"请重新选择!"
                                                                delegate:self
                                                       cancelButtonTitle:@"确定"
                                                       otherButtonTitles:nil];
                [alertView show];
                [alertView release];
                
            }
            
        }
        
        
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

    self.arr = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:0]];
    MyNewXmlMolde * timeIng = [self.arr objectAtIndex:0];
    
    NSRange range = NSMakeRange(8, 2);
    NSString * time = [timeIng.xFlightDate substringWithRange:range];
    NSLog(@"DDDDDDDDDDD %@",time);
    
    NSRange range1 = NSMakeRange(0, 4);
    NSString * time1 = [timeIng.xFlightDate substringWithRange:range1];
    NSLog(@"AAAAAAAAAAA %@",time1);
    
    NSRange range2 = NSMakeRange(5, 2);
    NSString *time2 = [timeIng.xFlightDate substringWithRange:range2];
    NSLog(@"CCCCCCCCCCC %@",time2);
    
    int timeData = [time intValue];
    int timeYue = [time2 intValue];
    int timeNian = [time1 intValue];
    int newData;
    
    if (timeYue == 1 || timeYue == 3 || timeYue == 5 || timeYue == 7 || timeYue == 8  ) {
        
        if (timeData == 31) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYeu,timeData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if(timeData >= 9 && timeData < 31){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }
        
        
        
    }
    
    else if (timeYue == 4 || timeYue == 6 || timeYue == 9 ){
        if (timeData == 30) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-0%d-0%d",time1,newYeu,timeData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if(timeData >=9 && timeData < 30){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }
        
        
    }else if (timeYue == 10){
        
        if (timeData == 31) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-0%d",time1,newYeu,timeData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if(timeData >=9 && timeData < 31){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }
        
    }else if (timeYue == 11){
        if (timeData == 30) {
            timeData = 1;
            int newYeu = timeYue + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%d-0%d",time1,newYeu,timeData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
        }else if(timeData < 9){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-0%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if(timeData >= 9 && timeData < 30){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
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
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if (timeData >= 9 && timeData < 31){
            
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
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
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
        }else if (timeData >= 9 ){
            newData = timeData + 1;
            myNewTime = [NSString stringWithFormat:@"%@-%@-%d",time1,time2,newData];
            NSLog(@"WWWWWWWWWWWW %@",myNewTime);
            
            
        }
        
        
    }
    
        NSString * str =[NSString stringWithFormat:@"%@%@",cscz,myNewTime];
        NSLog(@"00000000000000 %@",str);
        NSString * str1 = @"11119688";
        
        //加密
        NSString * string = [DesUtil encryptUseDES:str key:str1];
        NSLog(@"加密之后 %@",string);
        
        
        //加密转译
        NSString * adString =  [self addDesString:string];
        NSLog(@"加密后转译 %@",adString);
        
        
        //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
        NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
        NSLog(@"拼接好的串 %@",mstring);
        
        
        //将拼接好的串进行二次加密
        NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
        NSLog(@"二次加密 %@",oostring);
        
        
        //二次加密后得到的串进行转译
        NSString * tstring=[self addDesString:oostring];
        NSLog(@"二次加密转译 %@",tstring);
        
        
        if (erZim == nil) {
            NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,myNewTime,tstring];
            
            
            
            NSLog(@"asdsdsd%@",strUrL);
            NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
            
            yy_request = [ASIHTTPRequest requestWithURL:urll];
            [yy_request setTag:1001];
            [yy_request setDelegate:self];
            [yy_request startAsynchronous];
            
            start = YES;
            
        }
        else if(erZim != nil){
            
            NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,erZim,myNewTime,tstring];
            
            
            
            NSLog(@"asdsdsd%@",strUrL);
            NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
            
            yy_request = [ASIHTTPRequest requestWithURL:urll];
            [yy_request setTag:1001];
            [yy_request setDelegate:self];
            [yy_request startAsynchronous];
            
            start = YES;
        }
        
    }
}


-(void)httpAsi
{

    NSString * str =[NSString stringWithFormat:@"%@%@",cscz,rqcz];
    NSLog(@"00000000000000 %@",str);
    NSString * str1 = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:str1];
    NSLog(@"加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"加密后转译 %@",adString);
    
    
    //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
    NSLog(@"拼接好的串 %@",mstring);
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    
    if (erZim == nil) {
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,rqcz,tstring];
        
        
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1000];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
        
    }
    else if(erZim != nil){
        
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,erZim,rqcz,tstring];
        
        
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1000];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
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
    NSLog(@"3333333 %@",erZim);
        
         CGRect rect=self.view.bounds;
        
    
        
       
    
    
    
  //  schoolArray = [[NSMutableArray alloc] initWithCapacity:0];
    arr = [[NSMutableArray alloc] initWithCapacity:0];
    
    cellarray = [[NSMutableArray alloc] initWithCapacity:0];
    
    

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    UIButton * buttmn = [UIButton buttonWithType:UIButtonTypeCustom];
    buttmn.frame = CGRectMake(0, 0, 35, 25);
    [buttmn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [buttmn addTarget:self action:@selector(buttmnFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *askbtn = [[[UIBarButtonItem alloc] initWithCustomView:buttmn] autorelease];
    
    self.navigationItem.leftBarButtonItem = askbtn;
    
    tabelView = [[UITableView alloc]initWithFrame:CGRectMake(0, 40, 320, rect.size.height-90) style:UITableViewStylePlain];
    tabelView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    tabelView.delegate = self;
    tabelView.dataSource = self;
    [self.view addSubview:tabelView];
    
    [self buttoop];

    
    
    
    
    self.rzmdict = [NSDictionary dictionaryWithObjectsAndKeys:@"3Ua.png",@"四川航空股份有限公司",@"all.png",@"云南祥鹏航空有限责任公司",@"BKc.png",@"奥凯航空有限公司",@"CAd.png",@"中国国际航空公司",@"CZe.png",@"中国南方航空公司",@"all.png",@"成都航空有限公司",@"FMg.png",@"上海航空有限公司",@"G5h.png",@"北京首都航空公司",@"all.png",@"天津航空有限责任公司",@"HOj.png",@"上海吉祥航空有限公司",@"all.png",@"海南航空股份有限公司",@"KNl.png",@"中国联合航空有限公司",@"MFm.png",@"厦门航空有限公司",@"MUn.png",@"中国东方航空公司",@"PNo.png",@"西部航空有限责任公司",@"SCp.png",@"山东航空股份有限公司",@"ZHq.png",@"深圳航空有限责任公司",@"KYr.png",@"昆明航空有限公司",@"all.png",@"河北航空有限公司",@"all.png",@"幸福航空有限责任公司",@"all.png",@"华夏航空有限公司",@"CNv.png",@"大新华航空有限公司",@"VDw.png",@"河南航空有限公司",@"all.png",@"武汉东星航空有限公司",@"all.png",@"西藏航空有限公司",@"all.png",@"春秋航空有限公司",@"香港航空.png",@"香港航空",@"all.png",@"香港快运航空公司",nil];

    
    self.erzima=[NSDictionary dictionaryWithObjectsAndKeys:@"3U",@"四川航空股份有限公司",@"8L",@"云南祥鹏航空有限责任公司",@"BK",@"奥凯航空有限公司",@"CA",@"中国国际航空公司",@"CZ",@"中国南方航空公司",@"EU",@"成都航空有限公司",@"FM",@"上海航空有限公司",@"G5",@"华夏航空有限公司",@"GS",@"天津航空有限责任公司",@"HO",@"上海吉祥航空有限公司",@"HU",@"海南航空股份有限公司",@"KN",@"中国联合航空有限公司",@"MF",@"厦门航空有限公司",@"MU",@"中国东方航空公司",@"PN",@"西部航空有限责任公司",@"SC",@"山东航空股份有限公司",@"ZH",@"深圳航空有限责任公司",@"KY",@"昆明航空有限公司",@"NS",@"河北航空有限公司",@"JR",@"幸福航空有限责任公司",@"JD",@"北京首都航空公司",@"CN",@"大新华航空有限公司",@"VD",@"河南航空有限公司",@"8C",@"武汉东星航空有限公司",@"9C",@"春秋航空有限公司",@"TV",@"西藏航空有限公司" ,nil];
    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];

    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    [self.view addSubview:activity];
    [activity startAnimating];
  
    [self httpAsi];
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    wtview.hidden = YES;
    
    self.cellarray = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:indexPath.row]];
    
    NSLog(@"schoolArray  %d",[self.schoolArray count]);
    NSLog(@"cellarray  %d",[self.cellarray count]);
    
    
    MyNewXmlMolde * m = [self.cellarray objectAtIndex:0];
    NSLog(@"33333333 %@",m.xCarrier);
    
    
    NSRange rangN = NSMakeRange(0, 2);
    NSString * nianFen = [m.xDepTime substringWithRange:rangN];
    
    NSLog(@"1111111111111 is :%@",m.xDepTime);
    
    NSRange rangN1 = NSMakeRange(2, 2);
    NSString * nianFen1 = [m.xDepTime substringWithRange:rangN1];
    self.st1 = [NSString stringWithFormat:@"%@:%@",nianFen,nianFen1];
    
    NSLog(@"2222222%@",st1);
    NSRange rangN2 = NSMakeRange(0, 2);
    NSString * nianFen3 = [m.xArrTime substringWithRange:rangN2];
    
    NSRange rangN3 = NSMakeRange(2, 2);
    NSString * nianFen4 = [m.xArrTime substringWithRange:rangN3];
    self.st2 = [NSString stringWithFormat:@"%@:%@",nianFen3,nianFen4];

    
    
    _BerthViewController *Berth_vo=[[[_BerthViewController alloc]initWithArray:self.cellarray]autorelease];
    UINavigationController *nav=[[[UINavigationController alloc]initWithRootViewController:Berth_vo]autorelease];
    
    
    Berth_vo.timeStr1 = self.st1;
    Berth_vo.timeStr2 = self.st2;
    Berth_vo.chufaMing = self.chuFa;
    Berth_vo.didaMing = self.diDa;
    Berth_vo.cszima = self.cscz;
    Berth_vo.cszima2 = self.cscz2;
    Berth_vo.qiFeish = self.rqcz;
    Berth_vo.diDash = self.dRqca;
    Berth_vo.lov = self.rqcz;
    Berth_vo.ssi = self.dRqca;
    Berth_vo.myerzim = erZim;
    
    NSLog(@"二字吗 %@",erZim);
    
    Berth_vo.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    [tabelView deselectRowAtIndexPath:[tabelView indexPathForSelectedRow] animated:YES];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [schoolArray count];
    
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
        
            label_op = [[UILabel alloc] initWithFrame:CGRectMake(40, 5, 120, 20)];
            label_op.tag = 1001;
            label_op.font = [UIFont fontWithName:@"Arial" size:16];
            label_op.backgroundColor = [UIColor clearColor];
            label_op.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_op];
            
            label_as = [[UILabel alloc] initWithFrame:CGRectMake(40, 30, 120, 20)];
            label_as.tag = 1002;
            label_as.font = [UIFont fontWithName:@"Arial" size:16];
            label_as.backgroundColor = [UIColor clearColor];
            label_as.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_as];
        
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
        
            label_re = [[UILabel alloc] initWithFrame:CGRectMake(100, 55, 120, 15)];
            label_re.tag = 1003;
            label_re.font = [UIFont fontWithName:@"Arial" size:13];
            label_re.backgroundColor = [UIColor clearColor];
            label_re.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            
            label_re.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:label_re];
            
            label_ui=[[UILabel alloc]initWithFrame:CGRectMake(240, 15, 80, 30)];
            label_ui.tag=1004;
            label_ui.font=[UIFont fontWithName:@"Arial" size:15];
            label_ui.textColor = [UIColor colorWithRed:235/255.0 green:196/255.0 blue:67/255.0 alpha:1.0];
            label_ui.backgroundColor=[UIColor clearColor];
            label_ui.textAlignment=NSTextAlignmentCenter;
            [cell addSubview:label_ui];
            
            UIImageView * imgView_a = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 30, 30)];
            imgView_a.tag = 1005;
            [cell addSubview:imgView_a];
            [imgView_a release];

        
        
    }
    
    if ([schoolArray count] !=0) {
        self.cellarray = [self.schoolArray objectAtIndex:indexPath.row];
//        self.cellarray = [self.schoolArray objectAtIndex:indexPath.row];
        NSLog(@"school  %d",[self.schoolArray count]);
        NSLog(@"arry  %d",[self.cellarray count]);
        
        manItem = [self.cellarray objectAtIndex:0];
        NSMutableArray * a = [[[NSMutableArray alloc] initWithCapacity:0] autorelease];
      
        
        if ([self.cellarray count] > 1) {
            a = [self.cellarray objectAtIndex:1];
            NSLog(@"a  数组 %d",[a count]);
            twoItem = [a objectAtIndex:0];
        }

        
        
        as_lab.text = [NSString stringWithFormat:@"%@",manItem.xFlightDate];
         NSLog(@"cell 时间 %@ ",manItem.xFlightDate);
        
        
        NSRange rangN = NSMakeRange(0, 2);
        NSString * nianFen = [manItem.xDepTime substringWithRange:rangN];
        
         NSLog(@"1111111111111 is :%@",manItem.xDepTime);
        
        NSRange rangN1 = NSMakeRange(2, 2);
        NSString * nianFen1 = [manItem.xDepTime substringWithRange:rangN1];
        self.st1 = [NSString stringWithFormat:@"%@:%@",nianFen,nianFen1];
        
        NSLog(@"2222222%@",st1);
        NSRange rangN2 = NSMakeRange(0, 2);
        NSString * nianFen3 = [manItem.xArrTime substringWithRange:rangN2];
        
        NSRange rangN3 = NSMakeRange(2, 2);
        NSString * nianFen4 = [manItem.xArrTime substringWithRange:rangN3];
        self.st2 = [NSString stringWithFormat:@"%@:%@",nianFen3,nianFen4];
        
        UILabel * la = (UILabel *) [cell viewWithTag:1001];
        la.text = [NSString stringWithFormat:@"%@%@",manItem.xDepCityReferred,self.st1];
        
        UILabel * la2 = (UILabel *) [cell viewWithTag:1002];
        
        la2.text = [NSString stringWithFormat:@"%@%@",manItem.xArrCityReferred,self.st2];
      
            
        UILabel *  la3 = (UILabel *)[cell viewWithTag:1003];
        la3.text = [NSString stringWithFormat:@"航班号: %@",manItem.xFlightNo];
        
        UILabel * la5 = (UILabel *)[cell viewWithTag:1010];
        la5.text = [NSString stringWithFormat:@"%@",manItem.xCarrierReferred];
        
        UILabel * la6 = (UILabel *)[cell viewWithTag:1011];
        la6.text = [NSString stringWithFormat:@"折扣:%@%%",twoItem.ccDiscount];
        
        UILabel * la7 = (UILabel *)[cell viewWithTag:1012];
        la7.text = [NSString stringWithFormat:@"航站楼:%@",manItem.xDepTower];
        UILabel * la8 = (UILabel *)[cell viewWithTag:1013];
        la8.text = [NSString stringWithFormat:@"航站楼:%@",manItem.xArrTower];
      
        UILabel * la4 = (UILabel *) [cell viewWithTag:1004];
        la4.text = [NSString stringWithFormat:@"￥%@",twoItem.ccSinglePrice];
        
        UILabel * la9 = (UILabel *)[cell viewWithTag:1014];
        la9.text = [NSString stringWithFormat:@"机型:%@",manItem.xAircraft];
        UIImageView * image = (UIImageView*)[cell viewWithTag:1005];
        NSString * imger = [NSString stringWithFormat:@"%@",[rzmdict valueForKey:manItem.xCarrierFullName]];
        image.image = [UIImage imageNamed:imger];
        NSLog(@"%@",imger);
        
    }
    
      cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;
}

-(void)buttoop
{
    a_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [a_btn addTarget:self action:@selector(a_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:a_btn];
    
    b_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [b_btn addTarget:self action:@selector(b_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:b_btn];
    
  
    
    c_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [c_btn addTarget:self action:@selector(c_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:c_btn];
    
    d_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [d_btn addTarget:self action:@selector(d_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:d_btn];
    
    
    e_btn=[UIButton buttonWithType:UIButtonTypeCustom];
    [e_btn addTarget:self action:@selector(e_btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:e_btn];
    
    
        a_btn.frame=CGRectMake(2, 5,100 , 35);
        [a_btn setImage:[UIImage imageNamed:@"01-0001.png"] forState:UIControlStateNormal];

    
        as_lab=[[UILabel alloc] initWithFrame:CGRectMake(115, 5, 90, 35)];
        as_lab.backgroundColor=[UIColor clearColor];
        as_lab.textAlignment=NSTextAlignmentCenter;
        as_lab.font=[UIFont fontWithName:@"Arial" size:15];
        as_lab.textColor=[UIColor blackColor];
        as_lab.text=rqcz;
        [self.view addSubview:as_lab];
    
        c_btn.frame=CGRectMake(215, 5, 100, 35);
        [c_btn setImage:[UIImage imageNamed:@"01-0003.png"] forState:UIControlStateNormal];
        
        CGRect rect=self.view.bounds;
    
    
    if (IOS7_OR_LATER) {
        d_btn.frame=CGRectMake(20, rect.size.height-110, 120, 40);
        [d_btn setImage:[UIImage imageNamed:@"01-0004.png"] forState:UIControlStateNormal];
        
        e_btn.frame=CGRectMake(180, rect.size.height-110, 120, 40);
        [e_btn setImage:[UIImage imageNamed:@"01-0005.png"] forState:UIControlStateNormal];
    }else{
        d_btn.frame=CGRectMake(20, rect.size.height-90, 120, 40);
        [d_btn setImage:[UIImage imageNamed:@"01-0004.png"] forState:UIControlStateNormal];
        
        e_btn.frame=CGRectMake(180, rect.size.height-90, 120, 40);
        [e_btn setImage:[UIImage imageNamed:@"01-0005.png"] forState:UIControlStateNormal];
        
    }
    
}

-(void)shaixuan
{
    
    arrayBtn=[[NSMutableArray alloc]initWithCapacity:0];
        
    if (self.view.bounds.size.height > 460.0f) {
        
        wtview = [[[SXView alloc] initWithFrame:CGRectMake(20, 100, 280, 400)] autorelease];
        wtview.backgroundColor = [UIColor whiteColor];
        wtview.hidden = NO;
        [self.view addSubview:wtview];
        
        UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
        sxImage.image = [UIImage imageNamed:@"弹出框顶端机票.png"];
        [wtview addSubview:sxImage];
        [sxImage release];
        UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgeBtn.frame = CGRectMake(240, 2, 25, 25);
        imgeBtn.tag = 32;
        [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭机票.png"] forState:UIControlStateNormal];
        [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
        [wtview addSubview:imgeBtn];
        
        
    }else{
        
        wtview = [[[SXView alloc] initWithFrame:CGRectMake(20, 0, 280, 420)] autorelease];
        wtview.backgroundColor = [UIColor whiteColor];
        wtview.hidden = NO;
        [self.view addSubview:wtview];
        
        UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
        sxImage.image = [UIImage imageNamed:@"弹出框顶端机票.png"];
        [wtview addSubview:sxImage];
        [sxImage release];
        UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgeBtn.frame = CGRectMake(240, 2, 25, 25);
        imgeBtn.tag = 32;
        [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭机票.png"] forState:UIControlStateNormal];
        [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
        [wtview addSubview:imgeBtn];
    }

    
        for (int j= 0 ; j <[self.schoolArray count]; j++) {
            NSMutableArray * barr = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:j]];
            
            NSLog(@"schoolarray %d",[self.schoolArray count]);
            
            MyNewXmlMolde * btnItem = [barr objectAtIndex:0];
            
           
            
            if (j == 0) {
                
                
                [self.arrayBtn addObject:btnItem.xCarrierFullName];
                NSLog(@"%d",[arrayBtn count]);
                NSLog(@"%@",btnItem.xCarrierFullName);
                
                
            }else {
                
                int g = 0;
                int h = 0;
                
                
                for (int k = 0; k < [self.arrayBtn count]; k++) {
                    
                    NSLog(@"arrayBtn  %d",[arrayBtn count]);

                    NSString * staaa =[NSString stringWithFormat:@"%@",[self.arrayBtn objectAtIndex:k]];
                    
                    if ([staaa isEqualToString:btnItem.xCarrierFullName]) {
                        nowt = NO;
                        
                        g++;
                      
                    }else{
                        h++;
                    }
                    
                    
                }
                if (g==0) {
                    NSLog(@" hhhhhhhh %d",h);
                    NSLog(@" gggggggg %d",g);
                    
                    NSLog(@"BOOL 设定");
                    [self.arrayBtn addObject:btnItem.xCarrierFullName];
                 
                    
                }
                
                
            }
            [barr removeAllObjects];
            
        }
        for (int p = 0 ; p < [self.arrayBtn count]; p++) {
            
            NSLog(@"%@",[NSString stringWithFormat:@"%@",[self.arrayBtn objectAtIndex:p]]);
            
        }
        
        
    for (int i= 0; i < [self.arrayBtn count]; i++) {
        UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn1 setImage:[UIImage imageNamed:@"弹出按钮机票000.png"] forState:UIControlStateNormal];
        btn1.frame=CGRectMake(10 , i*40+40, 260, 30);
        
        
        UILabel * labtn1 = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, 240, 30)];
        labtn1.font = [UIFont fontWithName:@"Arial" size:20];
        labtn1.backgroundColor = [UIColor clearColor];
        labtn1.textAlignment = NSTextAlignmentCenter;
        labtn1.text = [NSString stringWithFormat:@"%@",[self.arrayBtn objectAtIndex:i]];
        labtn1.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
        [btn1 addSubview:labtn1];
        [labtn1 release];
        [btn1 addTarget:self action:@selector(btnParessed:) forControlEvents:UIControlEventTouchUpInside];
        btn1.tag=0 + i ;
        [wtview addSubview:btn1];
        
    }


}

-(void)httpShaixun:(NSString *)Shaixun
{
    
    
    NSString * str =[NSString stringWithFormat:@"%@%@",cscz,rqcz];
    NSLog(@"00000000000000 %@",str);
    NSString * str1 = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:str1];
    NSLog(@"加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"加密后转译 %@",adString);
    
    
    //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
    NSLog(@"拼接好的串 %@",mstring);
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    
    
    
    NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sign=%@",cscz,cscz2,Shaixun,rqcz,tstring];
    
    
    
    NSLog(@"asdsdsd%@",strUrL);
    NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
    
    yy_request = [ASIHTTPRequest requestWithURL:urll];
    [yy_request setTag:1003];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    start = YES;
    
    
}


-(void)paixu
{
    if (self.view.bounds.size.height > 460.0f) {
        
        wtview = [[[SXView alloc] initWithFrame:CGRectMake(20, 280, 280, 227)] autorelease];
        wtview.backgroundColor = [UIColor whiteColor];
        wtview.hidden = NO;
        [self.view addSubview:wtview];
        
        UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
        sxImage.image = [UIImage imageNamed:@"弹出框顶端机票.png"];
        [wtview addSubview:sxImage];
        [sxImage release];
        UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgeBtn.frame = CGRectMake(240, 2, 25, 25);
        imgeBtn.tag = 32;
        [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭机票.png"] forState:UIControlStateNormal];
        [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
        [wtview addSubview:imgeBtn];
        
        
    }else{
        
        wtview = [[[SXView alloc] initWithFrame:CGRectMake(20, 180, 280, 230)] autorelease];
        wtview.backgroundColor = [UIColor whiteColor];
        wtview.hidden = NO;
        [self.view addSubview:wtview];
        
        UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
        sxImage.image = [UIImage imageNamed:@"弹出框顶端机票.png"];
        [wtview addSubview:sxImage];
        [sxImage release];
        UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        imgeBtn.frame = CGRectMake(240, 2, 25, 25);
        imgeBtn.tag = 32;
        [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭机票.png"] forState:UIControlStateNormal];
        [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
        [wtview addSubview:imgeBtn];
    }
    
    UIButton *bbtn1=[UIButton buttonWithType:UIButtonTypeCustom];
    bbtn1.frame=CGRectMake(40, 40, 200, 30);
    [bbtn1 addTarget:self action:@selector(bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [bbtn1 setImage:[UIImage imageNamed:@"弹出按钮机票.png"] forState:UIControlStateNormal];
    bbtn1.tag=301;
    [wtview addSubview:bbtn1];
    
    UILabel *la1=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 180, 30)];
    la1.text=@"出发时间从早到晚";
    la1.backgroundColor=[UIColor clearColor];
    la1.font=[UIFont fontWithName:@"Arial" size:20];
    la1.textAlignment=NSTextAlignmentCenter;
    la1.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    [bbtn1 addSubview:la1];
    [la1 release];
    
    
    UIButton *bbtn2=[UIButton buttonWithType:UIButtonTypeCustom];
    bbtn2.frame=CGRectMake(40, 85, 200, 30);
    [bbtn2 addTarget:self action:@selector(bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [bbtn2 setImage:[UIImage imageNamed:@"弹出按钮机票.png"] forState:UIControlStateNormal];
    bbtn2.tag=302;
    [wtview addSubview:bbtn2];
    
    UILabel *la2=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 180, 30)];
    la2.text=@"出发时间从晚到早";
    la2.backgroundColor=[UIColor clearColor];
    la2.font=[UIFont fontWithName:@"Arial" size:20];
    la2.textAlignment=NSTextAlignmentCenter;
    la2.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    [bbtn2 addSubview:la2];
    [la2 release];
    
    
    
    UIButton *bbtn3=[UIButton buttonWithType:UIButtonTypeCustom];
    bbtn3.frame=CGRectMake(40, 130, 200, 30);
    [bbtn3 addTarget:self action:@selector(bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [bbtn3 setImage:[UIImage imageNamed:@"弹出按钮机票.png"] forState:UIControlStateNormal];
    bbtn3.tag=303;
    [wtview addSubview:bbtn3];
    
    UILabel *la3=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 180, 30)];
    la3.text=@"价格从少到多";
    la3.backgroundColor=[UIColor clearColor];
    la3.font=[UIFont fontWithName:@"Arial" size:20];
    la3.textAlignment=NSTextAlignmentCenter;
    la3.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    [bbtn3 addSubview:la3];
    [la3 release];
    
    
    
    UIButton *bbtn4=[UIButton buttonWithType:UIButtonTypeCustom];
    bbtn4.frame=CGRectMake(40, 175, 200, 30);
    [bbtn4 addTarget:self action:@selector(bbtnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [bbtn4 setImage:[UIImage imageNamed:@"弹出按钮机票.png"] forState:UIControlStateNormal];
    bbtn4.tag=304;
    [wtview addSubview:bbtn4];
    
    UILabel *la4=[[UILabel alloc]initWithFrame:CGRectMake(10, 0, 180, 30)];
    la4.text=@"价格从多到少";
    la4.backgroundColor=[UIColor clearColor];
    la4.font=[UIFont fontWithName:@"Arial" size:20];
    la4.textAlignment=NSTextAlignmentCenter;
    la4.textColor=[UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    [bbtn4 addSubview:la4];
    [la4 release];

}

-(void)guanBi:(UIButton *)button
{
    
    
    if (button.tag == 32) {
        wtview.hidden = YES;
        
    }
    
}

-(void)btnParessed:(UIButton *)button
{
    
   
    
    [activity startAnimating];
    
    if (button.tag == 0) {
        NSLog(@"button 1");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
         wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 1){
        NSLog(@"button 2");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 2){
        NSLog(@"button 3");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 3){
        NSLog(@"button 4");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 4){
        NSLog(@"button 5");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 5){
        NSLog(@"button 6");
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden=YES;
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 6){
        NSLog(@"button 7");
        
        wtview.hidden=YES;
        
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        NSLog(@"button str %@",butStr);
        self.st=[NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        [self httpShaixun:self.st];
        
        
    }else if (button.tag == 7){
        NSString * butStr = [arrayBtn objectAtIndex:button.tag];
        
        self.st = [NSString stringWithFormat:@"%@",[self.erzima objectForKey:butStr]];
        
        wtview.hidden = YES;
        
        [self httpShaixun:self.st];
        
    }

    
    
}
-(void)httpStr1:(NSString * )tt1 WithStr2:(NSString *)tt2
{
    NSString * str =[NSString stringWithFormat:@"%@%@",cscz,rqcz];
    NSLog(@"00000000000000 %@",str);
    NSString * str1 = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:str1];
    NSLog(@"加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"加密后转译 %@",adString);
    
    
    //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
    NSLog(@"拼接好的串 %@",mstring);
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    
    if (erZim == nil) {
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sortby=%@&sorttype=%@&sign=%@",cscz,cscz2,rqcz,tt1,tt2,tstring];
        
        
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1004];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
        
    }
    else if(erZim != nil){
        
        NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sortby=%@&sorttype=%@&sign=%@",cscz,cscz2,erZim,rqcz,tt1,tt2,tstring];
        
        
        
        NSLog(@"asdsdsd%@",strUrL);
        NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
        
        yy_request = [ASIHTTPRequest requestWithURL:urll];
        [yy_request setTag:1004];
        [yy_request setDelegate:self];
        [yy_request startAsynchronous];
        
        start = YES;
    }
    
    
}

-(void)httpStr3:(NSString *)tt3 WithStr4:(NSString *)tt4 WithStr5:(NSString *)tt5
{
    
    
    NSString * str =[NSString stringWithFormat:@"%@%@",cscz,rqcz];
    NSLog(@"00000000000000 %@",str);
    NSString * str1 = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:str1];
    NSLog(@"加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"加密后转译 %@",adString);
    
    
    //将第一次加密得到的串和iphone#depCity|flightDate#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#depCity|flightDate#%@",adString];
    NSLog(@"拼接好的串 %@",mstring);
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:str1];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    
    
    NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:8080/?cmd=av&output=json&depCity=%@&arrCity=%@&carrier=%@&flightDate=%@&officeCode=PEK559&filter=1&twohour=1&sortby=%@&sorttype=%@&sign=%@",cscz,cscz2,tt3,rqcz,tt4,tt5,tstring];
    
    
    
    NSLog(@"asdsdsd%@",strUrL);
    NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
    
    yy_request = [ASIHTTPRequest requestWithURL:urll];
    [yy_request setTag:1005];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    start = YES;


    
}



-(void)bbtnPressed:(UIButton *)button
{
    wtview.hidden = YES;
    
    [activity startAnimating];
    
    if (self.st==nil) {
    
    if (button.tag == 301) {
        
        
        NSString * str = @"1";
        NSString * str2 = @"ASC";
        
        wtview.hidden=YES;
        [activity stopAnimating];
        
        [self httpStr1:str WithStr2:str2];
    }else if (button.tag == 302){
       
        
        NSString * str = @"2";
        NSString * str2 = @"DESC";
        
        wtview.hidden=YES;
        [activity stopAnimating];
        
        [self httpStr1:str WithStr2:str2];
        
    }else if (button.tag == 303){
        
//        NSString * str = @"3";
//        NSString * str2 = @"ASC";
        
        wtview.hidden=YES;
        [activity stopAnimating];
        
       // [self httpStr1:str WithStr2:str2];
        
        
        //排序
        NSLog(@"button paixun");
        int temp=0;
        NSMutableArray * as = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray * ass = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray * add = [[NSMutableArray alloc] initWithCapacity:0];
        
        MyNewXmlMolde * ms = [[MyNewXmlMolde alloc] init];
        // MyNewXmlMolde * mss = [[MyNewXmlMolde alloc] init];
        NSLog(@"school %d",self.schoolArray.count);
       // NSLog(@"ary %d",aryPaixun.count);
        
        for (int i = 0; i<[self.schoolArray count]; i++)
        {
            as = [self.schoolArray objectAtIndex:i];
            
            NSLog(@"as %d",as.count);
            
            ass = [as objectAtIndex:1];
            ms = [ass objectAtIndex:0];
            NSLog(@"%@",ms.ccSinglePrice);
            [add addObject:ms.ccSinglePrice];
            
            
            
            
        }
        
        
        NSLog(@"/*************升序***************/");
        NSLog(@"add  %d",add.count);
        NSLog(@"%@",add);
        for (int i = 0; i<[add count]; i++)
        {
            NSLog(@"%@",[add objectAtIndex:i]);
        }
        
        
        NSMutableArray* aryTemp = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i<[add count]; i++)
        {
            for (int j=i+1; j<[add count]; j++)
            {
                if ([[add objectAtIndex:i] intValue] > [[add objectAtIndex:j] intValue])
                {
                    temp = [[add objectAtIndex:i]intValue];
                    aryTemp = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:i]];
                    
                    [add replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[add objectAtIndex:j] intValue]]];
                    [self.schoolArray replaceObjectAtIndex:i withObject:[self.schoolArray objectAtIndex:j]];
                    
                    [add replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",temp]];
                    
                    [self.schoolArray replaceObjectAtIndex:j withObject:aryTemp];
                    
                }
                
            }
        }
        NSLog(@"/*************升序完成***************/");
        
        NSLog(@"add  %d",add.count);
        NSLog(@"%@",add);
        for (int i = 0; i<[add count]; i++)
        {
            NSLog(@"%@",[add objectAtIndex:i]);
        }
        
        [tabelView reloadData];
        

        
        
        
    }else if (button.tag == 304){
        
//        NSString * str = @"3";
//        NSString * str2 = @"DESC";
//        [self httpStr1:str WithStr2:str2];
        
        wtview.hidden=YES;
        [activity stopAnimating];
        
        //排序 从多到少
        NSLog(@"button paixun");
        int temp=0;
        NSMutableArray * as = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray * ass = [[NSMutableArray alloc] initWithCapacity:0];
        NSMutableArray * add = [[NSMutableArray alloc] initWithCapacity:0];
        
        MyNewXmlMolde * ms = [[MyNewXmlMolde alloc] init];
        // MyNewXmlMolde * mss = [[MyNewXmlMolde alloc] init];
        NSLog(@"school %d",self.schoolArray.count);
        //NSLog(@"ary %d",aryPaixun.count);
        
        for (int i = 0; i<[self.schoolArray count]; i++)
        {
            as = [self.schoolArray objectAtIndex:i];
            
            NSLog(@"as %d",as.count);
            
            ass = [as objectAtIndex:1];
            ms = [ass objectAtIndex:0];
            NSLog(@"%@",ms.ccSinglePrice);
            [add addObject:ms.ccSinglePrice];
            
            
            
            
        }
        
        
        NSLog(@"/*************降序***************/");
        NSLog(@"add  %d",add.count);
        NSLog(@"%@",add);
        for (int i = 0; i<[add count]; i++)
        {
            NSLog(@"%@",[add objectAtIndex:i]);
        }
        
        
        NSMutableArray* aryTemp = [[NSMutableArray alloc] initWithCapacity:0];
        for (int i = 0; i<[add count]; i++)
        {
            for (int j=i+1; j<[add count]; j++)
            {
                if ([[add objectAtIndex:j] intValue] > [[add objectAtIndex:i] intValue])
                {
                    temp = [[add objectAtIndex:j]intValue];
                    aryTemp = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:j]];
                    
                    [add replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",[[add objectAtIndex:i] intValue]]];
                    [self.schoolArray replaceObjectAtIndex:j withObject:[self.schoolArray objectAtIndex:i]];
                    
                    [add replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",temp]];
                    
                    [self.schoolArray replaceObjectAtIndex:i withObject:aryTemp];
                    
                }
                
            }
        }
        NSLog(@"/*************降序完成***************/");
        
        NSLog(@"add  %d",add.count);
        NSLog(@"%@",add);
        for (int i = 0; i<[add count]; i++)
        {
            NSLog(@"%@",[add objectAtIndex:i]);
        }
        
        [tabelView reloadData];
        
        
        
        
        
        
        
        }
        
    }else{
        
       
        if (button.tag == 301) {
            NSLog(@"button p1");
            
            NSString * str = @"1";
            NSString * str2 = @"ASC";
            
            wtview.hidden=YES;
            [activity stopAnimating];
            
            [self httpStr3:self.st WithStr4:str WithStr5:str2];
            
        }
        
        else if (button.tag == 302){
           
            
            NSString * str = @"2";
            NSString * str2 = @"DESC";
            
            wtview.hidden=YES;
            [activity stopAnimating];
            
            [self httpStr3:self.st WithStr4:str WithStr5:str2];
            
        }else if (button.tag == 303){
            
            
//            NSString * str = @"3";
//            NSString * str2 = @"ASC";
            
            wtview.hidden=YES;
            [activity stopAnimating];
            
          //  [self httpStr3:self.st WithStr4:str WithStr5:str2];
            
            
            
            //排序
            NSLog(@"button paixun");
            int temp=0;
            NSMutableArray * as = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableArray * ass = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableArray * add = [[NSMutableArray alloc] initWithCapacity:0];
            
            MyNewXmlMolde * ms = [[MyNewXmlMolde alloc] init];
            // MyNewXmlMolde * mss = [[MyNewXmlMolde alloc] init];
            NSLog(@"school %d",self.schoolArray.count);
            // NSLog(@"ary %d",aryPaixun.count);
            
            for (int i = 0; i<[self.schoolArray count]; i++)
            {
                as = [self.schoolArray objectAtIndex:i];
                
                NSLog(@"as %d",as.count);
                
                ass = [as objectAtIndex:1];
                ms = [ass objectAtIndex:0];
                NSLog(@"%@",ms.ccSinglePrice);
                [add addObject:ms.ccSinglePrice];
                
                
                
                
            }
            
            
            NSLog(@"/*************升序***************/");
            NSLog(@"add  %d",add.count);
            NSLog(@"%@",add);
            for (int i = 0; i<[add count]; i++)
            {
                NSLog(@"%@",[add objectAtIndex:i]);
            }
            
            
            NSMutableArray* aryTemp = [[NSMutableArray alloc] initWithCapacity:0];
            for (int i = 0; i<[add count]; i++)
            {
                for (int j=i+1; j<[add count]; j++)
                {
                    if ([[add objectAtIndex:i] intValue] > [[add objectAtIndex:j] intValue])
                    {
                        temp = [[add objectAtIndex:i]intValue];
                        aryTemp = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:i]];
                        
                        [add replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",[[add objectAtIndex:j] intValue]]];
                        [self.schoolArray replaceObjectAtIndex:i withObject:[self.schoolArray objectAtIndex:j]];
                        
                        [add replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",temp]];
                        
                        [self.schoolArray replaceObjectAtIndex:j withObject:aryTemp];
                        
                    }
                    
                }
            }
            NSLog(@"/*************升序完成***************/");
            
            NSLog(@"add  %d",add.count);
            NSLog(@"%@",add);
            for (int i = 0; i<[add count]; i++)
            {
                NSLog(@"%@",[add objectAtIndex:i]);
            }
            
            [tabelView reloadData];
            
            
            
            
            
            
            
            
        }else if (button.tag == 304){
            
//            
//            NSString * str = @"3";
//            NSString * str2 = @"DESC";
            
            wtview.hidden=YES;
            [activity stopAnimating];
            
           // [self httpStr3:self.st WithStr4:str WithStr5:str2];
            
            
            //排序 从多到少
            NSLog(@"button paixun");
            int temp=0;
            NSMutableArray * as = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableArray * ass = [[NSMutableArray alloc] initWithCapacity:0];
            NSMutableArray * add = [[NSMutableArray alloc] initWithCapacity:0];
            
            MyNewXmlMolde * ms = [[MyNewXmlMolde alloc] init];
            // MyNewXmlMolde * mss = [[MyNewXmlMolde alloc] init];
            NSLog(@"school %d",self.schoolArray.count);
            //NSLog(@"ary %d",aryPaixun.count);
            
            for (int i = 0; i<[self.schoolArray count]; i++)
            {
                as = [self.schoolArray objectAtIndex:i];
                
                NSLog(@"as %d",as.count);
                
                ass = [as objectAtIndex:1];
                ms = [ass objectAtIndex:0];
                NSLog(@"%@",ms.ccSinglePrice);
                [add addObject:ms.ccSinglePrice];
                
                
                
                
            }
            
            
            NSLog(@"/*************降序***************/");
            NSLog(@"add  %d",add.count);
            NSLog(@"%@",add);
            for (int i = 0; i<[add count]; i++)
            {
                NSLog(@"%@",[add objectAtIndex:i]);
            }
            
            
            NSMutableArray* aryTemp = [[NSMutableArray alloc] initWithCapacity:0];
            for (int i = 0; i<[add count]; i++)
            {
                for (int j=i+1; j<[add count]; j++)
                {
                    if ([[add objectAtIndex:j] intValue] > [[add objectAtIndex:i] intValue])
                    {
                        temp = [[add objectAtIndex:j]intValue];
                        aryTemp = [NSMutableArray arrayWithArray:[self.schoolArray objectAtIndex:j]];
                        
                        [add replaceObjectAtIndex:j withObject:[NSString stringWithFormat:@"%d",[[add objectAtIndex:i] intValue]]];
                        [self.schoolArray replaceObjectAtIndex:j withObject:[self.schoolArray objectAtIndex:i]];
                        
                        [add replaceObjectAtIndex:i withObject:[NSString stringWithFormat:@"%d",temp]];
                        
                        [self.schoolArray replaceObjectAtIndex:i withObject:aryTemp];
                        
                    }
                    
                }
            }
            NSLog(@"/*************降序完成***************/");
            
            NSLog(@"add  %d",add.count);
            NSLog(@"%@",add);
            for (int i = 0; i<[add count]; i++)
            {
                NSLog(@"%@",[add objectAtIndex:i]);
            }
            
            [tabelView reloadData];
            

            
            
            
            
        }
        
    }
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


-(void)a_btnPressed:(UIButton *)button;
{
    
    [self httpOn];
    
    [activity startAnimating];
}
-(void)b_btnPressed:(UIButton *)button;
{
    NSLog(@"w");
}
-(void)c_btnPressed:(UIButton *)button;
{
    
    [self httpNext];
    
    [activity startAnimating];
}
-(void)d_btnPressed:(UIButton *)button;
{
    
    _sc.hidden=YES;
    [self shaixuan];
}
-(void)e_btnPressed:(UIButton *)button;
{
   
    _sc.hidden=YES;
     [self paixu];
}



-(void)buttmnFanHui:(UIButton *)button
{
    
    if (start == YES) {
        [yy_request clearDelegatesAndCancel];
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(void)dealloc
{
    [super dealloc];
    [label_op release];
    [label_as release];
    [label_re release];
    [label_ui release];
    [as_lab release];
    [tabelView release];
    [st1 release];
    [st2 release];
    [chuFa release];
    [diDa release];
    [dRqca release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
