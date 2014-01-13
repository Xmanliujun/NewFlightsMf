//
//  MySliderViewController.m
//  jiudian
//
//  Created by XmL on 12-10-18.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "MySliderViewController.h"
#import "DoubleSlider.h"

#define SLIDER_VIEW_TAG     1234


@interface MySliderViewController ()
- (void)valueChangedForDoubleSlider:(DoubleSlider *)slider;
@end

@implementation MySliderViewController
@synthesize delegate,str3,tag;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)valueChangedForDoubleSlider:(DoubleSlider *)slider
{
    
    int a = (int)slider.minSelectedValue;
    int b = (int)slider.maxSelectedValue;
	leftLabel.text = [NSString stringWithFormat:@"%d", a];
	rightLabel.text = [NSString stringWithFormat:@"%d", b];
    
    
    
    
}

- (void)devButtonHandler:(id)sender {
    
    NSLog(@"%@",leftLabel.text);
    NSLog(@"%@",rightLabel.text);
    
    NSString * str = [NSString stringWithFormat:@"%@",leftLabel.text];
    NSString * str1 = [NSString stringWithFormat:@"%@",rightLabel.text];
    
    if (str != nil && str3 != nil) {
        [delegate sliderString:str withStrt:str1 withStr:str3 withTag:self.tag];
        [self dismissViewControllerAnimated:YES completion:NULL];
    }else{
        
        UIAlertView* alertView=[[UIAlertView alloc]initWithTitle:@"星级或初始价格不能为0!"
                                                         message:nil
                                                        delegate:self
                                               cancelButtonTitle:@"确定"
                                               otherButtonTitles:nil];
        [alertView show];
        [alertView release];
    }
    
    
}


-(void)sliderValueChanged:(UISlider *)slider
{

    int val = slider.value;
    
    xingLabel.text = [NSString stringWithFormat:@"%d",val];

    str3 = xingLabel.text;
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

    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"酒店筛选背景.png"]];
    DoubleSlider *slider = [DoubleSlider doubleSlider];
   
	[slider addTarget:self action:@selector(valueChangedForDoubleSlider:) forControlEvents:UIControlEventValueChanged];
	slider.center = self.view.center;
    slider.tag = SLIDER_VIEW_TAG; //for testing purposes only
	[self.view addSubview:slider];
	
	leftLabel = [[UILabel alloc] initWithFrame:CGRectOffset(slider.frame, 0, -slider.frame.size.height)];
	leftLabel.textAlignment = NSTextAlignmentLeft;
	leftLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview:leftLabel];
	
	rightLabel = [[UILabel alloc] initWithFrame:CGRectOffset(slider.frame, 0, -slider.frame.size.height)];
	rightLabel.textAlignment = NSTextAlignmentRight;
	rightLabel.backgroundColor = [UIColor clearColor];
	[self.view addSubview:rightLabel];
	
    UIButton *devButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [devButton setFrame:CGRectMake(0, 0, 135, 40)];
    [devButton setCenter:CGPointMake(self.view.center.x, self.view.center.y + 120.0)];
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 135, 40)];
    imageView.image = [UIImage imageNamed:@"筛选确定按钮_正常.png"];
    [devButton addSubview:imageView];
    [imageView release];

    [devButton setImage:imageView.image forState:UIControlStateNormal];
    [devButton addTarget:self action:@selector(devButtonHandler:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:devButton];
    
    UISlider * xingSlider = [[UISlider alloc] initWithFrame:CGRectMake(40, 100, 240, 30)];
    xingSlider.minimumValue = 0;
    xingSlider.maximumValue = 5;
    xingSlider.value = 0;
    
    [xingSlider setThumbImage:[UIImage imageNamed:@"handle_highlight.png"] forState:UIControlStateHighlighted];
    [xingSlider setThumbImage:[UIImage imageNamed:@"筛选滑块.png"] forState:UIControlStateNormal];
    
    
   
    [xingSlider addTarget:self action:@selector(sliderValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:xingSlider];
    [xingSlider release];

    xingLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 70, 20, 30)];
    xingLabel.textAlignment = NSTextAlignmentRight;
    xingLabel.text = @"0";
    xingLabel.font = [UIFont fontWithName:@"Arail" size:20];
    xingLabel.backgroundColor = [UIColor clearColor];
    [self.view addSubview:xingLabel];
    UILabel * xingLa = [[UILabel alloc] initWithFrame:CGRectMake(160, 70, 40, 30)];
    xingLa.textAlignment = NSTextAlignmentLeft;
    xingLa.text = @"星级";
    xingLa.font = [UIFont fontWithName:@"Arail" size:20];
    xingLa.backgroundColor = [UIColor clearColor];
    [self.view addSubview:xingLa];
    [xingLa release];
    
    UILabel * jiaGe = [[UILabel alloc] initWithFrame:CGRectMake(120, 150, 80, 30)];
    jiaGe.textAlignment = NSTextAlignmentCenter;
    jiaGe.text = @"价格设置";
    jiaGe.font = [UIFont fontWithName:@"Arail" size:20];
    jiaGe.backgroundColor = [UIColor clearColor];
    [self.view addSubview:jiaGe];
    [jiaGe release];
    
    
    [self valueChangedForDoubleSlider:slider];

   
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    [xingLabel release];


    [super dealloc];
}
@end
