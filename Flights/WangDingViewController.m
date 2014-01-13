//
//  WangDingViewController.m
//  Flights
//
//  Created by XmL on 12-11-14.
//  Copyright (c) 2012年 mac. All rights reserved.
//

#import "WangDingViewController.h"
#import "TijiaoViewController.h"
#import "ASIHTTPRequest.h"
#import "YuDingXMLaa.h"
#import "RemYuDing.h"
#import "DengLuXML.h"
#import "MyNewXmlMolde.h"
#import "RemconNewXmlque.h"
#import "DesUtil.h"


@interface WangDingViewController ()

@end

@implementation WangDingViewController

@synthesize klstring,yy_bLoup,yy_aLoup;

@synthesize gEleStart;
@synthesize tiJiArray;
@synthesize yueJ,eru,row;
@synthesize svn;
@synthesize danChMo,wangFMo,sten,ster,yueJm;
@synthesize array,myArray;
@synthesize str1,str2,str3,str4,str5,str6,str7,str8,str9,str10,str11,str12,str13,str14,str15,str16,str17,str18,str19;
@synthesize User_id;
@synthesize ya;
@synthesize xitongTime;
@synthesize yy_pnr,dingdanhao;
@synthesize yy_request;
@synthesize liv;
@synthesize yy_DiDa,yy_JiaGe,yy_JiJian,yy_jixing,yy_QiFei,yy_RanYou,yy_TuiGai,yy_Zhe;
@synthesize bao;
@synthesize yyy_danCangWei,yyy_danDiDa,yyy_danDiDaTime,yyy_danJiaGe,yyy_danJiJian,yyy_danQiFei,yyy_danQiFeiTime,yyy_danRanYou,yyy_danTuiGaiQian,yyy_danZheKou,yyy_danHangBanHao,yyy_danjixing;
@synthesize y_wangCangWei,y_wangDiTime,y_wangJiaGe,y_wangJiJian,y_wangQiTime,y_wangRanYou,y_wangTuiGaiQian,y_wangZheKou,y_wangJiXing,bb;
@synthesize sanzima,sanzima2;
@synthesize wangQiTime,wangDiTime,danhangban,wanghangban,fanhangban;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithOneItem:(MyNewXmlMolde * )woneItem withTwoItem:(MyNewXmlMolde *)wtwoItem WithArray:(NSMutableArray *)amArray withthree:(MyNewXmlMolde *)threeItem;
{
    
    if (self = [super init]) {
        self.wangFMo = woneItem;
        self.danChMo = wtwoItem;//这里边是空的
        self.tiJiArray = [NSMutableArray arrayWithArray:amArray];
        self.ya = threeItem;
        
       
    }
    
    return self;
    
}

-(void)dealloc
{
    [array release];
    [danChMo release];
    [wangFMo release];
    
    [super dealloc];
}

-(void)btnb_bxoFanHui:(UIButton *)button
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


-(void)httpWangYding
{
    
#pragma mark 系统当前时间加4小时
    
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
    
    int k = 4;
    
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
   
    
    NSString *trString = [NSString stringWithFormat:@"%@",self.ya.xFlightNo];
    NSString *twString = [trString substringToIndex:2];
    NSLog(@"截取后的二字码 %@ ",twString);
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    self.str2 = [defaults objectForKey:@"Passport_no"];
    
    
    NSLog(@"str2 %@",str2);
    
    
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
    
    
    
    MyNewXmlMolde * wanFmo = [self.tiJiArray objectAtIndex:0];
    
    NSString *str = [NSString stringWithFormat:@"%@|%@|%@|%@|%@#%@|%@|%@|%@|%@",self.ya.xDepCity,wangFMo.xDepCity,self.ya.xFlightDate,self.ya.xFlightNo,danChMo.ccName,self.wangFMo.xDepCity,self.ya.xDepCity,str8,str6,wanFmo.ccName];
    
    NSLog(@"多航线组拼串 %@",str);
    
    NSString * y_str = @"11119688";
    
    NSString * string = [DesUtil encryptUseDES:str key:y_str];
    NSLog(@"航线组加密后 %@ ",string);
    
    
    NSString * adString =  [self addDesString:string];
    NSLog(@"航线组加密后转译 %@",adString);
    
    if (str2!=nil) {
    
    NSString * op = [NSString stringWithFormat:@"1|%@|NI|%@||false||",str1,str2];
    NSLog(@"乘机人组拼串 %@ ",op);
    NSString * y_op = @"11119688";
    
    
    NSString *opstring = [DesUtil encryptUseDES:op key:y_op];
    NSLog(@"乘机人组加密之后 %@ ",opstring);
    
   
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

        
    }else if ([str4 isEqualToString:@"3"]){
        
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

-(NSString *)jsonStringDict:(NSDictionary *)responseDate
{
    
    self.yy_pnr = [[responseDate objectForKey:@"Pnr"] retain];
    
   
    
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

//往 插G11
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
    
    if ([str15 isEqualToString:@"0"]) {
        
        str15 = @"0";
        NSLog(@"保险11 %@",str15);
        
    }else if ([str15 isEqualToString:@"1"]){
        
        str15 = @"10";
        NSLog(@"保险22 %@",str15);
        
    }else if ([str15 isEqualToString:@"2"]){
        
        str15 = @"20";
        NSLog(@"保险33 %@",str15);
    }
    
    
    NSString * danzongjia = [NSString stringWithFormat:@"%d",[self.danChMo.ccSinglePrice intValue] +[self.danChMo.ccTax intValue]  +[self.danChMo.ccFuel intValue] + [str15 intValue]];
    
    
//    MyNewXmlMolde * wanFmo = [self.tiJiArray objectAtIndex:0];
//    
//    NSString * fanzongjia  = [NSString stringWithFormat:@"%d",[wanFmo.ccSinglePrice intValue] +[wanFmo.ccTax intValue]  +[wanFmo.ccFuel intValue] + [str15 intValue]];
    
    
    NSLog(@"单程总价 7887878   %@",danzongjia);
    
//    NSLog(@"返程总价 8989899   %@",fanzongjia);
    
    NSString *hbhao = [NSString stringWithFormat:@"%@",self.yyy_danHangBanHao];
    self.danhangban = [hbhao substringFromIndex:2];
    NSLog(@"切割后的航班号 %@",danhangban);
 
    
        if ( [str4 isEqualToString:@"1"]) {
            
            
            //乘客信息 passengers 项 (单人)
            NSString * CkengKe = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14];
            
            NSString *syString = [NSString stringWithFormat:@"%@",str6];
            
            NSString *mp = [syString substringToIndex:2];
            
            
            NSLog(@"乘客信息 passengers 项 %@",CkengKe);
            
            NSLog(@"duser_ID%@",duser_ID);
            NSLog(@"CkengKe%@",CkengKe);
            NSLog(@"self.dingdanhao%@",self.dingdanhao);
            NSLog(@"self.yy_pnr%@",self.yy_pnr);
            NSLog(@"str1%@",str1);
            NSLog(@"str6%@",str6);
            NSLog(@"self.ya.xFlightDate%@",self.ya.xFlightDate);
            NSLog(@"self.yyy_danQiFei%@",self.yyy_danQiFei);
            NSLog(@"self.yyy_danDiDa%@",self.yyy_danDiDa);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"danChMo.ccName%@",danChMo.ccName);
            NSLog(@"self.yyy_danJiJian%@",self.yyy_danJiJian);
            NSLog(@"self.yyy_danRanYou%@",self.yyy_danRanYou);
            NSLog(@"bb%@",self.bb);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"mp%@",mp);
            NSLog(@"dcompany%@",dcompany);
            NSLog(@"ddept_ID%@",ddept_ID);
            NSLog(@"self.yyy_danZheKou%@",self.yyy_danZheKou);
            NSLog(@"str2%@",str2);
            NSLog(@"self.yyy_danQiFeiTime%@",self.yyy_danQiFeiTime);
            NSLog(@"self.yyy_danDiDaTime%@",self.yyy_danDiDaTime);
            NSLog(@"self.yyy_danjixing%@",self.yyy_danjixing);
            NSLog(@"User_id%@",User_id);
            NSLog(@"str1%@",str1);
            NSLog(@"str5%@",str5);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"str14%@",str14);
            
      
           
            
            
            
            
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKe,self.dingdanhao,self.yy_pnr,str1,self.danhangban,self.ya.xFlightDate,self.yyy_danQiFeiTime,self.yyy_danDiDaTime,self.yyy_danJiaGe,self.yyy_danJiaGe,danChMo.ccName,self.yyy_danJiJian,self.yyy_danRanYou,self.bb,self.yyy_danTuiGaiQian,mp,dcompany,ddept_ID,self.yyy_danZheKou,str2,self.yyy_danQiFei,self.yyy_danDiDa,self.yyy_danjixing,User_id,str1,str5,self.yyy_danTuiGaiQian,str14];
            
            
            
            
            
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
            NSString * CkengKetwo = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14,str16,str17,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14];
            
            
            NSLog(@"乘客信息 passengers 项 %@",CkengKetwo);
            
            NSLog(@"duser_ID%@",duser_ID);
            NSLog(@"CkengKetwo%@",CkengKetwo);
            NSLog(@"self.dingdanhao%@",self.dingdanhao);
            NSLog(@"self.yy_pnr%@",self.yy_pnr);
            NSLog(@"yy_Shuang%@",yy_Shuang);
            NSLog(@"str6%@",str6);
            NSLog(@"self.ya.xFlightDate%@",self.ya.xFlightDate);
            NSLog(@"self.yyy_danQiFei%@",self.yyy_danQiFei);
            NSLog(@"self.yyy_danDiDa%@",self.yyy_danDiDa);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"danChMo.ccName%@",danChMo.ccName);
            NSLog(@"self.yyy_danJiJian%@",self.yyy_danJiJian);
            NSLog(@"self.yyy_danRanYou%@",self.yyy_danRanYou);
            NSLog(@"self.bb%@",self.bb);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"mp%@",mp);
            NSLog(@"dcompany%@",dcompany);
            NSLog(@"ddept_ID%@",ddept_ID);
            NSLog(@"self.yyy_danZheKou%@",self.yyy_danZheKou);
            NSLog(@"str2%@",str2);
            NSLog(@"self.yyy_danQiFeiTime%@",self.yyy_danQiFeiTime);
            NSLog(@"self.yyy_danDiDaTime%@",self.yyy_danDiDaTime);
            NSLog(@"self.yyy_danjixing%@",self.yyy_danjixing);
            NSLog(@"User_id%@",User_id);
            NSLog(@"str1%@",str1);
            NSLog(@"str5%@",str5);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"str14%@",str14);
            
            
            
            
            
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKetwo,self.dingdanhao,self.yy_pnr,yy_Shuang,self.danhangban,self.ya.xFlightDate,self.yyy_danQiFeiTime,self.yyy_danDiDaTime,self.yyy_danJiaGe,self.yyy_danJiaGe,danChMo.ccName,self.yyy_danJiJian,self.yyy_danRanYou,self.bb,self.yyy_danTuiGaiQian,mp,dcompany,ddept_ID,self.yyy_danZheKou,str2,self.yyy_danQiFei,self.yyy_danDiDa,self.yyy_danjixing,User_id,str1,str5,self.yyy_danTuiGaiQian,str14];
            
            
            
            
            
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
            NSString * CkengKethree = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14,str16,str17,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14,str18,str19,self.yyy_danJiaGe,self.yyy_danJiaGe,self.yyy_danJiJian,self.yyy_danRanYou,danzongjia,str14];
            
            
            NSLog(@"乘客信息 passengers 项 %@",CkengKethree);
            
                       
            NSLog(@"duser_ID%@",duser_ID);
            NSLog(@"CkengKethree%@",CkengKethree);
            NSLog(@"self.dingdanhao%@",self.dingdanhao);
            NSLog(@"self.yy_pnr%@",self.yy_pnr);
            NSLog(@"yy_San%@",yy_San);
            NSLog(@"str6%@",str6);
            NSLog(@"self.ya.xFlightDate%@",self.ya.xFlightDate);
            NSLog(@"self.yyy_danQiFei%@",self.yyy_danQiFei);
            NSLog(@"self.yyy_danDiDa%@",self.yyy_danDiDa);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"self.yyy_danJiaGe%@",self.yyy_danJiaGe);
            NSLog(@"danChMo.ccName%@",danChMo.ccName);
            NSLog(@"self.yyy_danJiJian%@",self.yyy_danJiJian);
            NSLog(@"self.yyy_danRanYou%@",self.yyy_danRanYou);
            NSLog(@"bb%@",self.bb);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"mp%@",mp);
            NSLog(@"dcompany%@",dcompany);
            NSLog(@"ddept_ID%@",ddept_ID);
            NSLog(@"self.yyy_danZheKou%@",self.yyy_danZheKou);
            NSLog(@"str2%@",str2);
            NSLog(@"self.yyy_danQiFeiTime%@",self.yyy_danQiFeiTime);
            NSLog(@"self.yyy_danDiDaTime%@",self.yyy_danDiDaTime);
            NSLog(@"self.yyy_danjixing%@",self.yyy_danjixing);
            NSLog(@"User_id%@",User_id);
            NSLog(@"str1%@",str1);
            NSLog(@"str5%@",str5);
            NSLog(@"self.yyy_danTuiGaiQian%@",self.yyy_danTuiGaiQian);
            NSLog(@"str14%@",str14);

            
            
            
            
            NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKethree,self.dingdanhao,self.yy_pnr,yy_San,self.danhangban,self.ya.xFlightDate,self.yyy_danQiFeiTime,self.yyy_danDiDaTime,self.yyy_danJiaGe,self.yyy_danJiaGe,danChMo.ccName,self.yyy_danJiJian,self.yyy_danRanYou,self.bb,self.yyy_danTuiGaiQian,mp,dcompany,ddept_ID,self.yyy_danZheKou,str2,self.yyy_danQiFei,self.yyy_danDiDa,self.yyy_danjixing,User_id,str1,str5,self.yyy_danTuiGaiQian,str14];
            
            
            
            
            
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

//返 插G11
-(void)gElevenTwoHttp
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
    
    if ([str15 isEqualToString:@"0"]) {
        
        str15 = @"0";
        NSLog(@"保险11 %@",str15);
        
    }else if ([str15 isEqualToString:@"1"]){
        
        str15 = @"10";
        NSLog(@"保险22 %@",str15);
        
    }else if ([str15 isEqualToString:@"2"]){
        
        str15 = @"20";
        NSLog(@"保险33 %@",str15);
    }
    
    
//    NSString * danzongjia = [NSString stringWithFormat:@"%d",[self.danChMo.ccSinglePrice intValue] +[self.danChMo.ccTax intValue]  +[self.danChMo.ccFuel intValue] + [str15 intValue]];
    
    
    MyNewXmlMolde * wanFmo = [self.tiJiArray objectAtIndex:0];
    
    NSString * fanzongjia  = [NSString stringWithFormat:@"%d",[wanFmo.ccSinglePrice intValue] +[wanFmo.ccTax intValue]  +[wanFmo.ccFuel intValue] + [str15 intValue]];
    
    
  //  NSLog(@"单程总价 7887878   %@",danzongjia);
    
    NSLog(@"返程总价 8989899   %@",fanzongjia);
    
    NSString *yy_wangQiTime =[NSString stringWithFormat:@"%@",y_wangQiTime];
    self.wangQiTime =[yy_wangQiTime substringFromIndex:5];
    NSLog(@"截取后的反起飞时间 %@",self.wangQiTime);
    
    NSString * yy_wangDiTime = [NSString stringWithFormat:@"%@",y_wangDiTime];
    self.wangDiTime = [yy_wangDiTime substringFromIndex:5];
    NSLog(@"截取后的反抵达时间 %@",self.wangDiTime);
    
    
    NSString * fanhbhao = [NSString stringWithFormat:@"%@",str6];
    self.fanhangban = [fanhbhao substringFromIndex:2];
    NSLog(@"切割后的航班号 %@",fanhangban);
    
    if ( [str4 isEqualToString:@"1"]) {
        
        
        //乘客信息 passengers 项 (单人)
        NSString * CkengKe = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14];
        
        NSString *syString = [NSString stringWithFormat:@"%@",str6];
        
        NSString *mp = [syString substringToIndex:2];
        
        
        NSLog(@"乘客信息 passengers 项 %@",CkengKe);
        
        NSLog(@"duser_ID TWO %@",duser_ID);
        NSLog(@"CkengKe TWO %@",CkengKe);
        NSLog(@"mp TWO %@",mp);
        NSLog(@"dcompany TWO %@",dcompany);
        NSLog(@"ddept_ID TWO %@",ddept_ID);
        NSLog(@"self.dingdanhao TWO %@",self.dingdanhao);
        NSLog(@"self.yy_pnr TWO %@",self.yy_pnr);
        NSLog(@"str1 TWO %@",str1);
        NSLog(@"str6 TWO %@",str6);
        NSLog(@"str8 TWO %@",str8);
        NSLog(@"self.yyy_danDiDa TWO %@",self.yyy_danDiDa);
        NSLog(@"self.yyy_danQiFei TWO %@",self.yyy_danQiFei);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangCangWei TWO %@",self.y_wangCangWei);
        NSLog(@"self.y_wangJiJian TWO %@",self.y_wangJiJian);
        NSLog(@"self.y_wangRanYou TWO %@",self.y_wangRanYou);
        NSLog(@"bb TWO %@",self.bb);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"self.y_wangZheKou TWO %@",self.y_wangZheKou);
        NSLog(@"str2 TWO %@",str2);
        NSLog(@"self.y_wangQiTime TWO %@",self.y_wangQiTime);
        NSLog(@"self.y_wangDiTime TWO %@",self.y_wangDiTime);
        NSLog(@"self.y_wangJiXing TWO %@",self.y_wangJiXing);
        NSLog(@"User_id TWO %@",User_id);
        NSLog(@"str1 TWO %@",str1);
        NSLog(@"str5 TWO %@",str5);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"str14 TWO %@",str14);
        
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKe,self.dingdanhao,self.yy_pnr,str1,fanhangban,str8,self.yyy_danDiDaTime,self.yyy_danQiFeiTime,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangCangWei,self.y_wangJiJian,self.y_wangRanYou,self.bb,self.y_wangTuiGaiQian,mp,dcompany,ddept_ID,self.y_wangZheKou,str2,self.wangQiTime,self.wangDiTime,self.y_wangJiXing,User_id,str1,str5,self.y_wangTuiGaiQian,str14];
        
        
        
        
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2002];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;
        
    }
    else if ([str4 isEqualToString:@"2"]){
        
        
        NSString * yy_Shuang = [NSString stringWithFormat:@"%@%@",str1,str16];
        
        //乘客信息 passengers 项 (双人)
        NSString * CkengKetwo = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14,str16,str17,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14];
        
        
        NSLog(@"乘客信息 passengers 项 %@",CkengKetwo);
        
        NSLog(@"duser_ID TWO %@",duser_ID);
        NSLog(@"CkengKe TWO %@",CkengKetwo);
        NSLog(@"self.dingdanhao TWO %@",self.dingdanhao);
        NSLog(@"self.yy_pnr TWO %@",self.yy_pnr);
        NSLog(@"yy_Shuang TWO %@",yy_Shuang);
        NSLog(@"str6 TWO %@",str6);
        NSLog(@"str8 TWO %@",str8);
        NSLog(@"self.yyy_danDiDa TWO %@",self.yyy_danDiDa);
        NSLog(@"self.yyy_danQiFei TWO %@",self.yyy_danQiFei);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangCangWei TWO %@",self.y_wangCangWei);
        NSLog(@"self.y_wangJiJian TWO %@",self.y_wangJiJian);
        NSLog(@"self.y_wangRanYou TWO %@",self.y_wangRanYou);
        NSLog(@"bb TWO %@",self.bb);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"mp TWO %@",mp);
        NSLog(@"dcompany TWO %@",dcompany);
        NSLog(@"ddept_ID TWO %@",ddept_ID);
        NSLog(@"self.y_wangZheKou TWO %@",self.y_wangZheKou);
        NSLog(@"str2 TWO %@",str2);
        NSLog(@"self.y_wangQiTime TWO %@",self.y_wangQiTime);
        NSLog(@"self.y_wangDiTime TWO %@",self.y_wangDiTime);
        NSLog(@"self.y_wangJiXing TWO %@",self.y_wangJiXing);
        NSLog(@"User_id TWO %@",User_id);
        NSLog(@"str1 TWO %@",str1);
        NSLog(@"str5 TWO %@",str5);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"str14 TWO %@",str14);
        
        
        
        
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKetwo,self.dingdanhao,self.yy_pnr,yy_Shuang,fanhangban,str8,self.yyy_danDiDaTime,self.yyy_danQiFeiTime,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangCangWei,self.y_wangJiJian,self.y_wangRanYou,self.bb,self.y_wangTuiGaiQian,mp,dcompany,ddept_ID,self.y_wangZheKou,str2,self.wangQiTime,self.wangDiTime,self.y_wangJiXing,User_id,str1,str5,self.y_wangTuiGaiQian,str14];
        
        
    
        
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2002];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;
        
        
        
    }else if ([str4 isEqualToString:@"3"]){
        
        
        NSString *yy_San = [NSString stringWithFormat:@"%@%@%@",str1,str16,str18];
        
        //乘客信息 passengers 项 (三人)
        NSString * CkengKethree = [NSString stringWithFormat:@"%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0|%@@A@%@@%@@%@@%@@%@@%@@%@@0",str1,str2,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14,str16,str17,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14,str18,str19,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangJiJian,self.y_wangRanYou,fanzongjia,str14];
        
        
        NSLog(@"乘客信息 passengers 项 %@",CkengKethree);
        
        
        NSLog(@"duser_ID TWO %@",duser_ID);
        NSLog(@"CkengKethree TWO %@",CkengKethree);
        NSLog(@"self.dingdanhao TWO %@",self.dingdanhao);
        NSLog(@"self.yy_pnr TWO %@",self.yy_pnr);
        NSLog(@"yy_San TWO %@",yy_San);
        NSLog(@"str6 TWO %@",str6);
        NSLog(@"str8 TWO %@",str8);
        NSLog(@"self.yyy_danDiDa TWO %@",self.yyy_danDiDa);
        NSLog(@"self.yyy_danQiFei TWO %@",self.yyy_danQiFei);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangJiaGe TWO %@",self.y_wangJiaGe);
        NSLog(@"self.y_wangCangWei TWO %@",self.y_wangCangWei);
        NSLog(@"self.y_wangJiJian TWO %@",self.y_wangJiJian);
        NSLog(@"self.y_wangRanYou TWO %@",self.y_wangRanYou);
        NSLog(@"bb TWO %@",self.bb);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"mp TWO %@",mp);
        NSLog(@"dcompany TWO %@",dcompany);
        NSLog(@"ddept_ID TWO %@",ddept_ID);
        NSLog(@"self.y_wangZheKou TWO %@",self.y_wangZheKou);
        NSLog(@"str2 TWO %@",str2);
        NSLog(@"self.y_wangQiTime TWO %@",self.y_wangQiTime);
        NSLog(@"self.y_wangDiTime TWO %@",self.y_wangDiTime);
        NSLog(@"self.y_wangJiXing TWO %@",self.y_wangJiXing);
        NSLog(@"User_id TWO %@",User_id);
        NSLog(@"str1 TWO %@",str1);
        NSLog(@"str5 TWO %@",str5);
        NSLog(@"self.y_wangTuiGaiQian TWO %@",self.y_wangTuiGaiQian);
        NSLog(@"str14 TWO %@",str14);
        
        
        
        
        
        NSString * strUrl = [NSString stringWithFormat:@"http://139.210.99.29:83/interface_dept/save_order.php?User_id=%@&Passengers=%@&Order_resid=%@&Order_pnr=%@&Order_people=%@&Order_number=%@&Order_date=%@&Order_scity=%@&Order_acity=%@&Order_jprice=%@&Clearing_price=%@&Order_space=%@&Order_tax=%@&Order_yq=%@&Order_total=%@&Order_cmt=%@&Order_company=%@&Company_id=%@&Dept_id=%@&Order_discount=%@&Order_znum=%@&Depart=%@&Arrive=%@&Equip=%@&Username=%@&Realname=%@&Telephone=%@&Pay=C&Platform=4&Order_refund=%@&Stop=0&Order_status=1&Cus_type=A&Order_safe=%@",duser_ID,CkengKethree,self.dingdanhao,self.yy_pnr,yy_San,fanhangban,str8,self.yyy_danDiDaTime,self.yyy_danQiFeiTime,self.y_wangJiaGe,self.y_wangJiaGe,self.y_wangCangWei,self.y_wangJiJian,self.y_wangRanYou,self.bb,self.y_wangTuiGaiQian,mp,dcompany,ddept_ID,self.y_wangZheKou,str2,self.wangQiTime,self.wangDiTime,self.y_wangJiXing,User_id,str1,str5,self.y_wangTuiGaiQian,str14];
        
        
        
        
        
        NSLog(@"string g11 is %@",strUrl);
        strUrl = [strUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        
        
        NSLog(@"utf8 string g11 is %@",strUrl);
        
        NSURL * url = [NSURL URLWithString:strUrl];
        
        gEleRequest =[ASIHTTPRequest requestWithURL:url];
        [gEleRequest setTag:2002];
        [gEleRequest setDelegate:self];
        [gEleRequest startAsynchronous];
        
        
        gEleStart = YES;
        
    }

    
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


            
        } else if (request.tag==1001) {
            
            self.dingdanhao = [[NSString stringWithFormat:@"%@",[request responseString]] retain];
            
            
            NSLog(@"订单号 %@",self.dingdanhao);
            
            [self gElevenHttp];

            gEleStart = NO;
            
            

            
        }

        if (request.tag == 2001) {
            
            gEleStart = NO;
            
//            [activity stopAnimating];
            
            NSLog(@"g11  string  is %@",[request responseString]);
            
            [self gElevenTwoHttp];
            
//            TijiaoViewController * tijiao = [[[TijiaoViewController alloc]initWithArray:self.myArray]autorelease];
//            UINavigationController * nav = [[[UINavigationController alloc]initWithRootViewController:tijiao]autorelease];
            
            
        }if (request.tag ==2002) {
            
            
            
            NSLog(@"g11 2222 string  is %@",[request responseString]);
            
            gEleStart = NO;
            [activity stopAnimating];
            
            
            TijiaoViewController * tijiao = [[[TijiaoViewController alloc]initWithArray:nil WithTag:@"wangfan"]autorelease];
            UINavigationController * nav = [[[UINavigationController alloc]initWithRootViewController:tijiao]autorelease];
            
            
            
            tijiao.fanPnr = self.yy_pnr;
            tijiao.fanDanhao = self.dingdanhao;
            tijiao.fanMing = self.str1;
            tijiao.fanShenFen = self.str2;
            tijiao.fanTel = self.str5;
            
           
           
            tijiao.oo_baoxian = self.str15;
            NSLog(@"str15 %@",self.str15);
            tijiao.oo_changshui = self.y_wangJiJian;
            NSLog(@"y_wangjijian %@",self.y_wangJiJian);
            tijiao.oo_youshui = self.y_wangRanYou;
            NSLog(@"y_wangRanYou %@",self.y_wangRanYou);
            tijiao.oo_zong =self.bb;
            NSLog(@"bb %@",self.bb);
            
      
            
            
            tijiao.modalTransitionStyle=UIModalTransitionStyleCrossDissolve;
            [self presentViewController:nav animated:YES completion:NULL];
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



-(void)tijiao:(UIButton*)button
{
    
     [self httpWangYding];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
 // myArray=[[NSMutableArray alloc]initWithCapacity:0];
#define IOS7_OR_LATER   ( [[[UIDevice currentDevice] systemVersion] compare:@"7.0"] != NSOrderedAscending )
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
    if ( IOS7_OR_LATER )
    {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.extendedLayoutIncludesOpaqueBars = NO;
        self.modalPresentationCapturesStatusBarAppearance = NO;
    }
#endif  // #if __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000
  
   
    NSLog(@"单程起飞时间 %@",self.yyy_danQiFei);
    NSLog(@"单程抵达时间 %@",self.yyy_danDiDa);
    NSLog(@"单程起飞城市 %@",self.yyy_danQiFeiTime);
    NSLog(@"单程抵达城市 %@",self.yyy_danDiDaTime);
    NSLog(@"单程舱位 %@",self.yyy_danCangWei);
    NSLog(@"单程价格 %@",self.yyy_danJiaGe);
    NSLog(@"单程折扣 %@",self.yyy_danZheKou);
    NSLog(@"单程机场建设费 %@",self.yyy_danJiJian);
    NSLog(@"单程燃油税 %@",self.yyy_danRanYou);
    NSLog(@"单程退改签 %@",self.yyy_danTuiGaiQian);
    NSLog(@"单程航班号 %@",self.yyy_danHangBanHao);
    NSLog(@"单程机型 %@",self.yyy_danjixing);
    
    NSLog(@"往的三字码 %@",ya.xDepCity);
    
    NSLog(@"返的三字码 %@",wangFMo.xDepCity);
    
    
    
    NSLog(@"反起飞时间 %@",self.wangQiTime);//
    NSLog(@"反抵达时间 %@",self.wangDiTime);//
    
 
    
   
   
    
    NSLog(@"反舱位 %@",self.y_wangCangWei);
    NSLog(@"反价格 %@",self.y_wangJiaGe);
    NSLog(@"反折扣 %@",self.y_wangZheKou);
    NSLog(@"反机场建设费 %@",self.y_wangJiJian);
    NSLog(@"反燃油 %@",self.y_wangRanYou);
    NSLog(@"反退改签 %@",self.y_wangTuiGaiQian);
    NSLog(@"反机型 %@",self.y_wangJiXing);
    NSLog(@"保险 %@",str15);
    NSLog(@"str14 %@",str14);
    NSLog(@"str4 %@",str4);
    NSLog(@"str1 %@",str1);
    NSLog(@"str6 %@",str6);
    
 
    


    
//    NSLog(@"往城市三字码 %@ ",self.ya.xDepCity);
//    NSLog(@"往城市三字码 %@ ",self.wangFMo.xDepCity);
//    NSLog(@"往日期 %@ ",self.ya.xFlightDate);
//    NSLog(@"往航班号 %@ ",self.ya.xFlightNo);
//    NSLog(@"往舱位 %@",danChMo.ccName);
//    NSLog(@"反城市三字码 %@ ",self.wangFMo.xDepCity);
//    NSLog(@"往城市三字码 %@ ",self.ya.xDepCity);
//    NSLog(@"反日期 %@ ",str8);
//    NSLog(@"反航班号 %@ ",str6);
//    NSLog(@"反舱位 %@ ",wanFmo.ccName);
    
    
//        NSString *y_sr = [NSString stringWithFormat:@"%@",yy_JiaGe];
//        NSArray * array2 = [y_sr componentsSeparatedByCharactersInSet:[NSCharacterSet                                            characterSetWithCharactersInString:@"."]];//以字符串中的字符作为分割条件进行分割
//        y_sr = [array2 objectAtIndex:0];
//    	NSLog(@"aa%@",y_sr);

    
    
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
    
    
    
    
    int x = [str9 intValue];
    int p = [str4 intValue];
    
    
    
    NSString * ming = [NSString stringWithFormat:@"%@ - %@",str11,str12];
    NSString * fanming = [NSString stringWithFormat:@"%@ - %@",str12,str11];
//    NSString * hangDuan = [NSString stringWithFormat:@"%@",self.ya.xFlightNo];
//    NSString * whangban = [NSString stringWithFormat:@"%@",self.wangFMo.xFlightNo];
    
    NSLog(@"往航班号 %@ ",self.ya.xFlightNo);
    NSLog(@"反航班号 %@ ",self.wangFMo.xFlightNo);
    
    MyNewXmlMolde * wanFmo = [self.tiJiArray objectAtIndex:0];
    
    
    
    
    NSString * danSinglePrice = [NSString stringWithFormat:@"%d 元",[self.danChMo.ccSinglePrice intValue] +[self.danChMo.ccTax intValue]  +[self.danChMo.ccFuel intValue]];
    wangSinglePrice = [NSString stringWithFormat:@"%d 元",[wanFmo.ccSinglePrice intValue] +[wanFmo.ccTax intValue]  +[wanFmo.ccFuel intValue]];
    
    NSString * strPic = [NSString stringWithFormat:@"%d 元",x*p];
    
    NSLog(@"往返机票加一起的总价格（带订单总价：￥） %@",strPic);
    NSString * zZhangSh = [NSString stringWithFormat:@"%d 张",[str4 intValue] + [str4 intValue]];
    
    NSString *opStr = [NSString stringWithFormat:@"%@ %@",str1,str16];
    NSString *uiStr = [NSString stringWithFormat:@"%@ %@ %@",str1,str16,str18];
    
    
    aa = [NSString stringWithFormat:@"%@",liv];
    self.bb =[aa substringFromIndex:7];
    
    NSLog(@"截取后的总价格 %@",self.bb);
    
    if ([str4 isEqualToString:@"1"]) {
        
         newArray = [[NSArray alloc] initWithObjects:@"往", ming,self.ya.xFlightDate,self.ya.xFlightNo,danChMo.ccName,str4,str14,danSinglePrice,@"返",fanming,str8,str6,wanFmo.ccName,str4,str14,wangSinglePrice,@"总",str1,zZhangSh,self.bb,str7,str5, nil];
        
    }else if ([str4 isEqualToString:@"2"]){
        
         newArray = [[NSArray alloc] initWithObjects:@"往", ming,self.ya.xFlightDate,self.ya.xFlightNo,danChMo.ccName,str4,str14,danSinglePrice,@"返",fanming,str8,str6,wanFmo.ccName,str4,str14,wangSinglePrice,@"总",opStr,zZhangSh,self.bb,str7,str5, nil];
        
    }else if ([str4 isEqualToString:@"3"]){
        
         newArray = [[NSArray alloc] initWithObjects:@"往", ming,self.ya.xFlightDate,self.ya.xFlightNo,danChMo.ccName,str4,str14,danSinglePrice,@"返",fanming,str8,str6,wanFmo.ccName,str4,str14,wangSinglePrice,@"总",uiStr,zZhangSh,self.bb,str7,str5, nil];
        
    }
    
   
    
    NSLog(@"乘机人姓名1  %@",str1);
    NSLog(@"乘机人身份证号1 %@",str2);
    NSLog(@"乘机人姓名2  %@",str16);
    NSLog(@"乘机人身份证号2 %@",str17);
    NSLog(@"乘机人姓名3  %@",str18);
    NSLog(@"乘机人身份证号3 %@",str19);
    
    NSLog(@"显示中间数组长度 %d",[newArray count]);
    array = [[NSArray alloc]initWithObjects:@"往",@"航段:",@"日期:",@"航班:",@"舱位:",@"票数:",@"保险:",@"票价:",@"返",@"航段:",@"日期:",@"航班:",@"舱位:",@"票数:",@"保险:",@"票价:",@"总",@"乘机人:",@"总票数:",@"总票价:",@"取票方式:",@"联系方式:", nil];

    
    NSLog(@"往城市对 %@" ,ming);
    NSLog(@"往日期 %@ ",self.ya.xFlightDate);
    NSLog(@"往航班号 %@ ",self.ya.xFlightNo);
    NSLog(@"往舱位 %@",danChMo.ccName);
    NSLog(@"往票数 %@",str4);
    NSLog(@"往保险 %@",str14);
    NSLog(@"往基础票价 %@",danChMo.ccSinglePrice);
    
    NSLog(@"反城市对 %@",fanming);
    NSLog(@"反日期 %@" ,str8);
    NSLog(@"反航班号 %@ ",str6);
    NSLog(@"反舱位 %@ ",wanFmo.ccName);
    NSLog(@"反票数 %@",str4);
    NSLog(@"反保险 %@",str14);
    NSLog(@"反票价（加机建燃油的价格） %@",wangSinglePrice);
    
    
    NSLog(@"乘机人姓名 %@",str1);
    NSLog(@"总票数 %@" ,zZhangSh);
    NSLog(@"总票价 %@ ",self.bb);
    NSLog(@"取票方式 %@ ",str7);
    NSLog(@"联系方式 %@",str5);
    

    
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
    
    
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString * CellID = @"yuding";
    UITableViewCell * cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
    
    if (cell != nil) {
        
                    
            UILabel * lable1=[[UILabel alloc]initWithFrame:CGRectMake(10, 5, 80, 30)];
            lable1.backgroundColor=[UIColor clearColor];
            lable1.text=@"";
            lable1.tag = 1010;
            lable1.textColor=[UIColor blackColor];
            lable1.textAlignment=NSTextAlignmentLeft;
            lable1.font=[UIFont fontWithName:@"Arial" size:15];
            [cell addSubview:lable1];
            [lable1 release];
            
            
            
            UILabel * lable=[[UILabel alloc]initWithFrame:CGRectMake(120, 5, 80, 30)];
            lable.backgroundColor=[UIColor clearColor];
            lable.text=@"";
            lable.tag = 1011;
            lable.textColor=[UIColor blueColor];
            lable.textAlignment=NSTextAlignmentCenter;
            lable.font=[UIFont fontWithName:@"Arial" size:20];
            [cell addSubview:lable];
            [lable release];

            
        }
   
    
           if (indexPath.row == 0){
            
            UILabel * labb =(UILabel * )[cell viewWithTag:1011];
            labb.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
            
        }
        
        
        if (indexPath.row == 8){
            UILabel * labb =(UILabel * )[cell viewWithTag:1011];
            labb.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
        }
        if (indexPath.row == 16) {
            UILabel * labb =(UILabel * )[cell viewWithTag:1011];
            labb.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
            
        }
        
      
            
            if (indexPath.row != 8 && indexPath.row != 0 && indexPath.row!=16){
                
                UILabel * la = (UILabel*)[cell viewWithTag:1010];
                la.text = [NSString stringWithFormat:@"%@",[array objectAtIndex:indexPath.row]];
                
                UILabel * lable2=[[UILabel alloc]initWithFrame:CGRectMake(80, 5, 160, 30)];
                lable2.backgroundColor=[UIColor clearColor];
                lable2.text=[NSString stringWithFormat:@"%@",[newArray objectAtIndex:indexPath.row]];
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
