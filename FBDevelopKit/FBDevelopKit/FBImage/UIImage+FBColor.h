//
//  UIImage+FBColor.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (FBColor)

+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color;
+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color size:(CGSize)size;
+ (nullable UIImage *)createImageWithColor:(nullable UIColor *)color size:(CGSize)size cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
