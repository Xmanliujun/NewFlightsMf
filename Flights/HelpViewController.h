//
//  HelpViewController.h
//  Flights
//
//  Created by mac on 13-1-21.
//  Copyright (c) 2013年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HelpViewController : UIViewController
<UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    UIPageControl *pageControl;
    NSMutableArray *picArray;
    BOOL pageControlUsed;
}
@end
