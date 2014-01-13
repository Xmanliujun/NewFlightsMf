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
@interface RootViewController ()

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
    //设置显示的区域
     NSLog(@"placeArray被传数组长度 %d",[placeArray count]);
     NSLog(@"twoPlaceAry被传数组长度 %d",[twoPlaceAry count]);
    if (self.placeArray != nil) {
        XmlSHUJv * xml = [self.placeArray objectAtIndex:0];
        
        CLLocationCoordinate2D center ;
        center.longitude = [xml.Longitude doubleValue];
        center.latitude = [xml.Latitude doubleValue];
        
        
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
    
        ZhoubianXMLOne * xml = [self.twoPlaceAry objectAtIndex:0];
        
        CLLocationCoordinate2D center ;
        center.longitude = [xml.Longitude doubleValue];
        center.latitude = [xml.Latitude doubleValue];
        
        
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
            
            XmlSHUJv *xml = [self.placeArray objectAtIndex:i];
            Place * p = [[Place alloc] init];
            p.title = [NSString stringWithFormat:@"%@",xml.BasicProperty];
            p.subtitle = [NSString stringWithFormat:@"地址:%@",xml.Address];
            
            p.longitude = [xml.Longitude doubleValue];
            p.latitude = [xml.Latitude doubleValue];
            
            MyAnnotation * anno = [[MyAnnotation alloc] initWithPlace:p];
            [p release];
            [myMapView addAnnotation:anno];
            [anno release];
            
            
            
        }

    }else if (self.twoPlaceAry != nil){
    
        for (int i = 0 ; i < [self.twoPlaceAry count]; i++) {
            
            ZhoubianXMLOne *xml = [self.twoPlaceAry objectAtIndex:i];
            Place * p = [[Place alloc] init];
            p.title = [NSString stringWithFormat:@"%@",xml.BasicProperty];
            p.subtitle = [NSString stringWithFormat:@"地址:%@",xml.Address];
            
            p.longitude = [xml.Longitude doubleValue];
            p.latitude = [xml.Latitude doubleValue];
            
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
    
   // self.placeArray = [[NSMutableArray alloc] initWithCapacity:0];
    
    UIImage * imageNav = [[UIImage imageNamed:@"top321.png"] stretchableImageWithLeftCapWidth:0 topCapHeight:1];
    [self.navigationController.navigationBar setBackgroundImage:imageNav forBarMetrics:UIBarMetricsDefault];
    
    
    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 5, 50, 30);
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
