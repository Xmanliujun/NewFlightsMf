//
//  ChangChaXunViewController.m
//  jiudian
//
//  Created by XmL on 12-10-24.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "ChangChaXunViewController.h"
#import "ASIHTTPRequest.h"
#import "ASIFormDataRequest.h"
#import "UIImageView+WebCache.h"
#import "ChangGJiuDViewController.h"
#import "SXView.h"
#import "RooViewController.h"
#import "NRecommenddexml.h"
#import "StrNXmlRemmed.h"


@interface ChangChaXunViewController ()




@end



static NSString *kRoomStayStr  = @"RoomStay";
static NSString *kBasicPropertyStr  = @"BasicProperty";
static NSString *kRankStr     = @"Rank";
static NSString *kAddressStr   = @"Address";
static NSString *kTelStr  = @"Tel";
static NSString *kLongDescStr  = @"LongDesc";
static NSString *kImagesStr  = @"URL";
static NSString *kMaxRate = @"MaxRate";
static NSString *kMinRate = @"MinRate";
static NSString *kHotelCode = @"HotelCode";
static NSString * kError = @"Errors";
static NSString * kPosition = @"Position";


@implementation ChangChaXunViewController

@synthesize workingArray,workingString,dataToParse,elementArray,workingEntry,storingCharacterData,trackingCategoryName,trackingReleaseDate,httpStar;
@synthesize ruZhuri,liDianri,chengShiM,myString,xingJi,canJig,canJig1,stringaa,sanZiMa,strMing,xjdict;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)init
{
    if (self = [super init]) {
        self.elementArray = [NSArray arrayWithObjects:kRoomStayStr,kBasicPropertyStr,kRankStr,kAddressStr,kTelStr,kLongDescStr,kImagesStr,kMaxRate,kMinRate,kHotelCode,kError,kPosition, nil];
    }
    return self;
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (alertView.tag == 123) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
    else
    {
        
        [self dismissViewControllerAnimated:YES completion:NULL];
        
    }
	
    
    
}
//
//-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
//{
//    if ([elementName isEqualToString:kRoomStayStr]) {
//        self.workingEntry = [[[XmlSHUJv alloc] init] autorelease];
//    }
//    if (self.workingEntry) {
//        storingCharacterData = [elementArray containsObject:elementName];
//        if (storingCharacterData == NO) {
//            
//        }
//    }
//    
//    if ([elementName isEqualToString:kBasicPropertyStr]) {
//        myDictionary = [[[NSDictionary alloc] init] autorelease];
//        myDictionary = attributeDict;
//        
//        
//        
//    }
//    if ([elementName isEqualToString:kPosition]) {
//        myImage = [[[NSDictionary alloc] init] autorelease];
//        myImage = attributeDict;
//        
//    }
//    if ([elementName isEqualToString:kError]) {
//        httpStar = NO;
//        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"服务器繁忙！"
//                                                         message:@"请稍后刷新"
//                                                        delegate:self
//                                               cancelButtonTitle:@"确定"
//                                               otherButtonTitles:nil];
//        alertView.tag = 123;
//        [alertView show];
//        [alertView release];
//        
//        [activity stopAnimating];
//        
//        
//    }
//    
//    
//    
//    
//}
//
//-(void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
//{
//    if (storingCharacterData) {
//        [workingString appendString:string];
//    }
//    
//    
//    
//}
//
//-(void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
//{
//    
//    
//    if (self.workingEntry) {
//        if ([elementName isEqualToString:kRoomStayStr]) {
//            NSLog(@"aaa");
//            
//        }
//        
//        if (storingCharacterData) {
//            NSString * trimmedString = [workingString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//            [workingString setString:@""];
//            if ([elementName isEqualToString:kBasicPropertyStr]) {
//                
//                
//            }
//            else if ([elementName isEqualToString:kRankStr]){
//                self.workingEntry.BasicProperty = nil;
//                self.workingEntry.Rank = trimmedString;
//                
//                self.workingEntry.BasicProperty = [myDictionary valueForKey:@"HotelName"];
//                
//                self.workingEntry.HotelCode = [myDictionary valueForKey:@"HotelCode"];
//                
//                
//                self.workingEntry.Longitude = [myImage valueForKey:@"Longitude"];
//                self.workingEntry.Latitude = [myImage valueForKey:@"Latitude"];
//                NSLog(@"log %@  lat %@",self.workingEntry.Longitude,self.workingEntry.Latitude);
//                
//            }
//            else if ([elementName isEqualToString:kAddressStr]){
//                
//                self.workingEntry.Address = trimmedString;
//            }
//            else if ([elementName isEqualToString:kTelStr]){
//                
//                self.workingEntry.Tel = trimmedString;
//            }
//            else if ([elementName isEqualToString:kLongDescStr]){
//                
//                self.workingEntry.LongDesc = trimmedString;
//
//                
//            }
//            else if ([elementName isEqualToString:kImagesStr]){
//                
//                if (self.workingEntry.Images==nil) {
//                    self.workingEntry.Images = trimmedString;
//                }
//                
//                
//                
//                
//                
//            }else if ([elementName isEqualToString:kMaxRate]){
//                
//                self.workingEntry.MaxRate = trimmedString;
//            }else if ([elementName isEqualToString:kMinRate]){
//                
//                self.workingEntry.MinRate = trimmedString;
//            }
//            
//        }
//        
//        if ([elementName isEqualToString:kRoomStayStr]) {
//            [self.workingArray addObject:self.workingEntry];
//            
//            self.workingEntry = nil;
//            
//        }
//    }
//    
//    
//    
//    [activity stopAnimating];
//    httpStar = NO;
//}
//
//-(void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
//{
//    
//    NSLog(@"出错了Error is %@",parseError);
//    
//}
//
//-(void)parseXmlData:(NSData*)data
//{
//    self.dataToParse = data;
//    
//    self.workingString = [NSMutableString string];
//    
//    
//    NSXMLParser * parser = [[NSXMLParser alloc] initWithData:dataToParse];
//    
//    [parser setDelegate:self];
//    [parser parse];
//    
//    
//    
//    
//}

-(void)requestFailed:(ASIHTTPRequest *)request
{
    httpStar = NO;
    
    NSError * error = [request error];
    NSLog(@"%@",error);
    [activity stopAnimating];
    
    UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时"
                                                     message:@"返回上一界面"
                                                    delegate:self
                                           cancelButtonTitle:@"确定"
                                           otherButtonTitles:nil];
    [alertView show];
    [alertView release];
    
    
    
}

- (void)requestFinished:(ASIHTTPRequest *)request
{
    NSLog(@"下载完成");
    [activity stopAnimating];
    if (request.tag==1000  ) {
        httpStar = NO;
        NSLog(@"post  is %@",[request responseString]);
        
       
        self.workingArray = [NRecommenddexml nRecommdenXml:[request responseString]];
        if ([self.workingArray count] == 0) {
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"没有相关条件的酒店"
                                                             message:@"返回上一界面"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            alertView.tag = 122;
            [alertView show];
            [alertView release];
            
            
        }else{
            [tableViewone reloadData];
            
        }

      
        
        
    }else if (request.tag == 1003 ){
        httpStar = NO;
        NSLog(@"post2  is %@",[request responseString]);
        NSMutableArray * a = [[[NSMutableArray alloc] initWithCapacity:0]autorelease];
        
         a = [NRecommenddexml nRecommdenXml:[request responseString]];
        [self.workingArray addObjectsFromArray:a];
        
        NSLog(@"post 2 num %d",[self.workingArray count]);
        
        if ([self.workingArray count] == 0) {
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"没有相关条件的酒店"
                                                             message:@"返回上一界面"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            alertView.tag = 122;
            [alertView show];
            [alertView release];
            
            
        }else{
            [tableViewone reloadData];
            view.frame = CGRectMake(0.0f, tableViewone.contentSize.height, tableViewone.frame.size.width, tableViewone.bounds.size.height);
            
            
        }
        
                
    }else if (request.tag == 1005 ){
        httpStar = NO;
        [self.workingArray removeAllObjects];
        NSLog(@"星级 数组 %d ",[self.workingArray count]);
        NSLog(@"post  is %@",[request responseString]);
         self.workingArray = [NRecommenddexml nRecommdenXml:[request responseString]];
      
                
        if ([self.workingArray count] == 0) {
            
            UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"没有相关条件的酒店"
                                                             message:@"返回上一界面"
                                                            delegate:self
                                                   cancelButtonTitle:@"确定"
                                                   otherButtonTitles:nil];
            alertView.tag = 122;
            [alertView show];
            [alertView release];
            
            
        }else{
            [tableViewone reloadData];
            
        }
        
    }
    
    else{
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"网络链接超时"
                                                         message:@"返回上一界面"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
        
    }

    
    
    
    
}


-(void)httpXmL
{
    
    NSLog(@"准备下载");
    
    
    
    if (self.chengShiM == nil&&canJig == nil) {
        //yilong_hotel_1
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春",ruZhuri,liDianri,nil];
        NSLog(@"1*****  %@",stringaa);
        

        
    }
    
    else if (xingJi != nil && self.chengShiM==nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&star=%@&max=%@&min=%@",ruZhuri,liDianri,xingJi,canJig1,canJig,nil];
        NSLog(@"2*****  %@",stringaa);

        
    }
    
    
    
    else if (xingJi != nil && self.chengShiM != nil&&canJig != nil) {

        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&star=%@&max=%@&min=%@",ruZhuri,liDianri,self.chengShiM,xingJi,canJig1,canJig,nil];
        NSLog(@"3*****  %@",stringaa);
        
    }
    
    else if (self.chengShiM != nil && xingJi == nil) {
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@",ruZhuri,liDianri,self.chengShiM,nil];
        NSLog(@"4*****  %@",stringaa);
    }
    
    
   
    
    
    stringaa = [stringaa stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"&&&&&  %@",stringaa);
    
    NSURL * url = [NSURL URLWithString:stringaa];
    
    
    
    
    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1000];
    [formDataRequest setPostValue:stringaa forKey:@"request"];
    [formDataRequest setTimeOutSeconds:100];
    [formDataRequest setDelegate:self];
    [formDataRequest startAsynchronous];
    
    [activity startAnimating];
    
    httpStar = YES;
    
}


-(void)httpPaiXun:(NSString * )paixun
{
    
    if (self.chengShiM == nil && paixun != nil&& xingJi == nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&PriceSort=%@",ruZhuri,liDianri,paixun];
        NSLog(@" new one  string %@",stringaa);

        
    }
    else if (self.chengShiM == nil && xingJi != nil  && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&star=%@&max=%@&min=%@&PriceSort=%@",ruZhuri,liDianri,xingJi,canJig1,canJig,paixun];
        NSLog(@" new one  string %@",stringaa);
        
           }
    
    
    
    
    
    else if (self.chengShiM != nil && xingJi != nil && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&star=%@&max=%@&min=%@&PriceSort=%@",ruZhuri,liDianri,self.chengShiM,xingJi,canJig1,canJig,paixun];
        NSLog(@" new one  string %@",stringaa);
        
                
    }
    else if (self.chengShiM != nil && xingJi == nil  && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&PriceSort=%@",ruZhuri,liDianri,self.chengShiM,paixun];
        NSLog(@" new one  string %@",stringaa);
        
                
    }
    
    
    
    stringaa = [stringaa stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@" new two string %@",stringaa);
    
    NSURL * url = [NSURL URLWithString:stringaa];
    
    
    
    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1005];
    [formDataRequest setPostValue:stringaa forKey:@"request"];
    [formDataRequest setDelegate:self];
    [formDataRequest setTimeOutSeconds:100];
    [formDataRequest startAsynchronous];
    
    [activity startAnimating];
    httpStar = YES;
    
    
}

-(void)httpSaiXuan:(NSString * )paixun
{

    if (self.chengShiM == nil && paixun != nil&& xingJi == nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&StarSort=%@",ruZhuri,liDianri,paixun];
        NSLog(@" new one  string %@",stringaa);

    }
    else if (self.chengShiM == nil && xingJi != nil  && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&star=%@&max=%@&min=%@&StarSort=%@",ruZhuri,liDianri,xingJi,canJig1,canJig,paixun];
        NSLog(@" new one  string %@",stringaa);
        
    }
    
    
    
    
    
    else if (self.chengShiM != nil && xingJi != nil && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&star=%@&max=%@&min=%@&StarSort=%@",ruZhuri,liDianri,self.chengShiM,xingJi,canJig1,canJig,paixun];
        NSLog(@" new one  string %@",stringaa);
        
        
    }
    else if (self.chengShiM != nil && xingJi == nil  && paixun != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&StarSort=%@",ruZhuri,liDianri,self.chengShiM,paixun];
        NSLog(@" new one  string %@",stringaa);
        
        
    }
    
    
    
    stringaa = [stringaa stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSLog(@" new two string %@",stringaa);
    
    NSURL * url = [NSURL URLWithString:stringaa];
    
    
    
    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1005];
    [formDataRequest setPostValue:stringaa forKey:@"request"];
    [formDataRequest setDelegate:self];
    [formDataRequest setTimeOutSeconds:100];
    [formDataRequest startAsynchronous];
    
    [activity startAnimating];
    httpStar = YES;



}

-(void)btnFanHui:(UIButton * )btn
{
    
    if (httpStar == YES) {
        [formDataRequest clearDelegatesAndCancel];
        [self dismissViewControllerAnimated:YES completion:NULL];
        httpStar = NO;
    }else{
    
    [self dismissViewControllerAnimated:YES completion:NULL];
    }
    
    
    
}
-(void)shaixuan:(UIButton *)button
{
    sxviewa.hidden = NO;
    
    
}
-(void)sxDizG:(UIButton *)btn
{
    
    
    if (btn.tag == 100) {
        sxviewa.hidden = YES;
        NSLog(@"100");
        NSString * paix = @"0";
        [self httpPaiXun:paix];
        
    }else if (btn.tag == 101){
        
        sxviewa.hidden = YES;
        NSLog(@"101");
        NSString * paix = @"1";
        [self httpPaiXun:paix];
        
    }else if (btn.tag == 102){
        
        sxviewa.hidden = YES;
        NSLog(@"102");
        NSString * paix = @"0";
        [self httpSaiXuan:paix];
    }else if (btn.tag == 103){
        
        sxviewa.hidden = YES;
        NSLog(@"103");
        NSString * paix = @"1";
        [self httpSaiXuan:paix];
    }
    
    
    
}

-(void)paixun:(UIButton * )button
{
    
    
    if (httpStar == YES) {
        [formDataRequest clearDelegatesAndCancel];
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"下载未完成！"
                                                         message:@"返回上一界面"
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        alertView.tag = 123;
        [alertView show];
        [alertView release];
        
        [activity stopAnimating];
        
        
        
    }else{
        RooViewController * rvc = [[RooViewController alloc] initWithArray:workingArray withTag:@"changgui"];
        UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:rvc] autorelease];
        
        NSLog(@"传数组长度 %d",[workingArray count]);
        rvc.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        [self presentViewController:nav animated:YES completion:NULL];
        [rvc release];
    }
    
}

-(void)guanBi:(UIButton *)button
{
    
    if (button.tag == 32) {
        sxviewa.hidden = YES;
        
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

    i = 2;
    workingArray = [[NSMutableArray alloc] initWithCapacity:0];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    CGRect rect = self.view.bounds;
    
    
    
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
    
    tableViewone = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, rect.size.height - 140) style:UITableViewStylePlain];
    tableViewone.delegate =self;
    tableViewone.dataSource = self;
    [self.view addSubview:tableViewone];
    [tableViewone release];
    
    
    
    UIButton * shaiXuan = [UIButton buttonWithType:UIButtonTypeCustom];
    shaiXuan.frame = CGRectMake(20, rect.size.height - 120, 120, 40);
    [shaiXuan setImage:[UIImage imageNamed:@"筛选.png"] forState:UIControlStateNormal];
    [shaiXuan addTarget:self action:@selector(shaixuan:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:shaiXuan];
    
    UIButton * paiXun = [UIButton buttonWithType:UIButtonTypeCustom];
    paiXun.frame = CGRectMake(180, rect.size.height - 120, 120, 40);
    [paiXun setImage:[UIImage imageNamed:@"地图.png"] forState:UIControlStateNormal];
    [paiXun addTarget:self action:@selector(paixun:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:paiXun];
    
    UIImageView * huaImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"buttmn322.png"]];
    huaImageView.frame = CGRectMake(0, rect.size.height - 73, 320, 30);
    [self.view addSubview:huaImageView];
    [huaImageView release];
    
    activity = [[[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(0, 0, 60, 60)] autorelease];
    [activity setCenter:CGPointMake(160, 200)];
    [activity setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];
    
    [self.view addSubview:activity];
    
    
    NSLog(@"%@%@%@",chengShiM,ruZhuri,liDianri);
    
    sxviewa = [[[SXView alloc] initWithFrame:CGRectMake(20, rect.size.height - 273, 280, 200)] autorelease];
    sxviewa.backgroundColor = [UIColor whiteColor];
    sxviewa.hidden = YES;
    [self.view addSubview:sxviewa];
    
    UIImageView * sxImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 280, 30)];
    sxImage.image = [UIImage imageNamed:@"弹出框顶端1.png"];
    [sxviewa addSubview:sxImage];
    [sxImage release];
    UIButton * imgeBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    imgeBtn.frame = CGRectMake(240, 2, 25, 25);
    imgeBtn.tag = 32;
    [imgeBtn setImage:[UIImage imageNamed:@"弹窗关闭.png"] forState:UIControlStateNormal];
    [imgeBtn addTarget:self action:@selector(guanBi:) forControlEvents:UIControlEventTouchUpInside];
    [sxviewa addSubview:imgeBtn];
    
    
    
    UIButton * sxbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    sxbtn.frame = CGRectMake(60, 34, 160, 40);
    sxbtn.tag = 100;
    
    UIImageView *qimg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    qimg.image = [UIImage imageNamed:@"弹出按钮.png"];
    [sxbtn addSubview:qimg];
    [qimg release];
    UILabel * lq = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    lq.textAlignment = NSTextAlignmentCenter;
    lq.backgroundColor = [UIColor clearColor];
    lq.textColor = [UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    lq.text = @"按价格从低到高";
    [qimg addSubview:lq];
    [lq release];
    
    
    
    [sxbtn setImage:qimg.image forState:UIControlStateNormal];
    [sxbtn addTarget:self action:@selector(sxDizG:) forControlEvents:UIControlEventTouchUpInside];
    [sxviewa addSubview:sxbtn];
    
    
    UIButton * sxbtn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    sxbtn1.frame = CGRectMake(60, 75, 160, 40);
    sxbtn1.tag = 101;
    
    
    UIImageView *qimg1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    qimg1.image = [UIImage imageNamed:@"弹出按钮.png"];
    [sxbtn1 addSubview:qimg1];
    [qimg1 release];
    UILabel * lq1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    lq1.textAlignment = NSTextAlignmentCenter;
    lq1.backgroundColor = [UIColor clearColor];
    lq1.textColor = [UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    lq1.text = @"按价格从高到低";
    [qimg1 addSubview:lq1];
    [lq1 release];
    
    [sxbtn1 setImage:qimg1.image forState:UIControlStateNormal];
    [sxbtn1 addTarget:self action:@selector(sxDizG:) forControlEvents:UIControlEventTouchUpInside];
    [sxviewa addSubview:sxbtn1];
    
    
    
    
    UIButton * sxbtn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    sxbtn2.frame = CGRectMake(60, 115, 160, 40);
    sxbtn2.tag = 102;
    
    UIImageView *qimg2 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    qimg2.image = [UIImage imageNamed:@"弹出按钮.png"];
    [sxbtn2 addSubview:qimg2];
    [qimg2 release];
    UILabel * lq2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    lq2.textAlignment = NSTextAlignmentCenter;
    lq2.backgroundColor = [UIColor clearColor];
    lq2.textColor = [UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    lq2.text = @"按星级从低到高";
    [qimg2 addSubview:lq2];
    [lq2 release];
    
    [sxbtn2 setImage:qimg2.image forState:UIControlStateNormal];
    [sxbtn2 addTarget:self action:@selector(sxDizG:) forControlEvents:UIControlEventTouchUpInside];
    [sxviewa addSubview:sxbtn2];
    
    UIButton * sxbtn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    sxbtn3.frame = CGRectMake(60, 155, 160, 40);
    sxbtn3.tag = 103;
    
    UIImageView *qimg3 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    qimg3.image = [UIImage imageNamed:@"弹出按钮.png"];
    [sxbtn3 addSubview:qimg3];
    [qimg3 release];
    UILabel * lq3 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 160, 40)];
    lq3.textAlignment = NSTextAlignmentCenter;
    lq3.backgroundColor = [UIColor clearColor];
    lq3.textColor = [UIColor colorWithRed:67/255.0 green:113/255.0 blue:130/255.0 alpha:1.0];
    lq3.text = @"按星级从高到低";
    [qimg3 addSubview:lq3];
    [lq3 release];
    
    [sxbtn3 setImage:qimg3.image forState:UIControlStateNormal];
    [sxbtn3 addTarget:self action:@selector(sxDizG:) forControlEvents:UIControlEventTouchUpInside];
    [sxviewa addSubview:sxbtn3];
    
    
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"LAN", @"六安", @"XUC", @"宣城",@"AQG",@"安庆",@"BFU",@"蚌埠",@"BOZ",@"亳州",@"CHU",@"巢湖",@"CZU",@"池州",@"CUZ",@"滁州",@"FUG",@"阜阳",@"TZS",@"天柱山",@"JHS",@"九华山",@"HFE",@"合肥",@"MAA",@"马鞍山",@"NIG",@"宁国",@"XIO",@"宿州",@"TIC",@"天长",@"HUB",@"淮北",@"HUI",@"淮南",@"TXN",@"黄山",@"JIS",@"界首",@"TOG",@"铜陵",@"WHU",@"芜湖",@"MFM",@"澳门",@"PEK",@"北京",@"NAP",@"南平",@"WUS",@"武夷山",@"JJN",@"晋江",@"JYG",@"建阳",@"JIO",@"建瓯",@"SHI",@"石狮",@"SWU",@"邵武",@"SMI",@"三明",@"QUZ",@"泉州",@"PUT",@"莆田",@"NID",@"宁德",@"XMN",@"厦门",@"NAA",@"南安",@"LIC",@"连城",@"LOY",@"龙岩",@"FUA",@"福安",@"FUD",@"福鼎",@"FUQ",@"福清",@"FOC",@"福州",@"YOA",@"永安",@"ZHP",@"漳平",@"ZHZ",@"漳州",@"TIS",@"天水",@"ZHY",@"张掖",@"YUM",@"玉门",@"PIL",@"平凉",@"JCH",@"金昌",@"CHW",@"酒泉",@"LHW",@"兰州",@"JGN",@"嘉峪关",@"DNH",@"敦煌",@"DIX",@"定西",@"HEZ",@"合作",@"QIY",@"庆阳",@"LIX",@"临夏",@"WUW",@"武威",@"HUZ",@"惠州",@"JIM",@"江门",@"JYN",@"揭阳",@"KAP",@"开平",@"XIH",@"新会",@"XYI",@"信宜",@"YAC",@"阳春",@"LEC",@"乐昌",@"LEZ",@"雷州",@"LHO",@"连州",@"CHY",@"潮阳",@"CZH",@"潮州",@"CHA",@"澄海",@"COH",@"从化",@"DGM",@"东莞",@"ENP",@"恩平",@"PAY",@"番禺",@"FUO",@"佛山",@"GAM",@"高明",@"YAJ",@"阳江",@"YNF",@"云浮",@"ZHA",@"湛江",@"ZHQ",@"肇庆",@"ZIS",@"中山",@"ZUH",@"珠海",@"CAN",@"广州",@"LUF",@"陆丰",@"LUD",@"罗定",@"MAM",@"茂名",@"MZU",@"梅州",@"NAH",@"南海",@"NAX",@"南雄",@"PUN",@"普宁",@"QYN",@"清远",@"SAS",@"三水",@"SWA",@"汕头",@"SHW",@"汕尾",@"HSC",@"韶关",@"SZX",@"深圳",@"SHD",@"顺德",@"SIH",@"四会",@"TSA",@"台山",@"HEY",@"河源",@"HSH",@"鹤山",@"HZU",@"化州",@"HYA",@"惠阳",@"FAC",@"防城港",@"YAH",@"阳朔",@"HZH",@"贺州",@"HEC",@"河池",@"QZO",@"钦州",@"PXA",@"凭祥",@"NNG",@"南宁",@"GUP",@"桂平",@"KWL",@"桂林",@"GUG",@"贵港",@"YUL",@"玉林",@"YZU",@"宜州",@"WUZ",@"梧州",@"LZH",@"柳州",@"BSI",@"百色",@"BHY",@"北海",@"BEL",@"北流",@"DOX",@"东兴",@"ZYI",@"遵义",@"BIJ",@"毕节",@"KWE",@"贵阳",@"REH",@"仁怀",@"HDU",@"花都",@"TOR",@"铜仁",@"LIP",@"六盘水",@"KAL",@"凯里",@"XYN",@"兴义",@"DUJ",@"都匀",@"ANS",@"安顺",@"QHA",@"琼海",@"BUT",@"保亭",@"WEC",@"文昌",@"LSX",@"陵水县",@"WAN",@"万宁",@"SYX",@"三亚",@"XZS",@"五指山",@"TOS",@"通什",@"DAZ",@"儋州",@"HAK",@"海口",@"CHD",@"承德",@"REQ",@"任丘",@"CAZ",@"沧州",@"BDH",@"北戴河",@"BAD",@"保定",@"TAS",@"唐山",@"SJW",@"石家庄",@"HSU",@"衡水",@"HYE",@"黄骅",@"GAC",@"藁城",@"SHP",@"秦皇岛",@"XNT",@"邢台",@"ZJK",@"张家口",@"ZHU",@"涿州",@"ZHH",@"遵化",@"NDH",@"南戴河",@"LAF",@"廊坊",@"HDN",@"邯郸",@"ZHK",@"周口",@"ZHM",@"驻马店",@"LYA",@"洛阳",@"CGO",@"郑州",@"YUZ",@"禹州",@"XYG",@"荥阳",@"GOY",@"巩义",@"DEZ",@"邓州",@"DEF",@"登封",@"CGE",@"长葛",@"AYN",@"安阳",@"LIB",@"灵宝",@"LZN",@"林州",@"KAF",@"开封",@"JZU",@"焦作",@"JYA",@"济源",@"HEB",@"鹤壁",@"SHQ",@"商丘",@"SAM",@"三门峡",@"RUZ",@"汝州",@"QYA",@"沁阳",@"PUY",@"濮阳",@"PDS",@"平顶山",@"NNY",@"南阳",@"MEZ",@"孟州",@"YAS",@"偃师",@"XCA",@"许昌",@"XYA",@"信阳",@"XIX",@"新乡",@"LUH",@"漯河",@"XCH",@"项城",@"XIM",@"新密",@"MIS",@"密山",@"MDG",@"牡丹江",@"NIA",@"宁安",@"QIT",@"七台河",@"NDG",@"齐齐哈尔",@"SZI",@"尚志",@"SHY",@"双鸭山",@"SUF",@"绥芬河",@"SUH",@"绥化",@"HEG",@"鹤岗",@"HEK",@"黑河",@"HLI",@"虎林",@"JXI",@"鸡西",@"JMU",@"佳木斯",@"TLI",@"铁力",@"ACH",@"阿城",@"BEA",@"北安",@"DAQ",@"大庆",@"DAX",@"大兴安岭",@"YCH",@"伊春",@"YBL",@"亚布力",@"HRB",@"哈尔滨",@"HAL",@"海林",@"XGN",@"孝感",@"HCH",@"汉川",@"QIJ",@"潜江",@"MAC",@"麻城",@"GUS",@"广水",@"ZHX",@"钟祥",@"ZAY",@"枣阳",@"YIH",@"宜昌",@"ENH",@"恩施",@"EZH",@"鄂州",@"DAY",@"当阳",@"DAJ",@"丹江口",@"DYE",@"大冶",@"CHB",@"赤壁",@"ANL",@"安陆",@"LAH",@"老河口",@"XFN",@"襄樊",@"XAN",@"咸宁",@"XIA",@"仙桃",@"WXI",@"武穴",@"WUH",@"武汉",@"JZG",@"荆州",@"JMN",@"荆门",@"SNJ",@"神农架林区",@"SYA",@"十堰",@"SSH",@"石首",@"SOH",@"松滋",@"SOZ",@"松滋宾馆",@"SUZ",@"随州",@"TIM",@"天门",@"HOH",@"洪湖",@"HUG",@"黄冈",@"HUS",@"黄石",@"YUY",@"岳阳",@"SHS",@"韶山",@"YIY",@"益阳",@"CEZ",@"郴州",@"CHN",@"常宁",@"JSH",@"吉首",@"CGD",@"常德",@"CSX",@"长沙",@"HUH",@"怀化",@"ZHO",@"株洲",@"HNY",@"衡阳",@"LOD",@"娄底",@"LYU",@"涟源",@"LES",@"冷水江",@"FHX",@"凤凰县",@"DYG",@"张家界",@"XIT",@"湘潭",@"ZIX",@"资兴",@"SYG",@"邵阳",@"YOZ",@"永州",@"LIU",@"辽源",@"YNJ",@"延吉",@"LOJ",@"龙井",@"BAC",@"白城",@"BAS",@"白山",@"CGQ",@"长春",@"DAA",@"大安",@"DUH",@"敦化",@"ANT",@"安图",@"MEH",@"梅河口",@"SLA",@"舒兰",@"SIP",@"四平",@"SOY",@"松原",@"HUD",@"华甸",@"HUC",@"晖春",@"JIL",@"吉林",@"JIA",@"集安",@"JHE",@"蛟河",@"TNH",@"通化",@"LJN",@"临江",@"LYN",@"溧阳",@"LYG",@"连云港",@"CHS",@"常熟",@"CZX",@"常州",@"DAF",@"大丰",@"DYA",@"丹阳",@"DOT",@"东台",@"GAY",@"高邮",@"YIZ",@"仪征",@"YIX",@"宜兴",@"ZHJ",@"张家港",@"ZJA",@"镇江",@"HAA",@"海安",@"SYS",@"泗阳",@"ZZS",@"周庄",@"HAM",@"海门",@"NKG",@"南京",@"NTG",@"南通",@"PIZ",@"邳州",@"QID",@"启东",@"RUG",@"如皋",@"SZV",@"苏州",@"XIQ",@"宿迁",@"TAC",@"太仓",@"TAX",@"泰兴",@"TZU",@"泰州",@"HUA",@"淮安",@"JDU",@"江都",@"JIY",@"江阴",@"JAN",@"姜堰",@"JIT",@"金坛",@"JIJ",@"靖江",@"JUR",@"句容",@"KUS",@"昆山",@"TOZ",@"通洲",@"TOL",@"同里",@"WUX",@"无锡",@"WJI",@"吴江",@"WUJ",@"武进",@"XIN",@"新沂",@"XUZ",@"徐州",@"YNZ",@"盐城",@"YAZ",@"扬中",@"YZO",@"扬州",@"FEC",@"丰城",@"XYU",@"新余",@"GZH",@"赣州",@"YIC",@"宜春",@"YIT",@"鹰潭",@"WUY",@"婺源",@"GUX",@"贵溪",@"LUZ",@"庐山",@"KHN",@"南昌",@"PIX",@"萍乡",@"SHR",@"上饶",@"KNC",@"吉安",@"JGS",@"井冈山",@"JDZ",@"景德镇",@"JIU",@"九江",@"FUZ",@"抚州",@"LIY",@"辽阳",@"XEN",@"兴城",@"AOG",@"鞍山",@"BEN",@"北宁",@"BEX",@"本溪",@"CHG",@"朝阳",@"DLC",@"大连",@"DDG",@"丹东",@"FUS",@"抚顺",@"FUX",@"阜新",@"YIK",@"营口",@"PAJ",@"盘锦",@"SHE",@"沈阳",@"HLD",@"葫芦岛",@"JNZ",@"锦州",@"KYA",@"开原",@"TIL",@"铁岭",@"LIH",@"凌海",@"BAV",@"包头",@"XIL",@"锡林浩特",@"ERD",@"鄂尔多斯",@"ERL",@"二连浩特",@"CIF",@"赤峰",@"HLH",@"乌兰浩特",@"WHA",@"乌海",@"ZHL",@"扎兰屯",@"BYZ",@"巴彦淖尔",@"MAZ",@"满洲里",@"HET",@"呼和浩特",@"HUL",@"呼伦贝尔",@"JIN",@"集宁",@"TGO",@"通辽",@"ZWS",@"中卫",@"WZS",@"吴忠",@"INC",@"银川",@"DEL",@"德令哈",@"GOQ",@"格尔木",@"YUS",@"玉树州",@"XNN",@"西宁",@"HAN",@"海南州",@"HUN",@"黄南州",@"HAD",@"海东",@"LCN",@"聊城",@"YZH",@"兖州",@"YNT",@"烟台",@"WED",@"文登",@"WEF",@"潍坊",@"WEH",@"威海",@"LZU",@"莱州",@"LAY",@"莱阳",@"LAW",@"莱芜",@"JIZ",@"胶州",@"JNA",@"胶南",@"JNG",@"济宁",@"TNA",@"济南",@"JMO",@"即墨",@"HZE",@"菏泽",@"TAA",@"泰安",@"RUS",@"乳山",@"ROC",@"荣成",@"RIZ",@"日照",@"QUF",@"曲阜",@"QIZ",@"青州",@"TAO",@"青岛",@"PID",@"平度",@"PEL",@"蓬莱",@"SHG",@"寿光",@"LXI",@"莱西",@"FCG",@"肥城",@"QDA",@"青岛",@"LYI",@"临沂",@"LOK",@"龙口",@"BIZ",@"滨州",@"DZO",@"德州",@"DOY",@"东营",@"ZAZ",@"枣庄",@"HIY",@"海阳",@"ZIB",@"淄博",@"ZOC",@"邹城",@"LIF",@"临汾",@"SHZ",@"朔州",@"PYO",@"平遥",@"TYN",@"太原",@"JZO",@"晋中",@"CIH",@"长治",@"WTS",@"五台山",@"LSH",@"离石",@"XIU",@"忻州",@"YAQ",@"阳泉",@"HOM",@"侯马",@"JIC",@"晋城",@"YUC",@"运城",@"DAT",@"大同",@"ENY",@"延安",@"SIA",@"西安",@"AKA",@"安康",@"BAJ",@"宝鸡",@"TOC",@"铜川",@"XIY",@"咸阳",@"UYN",@"榆林",@"SHL",@"商洛",@"WEN",@"渭南",@"HAC",@"韩城",@"HZG",@"汉中",@"HYI",@"华阴",@"SHA",@"上海",@"LAZ",@"阆中",@"YAA",@"雅安",@"BAZ",@"巴中",@"CTU",@"成都",@"CHZ",@"崇州",@"DZH",@"达州",@"DEY",@"德阳",@"DOJ",@"都江堰",@"EMS",@"峨眉山",@"GAZ",@"甘孜州",@"GUA",@"广安",@"GHN",@"广汉",@"YBP",@"宜宾",@"ZIY",@"资阳",@"ZIG",@"自贡",@"HLG",@"海螺沟",@"GUY",@"广元",@"ABA",@"阿坝州",@"LZO",@"泸州",@"MES",@"眉山",@"MIG",@"绵阳",@"MIZ",@"绵竹",@"NEJ",@"内江",@"NAO",@"南充",@"PZI",@"攀枝花",@"PEZ",@"彭州",@"QIL",@"邛崃",@"SUN",@"遂宁",@"JYO",@"江油",@"JZH",@"九寨沟",@"XIC",@"西昌",@"LSA",@"乐山",@"TSN",@"天津",@"LXA",@"拉萨",@"CDU",@"昌都",@"RIK",@"日喀则",@"SHN",@"山南",@"LZI",@"林芝",@"NAQ",@"那曲",@"HKG",@"香港",@"AKU",@"阿克苏",@"URC",@"乌鲁木齐",@"ATU",@"阿图什",@"BOL",@"博乐",@"CHJ",@"昌吉",@"FUK",@"阜康",@"YIN",@"伊宁",@"KNS",@"喀纳斯",@"HMI",@"哈密",@"MIQ",@"米泉",@"SHH",@"石河子",@"TCG",@"塔城",@"HTN",@"和田",@"KHG",@"喀什",@"KLY",@"克拉玛依",@"KRL",@"库尔勒",@"KUT",@"奎屯",@"TUL",@"吐鲁番",@"AAT",@"阿勒泰",@"LJG",@"丽江",@"XIG",@"香格里拉",@"BSD",@"保山",@"CHX",@"楚雄",@"DLU",@"大理",@"DIG",@"迪庆",@"DIQ",@"迪庆州",@"GEJ",@"个旧",@"YUX",@"玉溪",@"ZAT",@"昭通",@"TCH",@"腾冲",@"MSH",@"芒市",@"LUX",@"潞西",@"QUJ",@"曲靖",@"RUL",@"瑞丽",@"SYM",@"思茅",@"JIH",@"景洪",@"KAY",@"开远",@"KMG",@"昆明",@"WES",@"文山州",@"JHG",@"西双版纳",@"LCH",@"临沧",@"LEQ",@"乐清",@"YAD",@"雁荡山",@"LIA",@"临安",@"LHA",@"临海",@"LOQ",@"龙泉",@"ANJ",@"安吉",@"CIX",@"慈溪",@"DYN",@"东阳",@"FEH",@"奉化",@"FUY",@"富阳",@"YIW",@"义乌",@"YOK",@"永康",@"YUA",@"余姚",@"HSN",@"舟山",@"ZJI",@"诸暨",@"DEQ",@"德清",@"HAY",@"海盐",@"HDA",@"横店",@"JAS",@"嘉善",@"XSH",@"象山",@"TLU",@"桐庐",@"WYI",@"武义",@"TSH",@"泰顺",@"TTA",@"天台",@"XHA",@"新昌",@"JYU",@"缙云",@"YOJ",@"永嘉",@"LYO",@"龙游",@"NHX",@"宁海县",@"PUJ",@"浦江",@"HAI",@"海宁",@"HGH",@"杭州",@"NGB",@"宁波",@"PIH",@"平湖",@"QIH",@"千岛湖",@"JUZ",@"衢州",@"RUA",@"瑞安",@"SYU",@"上虞",@"SHX",@"绍兴",@"SZU",@"嵊州", @"TAZ",@"台州",@"HZO",@"湖州",@"HYN",@"黄岩",@"JIX",@"嘉兴",@"JID",@"建德",@"JSA",@"江山",@"JHA",@"金华",@"LAX",@"兰溪",@"TOX",@"桐乡",@"WEG",@"温岭",@"WEL",@"温蛉",@"WNZ",@"温州",@"LIS",@"丽水",@"CKG",@"重庆",nil];
    
    self.strMing = [NSString stringWithFormat:@"%@",[dict valueForKey:self.chengShiM]];
    NSLog(@"三字码%@",self.strMing);
    
    self.xjdict = [NSDictionary dictionaryWithObjectsAndKeys:@"2x.png",@"2A",@"2x.png",@"2",@"3x.png",@"3",@"3x.png",@"3A",@"4x.png",@"4",@"4x.png",@"4A",@"5x.jpg",@"5",@"5x.jpg",@"5A", nil];
    
    [activity startAnimating];
    [self httpXmL];
    
    
    if (_refreshHeaderView == nil) {
		
		EGORefreshTableHeaderView *viewa = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, -620.0f, 320.0f, 620.0f)];
		viewa.delegate = self;
		[tableViewone addSubview:viewa];
		_refreshHeaderView = viewa;
		[viewa release];
		
	}
	
	//  update the last update date
	[_refreshHeaderView refreshLastUpdatedDate];
    
    if (_loadMoreFooterView == nil) {
        view = [[EGOLoadMoreTableFooterView alloc] initWithFrame:CGRectMake(0.0f, tableViewone.contentSize.height + 150, tableViewone.frame.size.width, 200)];
        view.delegate = self;
        [tableViewone addSubview:view];
        _loadMoreFooterView = view;
        [view release];
    }
    
    
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}



-(void)httpEGQ
{
    
    NSLog(@"准备下载");
    
   
    
    if (self.chengShiM == nil&&xingJi == nil) {
        
        NSLog(@"1");
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&page=%d",ruZhuri,liDianri,i,nil];
        
        

        
        NSLog(@" new  string %@",stringaa);
        
    }
    
    
    
    else if (canJig != nil && self.chengShiM==nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=长春&star=%@&max=%@&min=%@&page=%d",ruZhuri,liDianri,xingJi,canJig1,canJig,i,nil];
        

       
        
        NSLog(@"string %@",stringaa);
        
    }
    
    else if (canJig != nil && self.chengShiM != nil) {
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&star=%@&max=%@&min=%@&page=%d",ruZhuri,liDianri,self.chengShiM,xingJi,canJig1,canJig,i,nil];
        
        
        
        NSLog(@"string %@",stringaa);
        
    }
    
    
    
    else if (xingJi == nil && self.chengShiM != nil) {
        
        stringaa = [NSString stringWithFormat:@"http://139.210.99.29:83/yuanda_hotel_show/index.php/welcome/search_hotel_list_iphone?stayDate=%@&checkinDate=%@&cityCode=%@&page=%d",ruZhuri,liDianri,self.chengShiM,i,nil];
        
                
        NSLog(@"string %@",stringaa);
        
    }
    
    
    stringaa = [stringaa stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSLog(@"new two string %@",stringaa);
    
    
    NSURL * url = [NSURL URLWithString:stringaa];
    
    formDataRequest = [ASIFormDataRequest requestWithURL:url];
    [formDataRequest setTag:1003];
    [formDataRequest setPostValue:stringaa forKey:@"request"];
    [formDataRequest setDelegate:self];
    [formDataRequest setTimeOutSeconds:100];
    [formDataRequest startAsynchronous];
    
    [activity startAnimating];
    httpStar = YES;
    i++;
    
}
- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
 
    [self httpEGQ];
    NSLog(@"下拉刷新启动！");
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
   // [self httpEGQ];
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:tableViewone];
	[_loadMoreFooterView egoLoadMoreScrollViewDataSourceDidFinishedLoading:tableViewone];
    NSLog(@"下拉刷新完成！");
     
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{

	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    NSLog(@"y is %f i %d",scrollView.bounds.origin.y,i);
    [_loadMoreFooterView egoLoadMoreScrollViewDidScroll:scrollView];
    NSLog(@"yy ");
  
    
 
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"scrollView two");

	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
    
    if (scrollView.bounds.origin.y > 480 *(i-1)) {
        
    
        [_loadMoreFooterView egoLoadMoreScrollViewDidEndDragging:scrollView];
        NSLog(@"yytt ");
    }
    
    
    
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:8.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
    
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}


#pragma mark -
#pragma mark EGOLoadMoreTableFooterDelegate Methods

- (void)egoLoadMoreTableFooterDidTriggerLoad:(EGOLoadMoreTableFooterView *)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:8.0];
	
}

- (BOOL)egoLoadMoreTableFooterDataSourceIsLoading:(EGOLoadMoreTableFooterView*)view{
	
    
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoLoadMoreTableFooterDataSourceLastUpdated:(EGOLoadMoreTableFooterView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}
- (BOOL)egoLoadMoreTableFooterViewDefaultIsShowing:(EGOLoadMoreTableFooterView *)view{
    return YES;
}








-(UITableViewCell * )tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSString * CellID = @"Xml";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellID];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellID] autorelease];
        
        
        
        UIImageView * imageview = [[UIImageView alloc] initWithFrame:CGRectMake(5,10, 60, 60)];
        imageview.image = [UIImage imageNamed:@"酒店照片背景1.png"];
        
        [cell addSubview:imageview];
        [imageview release];
        
        UIImageView * imview = [[UIImageView alloc] initWithFrame:CGRectMake(3, 3, 54, 54)];
        imview.tag = 800;
        [imageview addSubview:imview];
        [imview release];
        
        
        
        
        UILabel * labelD = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 250, 20)];
        labelD.textAlignment = NSTextAlignmentLeft;
        labelD.font = [UIFont fontWithName:@"Arial" size:13];
        labelD.backgroundColor = [UIColor clearColor];
        labelD.tag = 850;
        [cell addSubview:labelD];
        [labelD release];
        
        UILabel * labelD2 = [[UILabel alloc] initWithFrame:CGRectMake(70, 50, 250, 30)];
        labelD2.textAlignment = NSTextAlignmentLeft;
        labelD2.font = [UIFont fontWithName:@"Arial" size:12];
        labelD2.backgroundColor = [UIColor clearColor];
        labelD2.numberOfLines = 0;
        labelD2.tag = 851;
        [cell addSubview:labelD2];
        [labelD2 release];
        
        UILabel * labelD3 = [[UILabel alloc] initWithFrame:CGRectMake(230, 22, 110, 25)];
        labelD3.textAlignment = NSTextAlignmentLeft;
        labelD3.font = [UIFont fontWithName:@"Arial" size:15];
        labelD3.backgroundColor = [UIColor clearColor];
        labelD3.tag = 852;
        [cell addSubview:labelD3];
        [labelD3 release];
        
        UILabel * labelD4 = [[UILabel alloc] initWithFrame:CGRectMake(70, 35, 240, 20)];
        labelD4.textAlignment = NSTextAlignmentLeft;
        labelD4.backgroundColor = [UIColor clearColor];
        labelD4.font = [UIFont fontWithName:@"Arial" size:12];
        labelD4.tag = 853;
        [cell addSubview:labelD4];
        [labelD4 release];
        
        UILabel * labelD5 = [[UILabel alloc] initWithFrame:CGRectMake(70, 20, 80, 15)];
        labelD5.textAlignment=NSTextAlignmentCenter;
        labelD5.font=[UIFont fontWithName:@"Arial" size:10];
        labelD5.backgroundColor = [UIColor clearColor];
        labelD5.tag=499;
        [cell addSubview:labelD5];
        [labelD5 release];
        
        
    }
    
    
    StrNXmlRemmed * num = [self.workingArray objectAtIndex:indexPath.row];
    
    
    
    
    UILabel *xjlab=(UILabel *)[cell viewWithTag:499];
    NSLog(@"snRand %@",num.snRank);
    UIImageView * image=[[UIImageView alloc]initWithFrame:CGRectMake(5, 0, 50, 20)];
    
    if (![num.snRank isEqualToString:@"0"]) {
        
  
    NSString * imger = [NSString stringWithFormat:@"%@",[xjdict valueForKey:num.snRank]];
    image.image = [UIImage imageNamed:imger];    
    [xjlab addSubview:image];
    [image release];
      }
    
    UILabel * mingLab = (UILabel * )[cell viewWithTag:850];
    mingLab.text = num.snHotelName;
    
    UILabel * diZhiLab = (UILabel *)[cell viewWithTag:851];
    diZhiLab.text = [NSString stringWithFormat:@"地址:%@",num.snAddress];
    UILabel * mRate = (UILabel * )[cell viewWithTag:852];
    mRate.text = [NSString stringWithFormat:@"￥%@起", num.snMinRate];
    UILabel *  mTel = (UILabel * )[cell viewWithTag:853];
    mTel.text = [NSString stringWithFormat:@"电话:%@",num.snTel];
    
    UIImageView * imageNew = (UIImageView *)[cell viewWithTag:800];
    NSLog(@"图片 %@",num.snOUrl);
   
    [imageNew setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@",num.snOUrl]] placeholderImage:nil];
    
   
    
    
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    StrNXmlRemmed * diXml = [self.workingArray objectAtIndex:indexPath.row];
    ChangGJiuDViewController * newJiuDian = [[[ChangGJiuDViewController alloc] init] autorelease];
    UINavigationController * nav = [[[UINavigationController alloc] initWithRootViewController:newJiuDian] autorelease];
    newJiuDian.ruDishi = ruZhuri;
    newJiuDian.liDishi = liDianri;
    newJiuDian.jiuDaim = diXml.snHotelCode;
    newJiuDian.addRess = diXml.snAddress;
    newJiuDian.sanZiMa = self.strMing;
    NSLog(@"strMing %@",self.strMing);

    newJiuDian.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:nav animated:YES completion:NULL];
    
    
    [tableViewone deselectRowAtIndexPath:[tableViewone indexPathForSelectedRow] animated:YES];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [self.workingArray count];
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 80;
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidUnload {
    
	_refreshHeaderView=nil;
}


-(void)dealloc
{
    [dataToParse release];
    [workingEntry release];
    [workingString release];
    //[workingArray release];
    [chengShiM release];
    [strMing release];
   
    
    _refreshHeaderView = nil;
    
    [super dealloc];
    
    
}



@end
