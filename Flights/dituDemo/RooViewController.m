//
//  RootViewController.m
//  MapKit
//
//  Created by XmL on 12-11-6.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "RooViewController.h"
#import "MyAnnotation.h"
#import "Place.h"
#import "XmlSHUJv.h"
#import "ZhoubianXMLOne.h"
#import "StrNXmlRemmed.h"
@interface RooViewController ()

@end

@implementation RooViewController
@synthesize placeArray,twoPlaceAry;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(id)initWithArray:(NSMutableArray *)array withTag:(NSString *)tag
{
    if(self = [super init])
    {
        if ([tag isEqualToString:@"changgui"]) {
             self.placeArray =[NSMutableArray arrayWithArray:array] ;
        }else if([tag isEqualToString:@"zhoubian"]){
            self.twoPlaceAry = [NSMutableArray arrayWithArray:array];
        }
       
        
    }

    return self;
}
-(void)initMap
{

    myMapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    myMapView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
    [myMapView setMapType:MKMapTypeStandard];
    
     NSLog(@"placeArray被传数组长度 %d",[placeArray count]);
     NSLog(@"twoPlaceAry被传数组长度 %d",[twoPlaceAry count]);
    if (self.placeArray != nil) {
        StrNXmlRemmed * xml = [self.placeArray objectAtIndex:0];
        
        CLLocationCoordinate2D center ;
        center.longitude = [xml.snPositionLog doubleValue];
        center.latitude = [xml.snPositionLat doubleValue];
        
        
        MKCoordinateSpan span;
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.1;
        
        MKCoordinateRegion region = {center,span};
        [myMapView setRegion:region animated:YES];
        
        [self.view addSubview:myMapView];
        [myMapView release];
        
        MyAnnotation * annotation1 = [[[MyAnnotation alloc] init] autorelease];
        
        [myMapView addAnnotation:annotation1];

        
    }else if (self.twoPlaceAry != nil){
    
        StrNXmlRemmed * xml = [self.twoPlaceAry objectAtIndex:0];
        
        CLLocationCoordinate2D center ;
        center.longitude = [xml.snPositionLog doubleValue];
        center.latitude = [xml.snPositionLat doubleValue];
        
        
        MKCoordinateSpan span;
        span.latitudeDelta = 0.1;
        span.longitudeDelta = 0.1;
        
        MKCoordinateRegion region = {center,span};
        [myMapView setRegion:region animated:YES];
        
        [self.view addSubview:myMapView];
        [myMapView release];
        
        MyAnnotation * annotation1 = [[[MyAnnotation alloc] init] autorelease];
        
        [myMapView addAnnotation:annotation1];
    
    
    
    }
    
       
    if (self.placeArray !=nil) {
        for (int i = 0 ; i < [self.placeArray count]; i++) {
            
            StrNXmlRemmed *xml = [self.placeArray objectAtIndex:i];
            Place * p = [[Place alloc] init];
            p.title = [NSString stringWithFormat:@"%@",xml.snHotelName];
            p.subtitle = [NSString stringWithFormat:@"地址:%@",xml.snAddress];
            
            p.longitude = [xml.snPositionLog doubleValue];
            p.latitude = [xml.snPositionLat doubleValue];
            
            MyAnnotation * anno = [[MyAnnotation alloc] initWithPlace:p];
            [p release];
            [myMapView addAnnotation:anno];
            [anno release];
            
            
            
        }

    }else if (self.twoPlaceAry != nil){
    
        for (int i = 0 ; i < [self.twoPlaceAry count]; i++) {
            
            StrNXmlRemmed *xml = [self.twoPlaceAry objectAtIndex:i];
            Place * p = [[Place alloc] init];
            p.title = [NSString stringWithFormat:@"%@",xml.snHotelName];
            p.subtitle = [NSString stringWithFormat:@"地址:%@",xml.snAddress];
            
            p.longitude = [xml.snPositionLog doubleValue];
            p.latitude = [xml.snPositionLat doubleValue];
            
            MyAnnotation * anno = [[MyAnnotation alloc] initWithPlace:p];
            [p release];
            [myMapView addAnnotation:anno];
            [anno release];

    
    
    
        }
    
    }
}
-(void)btnFanHui:(UIButton *)button
{


    [self dismissViewControllerAnimated:YES completion:NULL];

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

    [self initMap];
}

-(void)dealloc
{

    [placeArray release];
    [super dealloc];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
