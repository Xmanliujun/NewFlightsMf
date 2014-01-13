//
//  RiLiBoViewController.m
//  jiudian
//
//  Created by XmL on 12-10-18.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "RiLiBoViewController.h"
#import "VRGCalendarView.h"
#import "jiuDianCxViewController.h"
@interface RiLiBoViewController ()

@end

@implementation RiLiBoViewController


@synthesize string4,tag,delegate,anewNianFen,anewYunStr,anewDayStr;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(void)btnFanHui:(UIButton * )btn
{
    
   
    [self dismissViewControllerAnimated:YES completion:NULL];
    
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

	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"酒店筛选背景.png"]];
    VRGCalendarView * vrgCalender = [[[VRGCalendarView alloc] init] autorelease];
    vrgCalender.delegate = self;
    [self.view addSubview:vrgCalender];
    
    
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
    
}

-(void)myDateCh:(NSDate *)date
{

    NSMutableString * string1 = [NSString stringWithFormat:@"%@",datey];
    NSLog(@"string:%@",string1);
    
    
    
    NSString *str1;
    NSString *str2;
    NSString *str3;
    
    
    NSRange rang0 = NSMakeRange(5, 2);
    NSString * yueFen = [string1 substringWithRange:rang0];
    int yueShijian = [yueFen intValue];
    NSLog(@"%@",yueFen);
    
    
    
    NSRange rangN = NSMakeRange(0, 4);
    NSString * nianFen = [string1 substringWithRange:rangN];
    int nianFenShiJ = [nianFen intValue];
    NSLog(@"%d",nianFenShiJ);
    str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
    NSLog(@"%@",anewNianFen);
    
    NSRange rang = NSMakeRange(8, 2);
    NSString * string2 =[string1 substringWithRange:rang];
    NSLog(@" %@",string2);
	//NSString * string2 =[string substringFromIndex:8];
    int value = [string2 intValue];
    // int value2 = value +1;
    int value2;
    int newyueFenshi;
    int newNianFrnShi;
    
    if (yueShijian == 1||yueShijian == 3 || yueShijian ==5 || yueShijian == 7|| yueShijian == 8 || yueShijian == 10 ) {
        
        NSLog(@"%d",yueShijian);
        
        if (value == 31) {
            value2 = 1;
            newyueFenshi = yueShijian + 1;
            
            str2 = [NSString stringWithFormat:@"%d",newyueFenshi];
            str3 = [NSString stringWithFormat:@"%d",value2];
            NSLog(@"%d",value2);
            NSLog(@"%d",newyueFenshi);
        }else{
            
            value2 = value +1;
            str3 = [NSString stringWithFormat:@"%d",value2];
            str2 = [NSString stringWithFormat:@"%d",yueShijian];
            NSLog(@"%d",value2);
        }
        
    }
    else if (yueShijian == 4 || yueShijian == 6 || yueShijian == 9 || yueShijian == 11){
        
        if (value == 30) {
            value2 = 1;
            newyueFenshi = yueShijian + 1;
            str2 = [NSString stringWithFormat:@"%d",newyueFenshi];
            str3 = [NSString stringWithFormat:@"%d",value2];
            
            NSLog(@"%d",value2);
            NSLog(@"%d",newyueFenshi);
        }else{
            
            value2 = value + 1;
            
            str3 = [NSString stringWithFormat:@"%d",value2];
            str2 = [NSString stringWithFormat:@"%d",yueShijian];
        }
        
    }else if(yueShijian == 12){
    
        if (value == 31) {
            value2 = 1;
            newyueFenshi = 1;
            newNianFrnShi = nianFenShiJ + 1;
            str1 = [NSString stringWithFormat:@"%d",newNianFrnShi];
            str2 = [NSString stringWithFormat:@"%d",newyueFenshi];
            str3 = [NSString stringWithFormat:@"%d",value2];
        }else
        {
            value2 = value + 1;
            str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
            str2 = [NSString stringWithFormat:@"%d",yueShijian];
            str3 = [NSString stringWithFormat:@"%d",value2];

            
        }
    
    }else if (yueShijian == 2){
        if (nianFenShiJ/4 == 0 ) {
            if (value ==29) {
                value2 = 1;
                newyueFenshi = yueShijian + 1;
                str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
                str2 = [NSString stringWithFormat:@"%d",newyueFenshi];
                str3 = [NSString stringWithFormat:@"%d",value2];

            }else {
                value2 = value + 1;
                str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
                str2 = [NSString stringWithFormat:@"%d",yueShijian];
                str3 = [NSString stringWithFormat:@"%d",value2];

            }
            
        }else if (nianFenShiJ/4!=0){
            if (value == 28) {
                value2 = 1;
                newyueFenshi = yueShijian + 1;
                str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
                str2 = [NSString stringWithFormat:@"%d",newyueFenshi];
                str3 = [NSString stringWithFormat:@"%d",value2];
            }else {
                value2 = value + 1;
                str1 = [NSString stringWithFormat:@"%d",nianFenShiJ];
                str2 = [NSString stringWithFormat:@"%d",yueShijian];
                str3 = [NSString stringWithFormat:@"%d",value2];
                
            }
        
        
        }
        
    
    }
    
    
    self.anewNianFen = str1;
    self.anewYunStr = str2;
    self.anewDayStr = str3;
    
    if (anewNianFen != nil) {
        
        
        [self.delegate chuanzhiString:anewNianFen withStrt:anewYunStr withStr:anewDayStr withTag:self.tag];
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    } else{
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请选择日期!"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
        
        
    }

    

}

-(void)calendarView:(VRGCalendarView *)calendarView switchedToMonth:(int)month targetHeight:(float)targetHeight animated:(BOOL)animated {
    if (month==[[NSDate date] month]) {
        NSArray *dates = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],[NSNumber numberWithInt:5], nil];
        [calendarView markDates:dates];
    }
}

-(void)calendarView:(VRGCalendarView *)calendarView dateSelected:(NSDate *)date {
   
    NSDateFormatter *formater = [[[ NSDateFormatter alloc] init] autorelease];
    NSDate * nowData = [NSDate date];
    [formater setDateFormat:@"yyyy-MM-dd HH:MM"];
    NSString * curTime = [formater stringFromDate:nowData];
    NSLog(@"%@",curTime);
    
    NSRange rangeNow = NSMakeRange(0, 4);
    NSRange rangeNow2 = NSMakeRange(5, 2);
    NSRange rangeNow3 = NSMakeRange(8, 2);
    int aa = [[curTime substringWithRange:rangeNow] intValue];
    int bb = [[curTime substringWithRange:rangeNow2] intValue];
    int cc = [[curTime substringWithRange:rangeNow3] intValue];
    
    datey = date;
    NSMutableString * string1 = [NSString stringWithFormat:@"%@",datey];
    NSLog(@"%@",string1);
    
    NSRange range = NSMakeRange(0, 4);
    NSRange range2 = NSMakeRange(5, 2);
    NSRange range3 = NSMakeRange(8, 2);
    
    int a = [[string1 substringWithRange:range] intValue];
    int b = [[string1 substringWithRange:range2] intValue];
    int c = [[string1 substringWithRange:range3] intValue];
    
    if (a == aa && b == bb && c + 1 >= cc) {
        
        [self myDateCh:datey];
    }else if (a > aa) {
        
        [self myDateCh:datey];
    }else if (a == aa && b > bb ) {
    
        [self myDateCh:datey];
    }

    else{
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"请输入大于当前时间日期!"
                                                         message:@"或者当前日期!"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
        
        
        
        
    }

    
    

}




- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)dealloc
{
    [string4 release];
    [anewDayStr release];
    [anewNianFen release];
    [anewYunStr release];
    [super dealloc];
}
@end
