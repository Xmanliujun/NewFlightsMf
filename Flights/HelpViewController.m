//
//  HelpViewController.m
//  Flights
//
//  Created by mac on 13-1-21.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import "HelpViewController.h"
#import "RootViewController.h"
#import "AppDelegate.h"

@interface HelpViewController ()

@end

@implementation HelpViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)goSetUpView:(id)sender
{
    
    RootViewController*main = [[[RootViewController alloc] init] autorelease];
    
    ShareApp.window.rootViewController = main;
    
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

    [self.view setBackgroundColor:[UIColor darkGrayColor]];
    picArray=[[NSMutableArray alloc]init];
    for (int i=1; i<=4; i++) {
        [picArray addObject:[NSString stringWithFormat:@"HelpNavigation%d.png",i]];
    }
    NSLog(@"%d",[picArray count]);
    scrollView=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    scrollView.showsVerticalScrollIndicator=NO;
    scrollView.showsHorizontalScrollIndicator=NO;
    scrollView.pagingEnabled=YES;
    scrollView.scrollsToTop=NO;
    scrollView.delegate=self;
    scrollView.backgroundColor=[UIColor whiteColor];
    scrollView.bounces = NO;
    scrollView.contentSize=CGSizeMake(self.view.frame.size.width*[picArray count], self.view.frame.size.height);
    
    
    for (int i=0; i<[picArray count]; i++) {
        UIImageView *image=[[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width*i, 0, self.view.frame.size.width, self.view.frame.size.height)];
        
        image.image=[UIImage imageNamed:[picArray objectAtIndex:i]];
        
        [scrollView addSubview:image];
        
        [image release];
        
        CGRect rect = self.view.bounds;
        
        UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(self.view.frame.size.width * [picArray count] - 100, rect.size.height - 120, 100, 100);
        [btn setTitle:nil forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(goSetUpView:) forControlEvents:UIControlEventTouchUpInside];
        [scrollView addSubview:btn];
        
    }
    [self.view addSubview:scrollView];
    [self.view addSubview:pageControl];

}

-(void)dealloc
{
    [super dealloc];
    [scrollView release];
    [pageControl release];
    [picArray release];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
