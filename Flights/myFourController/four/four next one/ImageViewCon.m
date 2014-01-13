//
//  ImageViewCon.m
//  jiudian
//
//  Created by XmL on 12-12-8.
//  Copyright (c) 2012年 XmL. All rights reserved.
//

#import "ImageViewCon.h"

@implementation ImageViewCon

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
-(UIImage *)getImage
{
    UIImage * imgDrawImage;
    UIGraphicsBeginImageContext(self.frame.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:context];
    imgDrawImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    
    return imgDrawImage;
    
    
    
    
}


@end
