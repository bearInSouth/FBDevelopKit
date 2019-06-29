//
//  UIImage+FBColor.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "UIImage+FBColor.h"

@implementation UIImage (FBColor)

+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color
{
    return  [self createImageWithColor:color size:CGSizeMake(1.0, 1.0)];
}

+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color size:(CGSize)size
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theImage;
}

+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale = [UIScreen mainScreen].scale;
    if (cornerRadius < 0) {
        cornerRadius = 0;
    } else if (cornerRadius > MIN(width, height)) {
        cornerRadius = MIN(width, height)/2.;
    }
    
    UIImage *image = [self createImageWithColor:color size:size];
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, scale);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius];
    [path addClip];
    [image drawInRect:rect];
    UIImage * theimage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return theimage;
}

@end
