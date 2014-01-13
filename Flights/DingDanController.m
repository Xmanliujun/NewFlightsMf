//
//  DingDanController.m
//  Flights
//
//  Created by XmL on 12-11-12.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "DingDanController.h"
#import "TijiaoViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "DengLuXML.h"
#import "MyNewXmlMolde.h"
#import "DesUtil.h"
#import "YuDingXMLaa.h"
@interface DingDanController ()

@end

@implementation DingDanController

@synthesize myNewItem;
@synthesize array,sten,ster,yueJm,myArray;
@synthesize str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,str01,str02,str16,str17,str18,str19;
@synthesize nawAaay;
@synthesize User_id;
@synthesize gEleStart,yy_request;
@synthesize sanzima,sanzima2;
@synthesize yy_pnr,dingdanhao;
@synthesize xitongTime;
@synthesize zongPJ;
@synthesize trString,twString;
@synthesize yy_Zhe;
@synthesize yy_QiFei,yy_DiDa,yy_JiaGe,yy_JiJian,yy_RanYou,yy_TuiGai,yy_jixing,bao;
@synthesize y_zop;
@synthesize y_srr;
@synthesize yy_aLoup,yy_bLoup,klstring;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
    
}
-(id)initWithItem:(MyNewXmlMolde *)yuDingItem WithArray:(NSMutableArray *)marray
{
    if (self = [super init]) {
        self.myNewItem = yuDingItem ;
        self.nawAaay = [NSMutableArray arrayWithArray:marray];
        
        NSLog(@"1111111111 %@ ",self.myNewItem.ccSinglePrice);
        NSLog(@"2222222222 %@ ",self.myNewItem.ccTax);
        NSLog(@"3333333333 %@ ",self.myNewItem.ccFuel);
        
    }

    return self;
}
-(void)dealloc
{
    [array release];
    [newArray release];
    [myNewItem release];
    [nawAaay release];
    

    
    [super dealloc];
}
-(void)btnb_bxoFanHui:(UIButton *)button
{
    
    if (gEleStart == YES) {
        [gEleRequest clearDelegatesAndCancel];
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    }else{
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    }
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


-(void)httpYuDing
{
    

    
#pragma mark 当前日期加2小时
    
    NSLog(@"启动下载");

    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"HH:mm"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    
    NSLog(@"系统时间 %@",locationString);
    
    NSRange rangen = NSMakeRange(0, 2);
    NSString * xtrq = [locationString substringWithRange:rangen];
    NSLog(@"截取字符串后 %@",xtrq);
    
    NSRange rangen2 = NSMakeRange(2, 3);
    NSString *xtrq2 = [locationString substringWithRange:rangen2];
    NSLog(@"~~~~~~~~ %@",xtrq2);
    
    
    int i = [xtrq intValue];
    NSLog(@"i %d",i);
    
    int k = 2;
    
    int g = i+k;
    
    NSLog(@"aaaaaaaaaaa %d",g);
    
    int y = g;
    
    NSString * loup = [NSString stringWithFormat:@"%d",y];
    
    NSLog(@"int转成字符串 %@",loup);
    
    NSString *yy = [NSString stringWithFormat:@"%@%@",loup,xtrq2];
    NSLog(@"拼完字符串 %@",yy);
    
#pragma mark 当前时间-30分钟
    
    
    
    
    NSRange rangen3 = NSMakeRange(0, 2);
    NSString * st = [locationString substringWithRange:rangen3];
    NSLog(@"ststst %@",st);
    
    int o = [st intValue];
    NSLog(@"oooo %d",o);
    
    
    NSRange rangen4 = NSMakeRange(3, 2);
    NSString *sy = [locationString substringWithRange:rangen4];
    NSLog(@"sysysy %@",sy);
    int p = [sy intValue];
    
    
    int q = 30;
    
    int m = p-q;
    
    NSLog(@"mmmmmmmm %d",m);
    
    
    
    
    
    if (m < 0 &&  m != 0 ) {
        int ma = m+60;
        NSLog(@"111111111 %d",ma);
        int ka = o-1;
        NSLog(@"111111111 %d",ka);
        
        hah = [NSString stringWithFormat:@"%d:%d",ka,ma];
        NSLog(@"111111111 %@",hah);
        
    }else if (m > 0 && m != 0){
        
        if (m < 9) {
            hah = [NSString stringWithFormat:@"%d:0%d",o,m];
            NSLog(@"222222222 %@",hah);
        }
        else{
            
            hah = [NSString stringWithFormat:@"%d:%d",o,m];
            NSLog(@"2222222** %@",hah);
        }
        
    } else if (m == 0 ) {
        
        
        int ma = 0;
        
        hah = [NSString stringWithFormat:@"%d:0%d",o,ma];
        NSLog(@"333333333 %@",hah);
        
    }

    
#pragma mark  获取系统当前日期
    
    NSDate *nowData = [NSDate date];
    xitongTime=[NSString stringWithFormat:@"%@",[self GetTomorrowDay:nowData WithDay:0]];
    
    NSLog(@"888888888888888888888 %@", xitongTime);
    
#pragma mark 截取航空公司二字码
    trString = [NSString stringWithFormat:@"%@",str6];
    twString = [trString substringToIndex:2];
    NSLog(@"截取后的二字码 %@ ",twString);
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.str2 = [defaults objectForKey:@"Passport_no"];
  //  NSString * shFzhengNo = [defaults objectForKey:@"Passport_no"];
    
    NSLog(@"pass %@",str2);
    
#pragma mark 乘机三人组加密
     if (str16!=nil && str17!=nil&&str18 != nil&&str19!=nil) {
    NSString * yy_bStr = [NSString stringWithFormat:@"1|%@|NI|%@||false||#1|%@|NI|%@||false||#1|%@|NI|%@||false||",str1,str2,str16,str17,str18,str19];
    
    NSLog(@"乘机三人组拼串 %@",yy_bStr);
    
    NSString * yy_bKey = @"11119688";
    
    NSString *yy_bString = [DesUtil encryptUseDES:yy_bStr key:yy_bKey];
    NSLog(@"乘机三人组加密之后 %@ ",yy_bString);
    
    yy_bLoup = [self addDesString:yy_bString];
    NSLog(@"乘机三人组加密后转译 %@ ",yy_bLoup);
    
     }

#pragma mark 乘机双人组加密
    
    
    
    if (str16!=nil && str17!=nil) {
        
    
    NSString *yy_aStr = [NSString stringWithFormat:@"1|%@|NI|%@||false||#1|%@|NI|%@||false||",str1,str2,str16,str17];
    
    NSLog(@"乘机双人组拼串 %@",yy_aStr);
    
    NSString * yy_aKey = @"11119688";
    
    NSString *yy_aString = [DesUtil encryptUseDES:yy_aStr key:yy_aKey];
    NSLog(@"乘机双人组加密之后 %@ ",yy_aString);
    
   yy_aLoup = [self addDesString:yy_aString];
    NSLog(@"乘机双人组加密后转译 %@ ",yy_aLoup);
    }
    
#pragma mark 单人预定
    
    NSString * str =[NSString stringWithFormat:@"%@|%@|%@|%@|%@",sanzima,sanzima2,str8,str6,str13];
    NSLog(@"航线组拼串  %@",str);
    NSString * y_str = @"11119688";
    
    //加密
    NSString * string = [DesUtil encryptUseDES:str key:y_str];
    NSLog(@"航线组加密之后 %@",string);
    
    
    //加密转译
    NSString * adString =  [self addDesString:string];
    NSLog(@"航线组加密后转译 %@",adString);
    
    NSLog(@"str2 %@",str2);
    if (str2!=nil) {
        
    
    NSString * op = [NSString stringWithFormat:@"1|%@|NI|%@||false||",str1,str2];
    NSLog(@"乘机人组拼串 %@ ",op);
    NSString * y_op = @"11119688";
    
    //加密
    NSString *opstring = [DesUtil encryptUseDES:op key:y_op];
    NSLog(@"乘机人组加密之后 %@ ",opstring);
    
    //加密转译
    klstring = [self addDesString:opstring];
    NSLog(@"乘机人组加密后转译 %@ ",klstring);
    
    }
    NSString *po = [NSString stringWithFormat:@"%@",twString];
    NSLog(@"航空公司二字码 %@",po);
    NSString * y_po = @"11119688";
    
    NSString *postring = [DesUtil encryptUseDES:po key:y_po];
    NSLog(@"航空公司二字码加密后 %@",postring);
    
    NSString *mn = [self addDesString:postring];
    NSLog(@"航空公司加密后转译 %@",mn);
    
    
    
    
    
    
    //将航空公司二字码加密得到的串和iphone#carrier#进行拼接
    NSString *mstring=[NSString stringWithFormat:@"iphone#carrier#%@",mn];
    NSLog(@"拼接好的串 %@",mstring);
    NSString *ssin = @"11119688";
    
    
    
    //将拼接好的串进行二次加密
    NSString * oostring=[DesUtil encryptUseDES:mstring key:ssin];
    NSLog(@"二次加密 %@",oostring);
    
    
    //二次加密后得到的串进行转译
    NSString * tstring=[self addDesString:oostring];
    NSLog(@"二次加密转译 %@",tstring);
    
    
    
    if ([str8 isEqualToString:xitongTime]) {
        if ([str4 isEqualToString:@"1"]) {
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, hah,str5,adString,klstring,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }else if ([str4 isEqualToString:@"2"]){
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, hah,str5,adString,yy_aLoup,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }
        else if ([str4 isEqualToString:@"3"]){
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, hah,str5,adString,yy_bLoup,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }

    }
        
       else if ([str4 isEqualToString:@"1"]) {
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, yy,str5,adString,klstring,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }else if ([str4 isEqualToString:@"2"]){
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, yy,str5,adString,yy_aLoup,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }
        else if ([str4 isEqualToString:@"3"]){
            
            NSString * urq33 = [NSString stringWithFormat: @"cmd=ss&output=json&bookType=1&carrier=%@&officeCode=CGQ182&tk=%@ %@&ct=%@&routes=%@&passengers=%@&sign=%@",twString,xitongTime, yy,str5,adString,yy_bLoup,tstring];
            
            
            NSLog(@" %@",urq33);
            
            NSString * ur = [NSString stringWithFormat:@"%@",urq33];
            
            NSString * encodedString = [(NSString *)CFURLCreateStringByAddingPercentEscapes(NULL,(CFStringRef)ur,NULL,(CFStringRef)@"' '",kCFStringEncodingUTF8 ) autorelease];
            
            NSString * uar = [NSString stringWithFormat:@"http://139.210.99.29:8080/?%@",encodedString];
            
            NSURL * urll = [NSURL URLWithString:uar];
            
            NSLog(@"%@",uar);
            ASIHTTPRequest * request = [ASIHTTPRequest requestWithURL:urll];
            
            [request setTag:1000];
            [request setDelegate:self];
            [request setTimeOutSeconds:100];
            [request startAsynchronous];
            
            [activity startAnimating];
            
            gEleStart = YES;
            
            
        }




}

-(NSString *)jsonStringDict:(NSDictionary *)responseDate
{
    
    self.yy_pnr = [responseDate objectForKey:@"Pnr"];
    
       
    return self.yy_pnr;
}


-(void)DingDanHaoHttp:(NSString *)spen
{
    
    
    NSString * strUrL = [NSString stringWithFormat:@"http://139.210.99.29:83/interface/Get_Order_Resid1.php?order_pnr=%@",spen];
    
    
    
    NSLog(@"asdsdsd%@",strUrL);
    NSURL * urll = [NSURL URLWithString:[NSString stringWithFormat:@"%@",strUrL]];
    
    yy_request = [ASIHTTPRequest requestWithURL:urll];
    [yy_request setTag:1001];
    [yy_request setDelegate:self];
    [yy_request startAsynchronous];
    
    gEleStart = YES;
    
    
}

-(void)gElevenHttp
{
   
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSString * duser_ID = [defaults objectForKey:@"duser_ID"];
    NSLog(@"duser_ID %@",duser_ID);
    
    NSString * dcompany = [defaults objectForKey:@"dcompany"];
    NSLog(@"dcompany %@ ",dcompany);
    
    NSString * ddept_ID = [defaults objectForKey:@"dept_ID"];
    NSLog(@"ddept_ID %@ ",ddept_ID);


    NSString *syString = [NSString stringWithFormat:@"%@",str6];
    
    NSString *mp = [syString substringToIndex:2];
    

    if ([str14 isEqualToString:@"不买"]) {
        
        str14 = @"0";
        
    }else if ([str14 isEqualToString:@"1份"]){
        
        str14 = @"1";
        
    }else if ([str14 isEqualToString:@"2份"]){
        
        str14 = @"2";
    }
    
    
    if ( [str4 isEqualToString:@"1"]) {
        
        
        //乘客信息 passengers 项 (单人)
        NSString * CkengKe = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.self.yy_JiaGe,self.yy_JiaGe,self.yy_JiJian,self.yy_RanYou,b,str14];
        
        NSString *syString = [NSString stringWithFormat:@"%@",str6];
        
       NSString *mp = [syString substringToIndex:2];
        
        
        NSLog(@"乘客信息 passengers 项 %@",CkengKe);
      
        NSLog(@"duser_ID %@",duser_ID);
        NSLog(@"CkengKe %@",CkengKe);
        NSLog(@"dingdanhao %@",self.dingdanhao);
        
        
        NSLog(@"str1 %@",str1);
        NSLog(@"str6 %@",str6);
        NSLog(@"str8 %@",str8);
        NSLog(@"str11 %@",str11);
        NSLog(@"str12 %@",str12);
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        NSLog(@"str13 %@",str13);
        NSLog(@"self.yy_JiJian %@",self.yy_JiJian);
        NSLog(@"self.yy_RanYou %@",self.yy_RanYou);
        NSLog(@"b %@",b);
        NSLog(@"self.yy_TuiGai %@",self.yy_TuiGai);
        
        
        NSLog(@"dcompany %@",dcompany);
        NSLog(@"ddept_ID %@",ddept_ID);
        NSLog(@"self.yy_Zhe %@",self.yy_Zhe);
        NSLog(@"str2 %@",str2);
        NSLog(@"self.yy_QiFei %@",self.yy_QiFei);
        NSLog(@"self.yy_DiDa %@",self.yy_DiDa);
        NSLog(@"self.yy_jixing %@",self.yy_jixing);
        NSLog(@"User_id %@",User_id);
        NSLog(@"str1 %@",str1);
        NSLog(@"str5 %@",str5);
        
        NSLog(@"twString %@",mp);
        NSLog(@"self.yy_pnr %@",self.yy_pnr);
        
        
        
        
       
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKe,self.dingdanhao,self.yy_pnr,str1,str6,str8,str11,str12,self.yy_JiaGe,self.yy_JiaGe,str13,self.yy_JiJian,self.yy_RanYou,b,self.yy_TuiGai,mp,dcompany,ddept_ID,self.yy_Zhe,str2,self.yy_QiFei,self.yy_DiDa,self.yy_jixing,User_id,str1,str5,self.yy_TuiGai,str14];


        
       
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2001];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;
        
    }
    else if ([str4 isEqualToString:@"2"]){
        
        
        NSString * yy_Shuang = [NSString stringWithFormat:@"%@%@",str1,str16];
        
        //乘客信息 passengers 项 (双人)
        NSString * CkengKetwo = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.yy_JiaGe,self.yy_JiaGe,self.yy_JiJian,self.yy_RanYou,b,str14,str16,str17,self.yy_JiaGe,self.yy_JiaGe,yy_JiJian,self.yy_RanYou,b,str14];

        
        NSLog(@"乘客信息 passengers 项 %@",CkengKetwo);
        
        NSLog(@"duser_ID %@",duser_ID);
        NSLog(@"CkengKe %@",CkengKetwo);
        NSLog(@"dingdanhao %@",self.dingdanhao);
        
        NSLog(@"str16 %@",str16);
        NSLog(@"str17 %@",str17);
        NSLog(@"str1 %@",str1);
        NSLog(@"str6 %@",str6);
        NSLog(@"str8 %@",str8);
        NSLog(@"str11 %@",str11);
        NSLog(@"str12 %@",str12);
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        NSLog(@"str13 %@",str13);
        NSLog(@"self.yy_JiJian %@",self.yy_JiJian);
        NSLog(@"self.yy_RanYou %@",self.yy_RanYou);
        NSLog(@"b %@",b);
        NSLog(@"self.yy_TuiGai %@",self.yy_TuiGai);
        
        
        NSLog(@"dcompany %@",dcompany);
        NSLog(@"ddept_ID %@",ddept_ID);
        NSLog(@"self.yy_Zhe %@",self.yy_Zhe);
        NSLog(@"str2 %@",str2);
        NSLog(@"self.yy_QiFei %@",self.yy_QiFei);
        NSLog(@"self.yy_DiDa %@",self.yy_DiDa);
        NSLog(@"self.yy_jixing %@",self.yy_jixing);
        NSLog(@"User_id %@",User_id);
        NSLog(@"str1 %@",str1);
        NSLog(@"str5 %@",str5);
        
        NSLog(@"twString %@",mp);
        NSLog(@"self.yy_pnr %@",self.yy_pnr);
        
        
        
        
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKetwo,self.dingdanhao,self.yy_pnr,yy_Shuang,str6,str8,str11,str12,self.yy_JiaGe,self.yy_JiaGe,str13,self.yy_JiJian,self.yy_RanYou,b,self.yy_TuiGai,mp,dcompany,ddept_ID,self.yy_Zhe,str2,self.yy_QiFei,self.yy_DiDa,self.yy_jixing,User_id,str1,str5,self.yy_TuiGai,str14];
        
        
        
        
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2001];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;

    
        
    }else if ([str4 isEqualToString:@"3"]){
        
        
        NSString *yy_San = [NSString stringWithFormat:@"%@%@%@",str1,str16,str18];
        
        //乘客信息 passengers 项 (三人)
        NSString * CkengKethree = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.yy_JiaGe,self.yy_JiaGe,self.yy_JiJian,self.yy_RanYou,b,str14,str16,str17,self.yy_JiaGe,self.yy_JiaGe,yy_JiJian,self.yy_RanYou,b,str14,str18,str19,self.yy_JiaGe,self.yy_JiaGe,yy_JiJian,self.yy_RanYou,b,str14];
        
        
        NSLog(@"乘客信息 passengers 项 %@",CkengKethree);
        
        NSLog(@"duser_ID %@",duser_ID);
        NSLog(@"CkengKe %@",CkengKethree);
        NSLog(@"dingdanhao %@",self.dingdanhao);
        
        NSLog(@"str16 %@",str16);
        NSLog(@"str17 %@",str17);
        NSLog(@"str18 %@",str18);
        NSLog(@"str19 %@",str19);
        
        NSLog(@"str1 %@",str1);
        NSLog(@"str6 %@",str6);
        NSLog(@"str8 %@",str8);
        NSLog(@"str11 %@",str11);
        NSLog(@"str12 %@",str12);
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        
        NSLog(@"self.yy_JiaGe %@",self.yy_JiaGe);
        NSLog(@"str13 %@",str13);
        NSLog(@"self.yy_JiJian %@",self.yy_JiJian);
        NSLog(@"self.yy_RanYou %@",self.yy_RanYou);
        NSLog(@"b %@",b);
        NSLog(@"self.yy_TuiGai %@",self.yy_TuiGai);
        
        
        NSLog(@"dcompany %@",dcompany);
        NSLog(@"ddept_ID %@",ddept_ID);
        NSLog(@"self.yy_Zhe %@",self.yy_Zhe);
        NSLog(@"str2 %@",str2);
        NSLog(@"self.yy_QiFei %@",self.yy_QiFei);
        NSLog(@"self.yy_DiDa %@",self.yy_DiDa);
        NSLog(@"self.yy_jixing %@",self.yy_jixing);
        NSLog(@"User_id %@",User_id);
        NSLog(@"str1 %@",str1);
        NSLog(@"str5 %@",str5);
        
        NSLog(@"twString %@",mp);
        NSLog(@"self.yy_pnr %@",self.yy_pnr);
        
        
        
        
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKethree,self.dingdanhao,self.yy_pnr,yy_San,str6,str8,str11,str12,self.yy_JiaGe,self.yy_JiaGe,str13,self.yy_JiJian,self.yy_RanYou,b,self.yy_TuiGai,mp,dcompany,ddept_ID,self.yy_Zhe,str2,self.yy_QiFei,self.yy_DiDa,self.yy_jixing,User_id,str1,str5,self.yy_TuiGai,str14];
        
        
        
        
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2001];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;

    }
    
}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    [activity stopAnimating];
    
    NSError * error = [request error];
    NSLog(@"%@",error);
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时！"
                                                     message:@"返回上一界面"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
    
}


- (void)requestFinished:(ASIHTTPRequest *)request
{
    
    if (request.tag==1000) {

       
        
        NSData * responData = [request responseData];
        int i = [responData length];
        NSLog(@" %d",i);
        
        NSError * error = nil;
        NSLog(@"request  %@",[request responseString]);
        
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:[request responseData] options:NSJSONReadingAllowFragments error:&error];
        
        NSString * stringCode = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Code"]];
        NSString * stringMessage = [NSString stringWithFormat:@"%@",[dic objectForKey:@"Message"]];

        if ([stringCode isEqual:@"E2000"])
        {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            
            [alert show];
            [alert release];
        
        [self DingDanHaoHttp:[self jsonStringDict:dic]];
        [activity stopAnimating];

        gEleStart = NO;
            
        }else {
            
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示:" message:stringMessage delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
            
            
            alert.tag=123;
            [alert show];
            [alert release];
            
            [activity stopAnimating];
            
            gEleStart = NO;
        }

        
    }else if (request.tag==1001){
        
        
        self.dingdanhao = [NSString stringWithFormat:@"%@",[request responseString]];
        
        NSLog(@"订单号 %@",self.dingdanhao);
        
         [self gElevenHttp];

        gEleStart = NO;
        
    }
    
    
    if (request.tag == 2001) {
        
       
        gEleStart = NO;
        
        [activity stopAnimating];
        NSLog(@"g11 string  is %@",[request responseString]);
        
        TijiaoViewController * tijiao = [[[TijiaoViewController alloc]init]autorelease];
        UINavigationController * nav = [[[UINavigationController alloc]initWithRootViewController:tijiao]autorelease];
        
        
        tijiao.pnr = self.yy_pnr;
        tijiao.y_danhao =self.dingdanhao;
        tijiao.piaoJia = self.yy_JiaGe;
        tijiao.changshui = yy_JiJian;
        tijiao.youshui = yy_RanYou;
        tijiao.baoxian = bao;
        tijiao.zong = b;
        tijiao.ming = self.str1;
        tijiao.shenfen = self.str2;
        tijiao.Tel = self.str5;
        
        
        
        
        tijiao.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];


    }
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
	if (alertView.tag ==123) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
}
-(void)tijiao:(UIButton*)button
{

    
    [self httpYuDing];



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
   

    
    NSLog(@"出发城市三字码 ： %@",sanzima);
    NSLog(@"抵达城市三字码 ： %@",sanzima2);
    
    NSLog(@"str16 %@",str16);
    NSLog(@"str17 %@",str17);
    NSLog(@"str18 %@",str18);
    NSLog(@"str19 %@",str19);
    NSLog(@"实打实客户端撒空间 %@",str14);
    NSLog(@"str4 %@",str4);
    
   
    

    
    myArray = [[NSMutableArray alloc] initWithCapacity:0];
    

    
    UIImageView* myimageView1 = [[UIImageView alloc] initWithFrame:self.navigationController.navigationBar.bounds];
    myimageView1.image = [UIImage imageNamed:@"top3219新.png"];
    [self.navigationController.navigationBar addSubview:myimageView1];
    [myimageView1 release];
    
    
    UIButton * btnb_bxo = [UIButton buttonWithType:UIButtonTypeCustom];
    btnb_bxo.frame = CGRectMake(0, 0, 35, 25);
    [btnb_bxo setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [btnb_bxo addTarget:self action:@selector(btnb_bxoFanHui:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *bkqbtn_ifo = [[[UIBarButtonItem alloc] initWithCustomView:btnb_bxo] autorelease];
    
    self.navigationItem.leftBarButtonItem = bkqbtn_ifo;
    
    
    NSLog(@" hahahahaha%@",str8);

    
    int x = [str9 intValue];
    int p = [str4 intValue];
    NSString * strPic = [NSString stringWithFormat:@"%d",x*p];
    
    zongPJ = [NSString stringWithFormat:@"%@",strPic];
    
    NSString * ming = [NSString stringWithFormat:@"%@ - %@",str11,str12];
    NSString * hangDuan = [NSString stringWithFormat:@"%@",str6];

    NSString *opStr = [NSString stringWithFormat:@"%@ %@",str1,str16];
    NSString *uiStr = [NSString stringWithFormat:@"%@ %@ %@",str1,str16,str18];
    
    a = [NSString stringWithFormat:@"%@",self.y_zop];
    b = [a substringFromIndex:7];
    NSLog(@"11111111111111111111111111\n b: %@",b);
    
  
    
    if ([str4 isEqualToString:@"1"]) {
        
        newArray = [[NSArray alloc] initWithObjects:@"往", ming,str8,hangDuan,str13,str4,str14,str9,@"总",str1,str4,b,str7,str5, nil];
    }else if ([str4 isEqualToString:@"2"]){
        
        newArray = [[NSArray alloc] initWithObjects:@"往", ming,str8,hangDuan,str13,str4,str14,str9,@"总",opStr,str4,b,str7,str5, nil];
    }else if([str4 isEqualToString:@"3"]){
        
        newArray = [[NSArray alloc] initWithObjects:@"往", ming,str8,hangDuan,str13,str4,str14,str9,@"总",uiStr,str4,b,str7,str5, nil];
    }
    
    
    
    array = [[NSArray alloc]initWithObjects:@"往",@"航段:",@"日期:",@"航班:",@"舱位:",@"票数:",@"保险:",@"票价:",@"总",@"乘机人:",@"总票数:",@"总票价:",@"取票方式:",@"联系方式:", nil];
    
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:self action:@selector(tijiao:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    
        myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 10, 320, self.view.frame.size.height - 110) style:UITableViewStylePlain];

         CGRect rect=self.view.bounds;
    if (IOS7_OR_LATER) {
        btn.frame = CGRectMake(100, rect.size.height-100, 120, 30);
        [btn setImage:[UIImage imageNamed:@"提交订单(1).png"] forState:UIControlStateNormal];

    }else{
        btn.frame = CGRectMake(100, rect.size.height-90, 120, 30);
        [btn setImage:[UIImage imageNamed:@"提交订单(1).png"] forState:UIControlStateNormal];
        
    }


    
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    [myTableView release];
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];

    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * CellID = @"yuding";
    UITableViewCell * cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
    
    NSLog(@" %d",[array count]);
    
   if (cell != nil) {
       
           lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 30)];
           lable1.backgroundColor=[UIColor clearColor];
           lable1.text=@"";
           lable1.tag = 1010;
           lable1.textColor=[UIColor blackColor];
           lable1.textAlignment=NSTextAlignmentLeft;
           lable1.font=[UIFont fontWithName:@"Arial" size:15];
           [cell addSubview:lable1];
           [lable1 release];
           
           lableq=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 80, 30)];
           lableq.backgroundColor=[UIColor clearColor];
           lableq.text=@"";
           lableq.tag = 1011;
           lableq.textColor=[UIColor blueColor];
           lableq.textAlignment=NSTextAlignmentCenter;
           lableq.font=[UIFont fontWithName:@"Arial" size:20];
           [cell addSubview:lableq];
           [lableq release];


 }
            if (indexPath.row == 0){
            
            labb =(UILabel * )[cell viewWithTag:1011];
            labb.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
            
        }
        
        
        if (indexPath.row == 8){
            labb =(UILabel * )[cell viewWithTag:1011];
            labb.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
        }
        if (indexPath.row != 8 && indexPath.row != 0 ){
            
            la = (UILabel*)[cell viewWithTag:1010];
            la.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
            lable2=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 160, 30)];
            lable2.backgroundColor=[UIColor clearColor];
            lable2.text=[NSString stringWithFormat:@"%@",[newArray objectAtIndex:indexPath.row]];;
            lable2.tag = 1021;
            lable2.textColor=[UIColor blackColor];
            lable2.textAlignment=NSTextAlignmentCenter;
            lable2.font=[UIFont fontWithName:@"Arial" size:15];
            [cell addSubview:lable2];
            [lable2 release];

    }
  
    cell.selectionStyle = UITableViewCellAccessoryNone;
    return cell;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [array count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
        return 40;


}

-(NSString *)GetTomorrowDay:(NSDate *)aDate WithDay:(int)howDay
{
    NSCalendar *gregorian = [[[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar] autorelease];
    NSDateComponents *components = [gregorian components:NSWeekdayCalendarUnit | NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit fromDate:aDate];
    [components setDay:([components day]+howDay)];
    
    NSDate *beginningOfWeek = [gregorian dateFromComponents:components];
    NSDateFormatter *dateday = [[[NSDateFormatter alloc] init] autorelease];
    [dateday setDateFormat:@"yyyy-MM-dd"];
    
    return [dateday stringFromDate:beginningOfWeek];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
