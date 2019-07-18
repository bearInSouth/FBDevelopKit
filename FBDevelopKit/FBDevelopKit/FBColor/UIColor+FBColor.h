//
//  UIColor+FBColor.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (FBColor)

/** 根据16进制字符串返回对应颜色 */
+ (instancetype)colorWithHexString:(NSString *)hexString;


/** 根据16进制字符串返回对应颜色 带透明参数 */
+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha;

+ (UIColor *)MogoBlue;

+ (UIColor *)MogoMainBlue;

+ (UIColor *)MogoYellow;

+ (UIColor *)MogoComBlack;

+ (UIColor *)MogoRed;

+ (UIColor *)MogoDarkRed;

+ (UIColor *)MogoBgGray;

+ (UIColor *)MogoLightGray;

+ (UIColor *)MogoMidGray;

+ (UIColor *)MogoComGray;

+ (UIColor *)MogoGreen;

+ (UIColor *)MogoBlack;

+ (UIColor *)MogoCommonShadow;


@end

NS_ASSUME_NONNULL_END
