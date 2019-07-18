//
//  UIColor+FBColor.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "UIColor+FBColor.h"

@implementation UIColor (FBColor)


+ (instancetype)colorWithHexString:(NSString *)hexString{
    //删除字符串中的空格，并转换成大写
    NSString *colorString = [[hexString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];;
    
    //非法字符串，返回clearColor
    if (colorString.length < 6) {
        return [UIColor clearColor];
    }
    
    //以"0X"开头（从下标为2开始截取）
    if ([colorString hasPrefix:@"0X"]) {
        colorString = [colorString substringFromIndex:2];
    }
    
    //以"#"开头（从下标为1开始截取）
    if ([colorString hasPrefix:@"#"]) {
        colorString = [colorString substringFromIndex:1];
    }
    
    //截取完如果字符串长度不为6，返回clearColor
    if (colorString.length != 6) {
        return [UIColor clearColor];
    }
    
    //依次取出r/g/b字符串
    NSRange range;
    range.location = 0;
    range.length = 2;
    //r
    NSString *rString = [colorString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [colorString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [colorString substringWithRange:range];
    
    //转换为数值
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    //返回对应的颜色
    return [UIColor colorWithRed:(float)r / 255.0 green:(float)g / 255.0 blue:(float)b / 255.0 alpha:1.0];
}

+ (instancetype)colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha{
    return [[self colorWithHexString:hexString] colorWithAlphaComponent:alpha];
}

+ (UIColor *)MogoBlue{
    return [self colorWithHexString:@"#1682FB"];
}

+ (UIColor *)MogoMainBlue{
    return [self colorWithHexString:@"#456EFF"];
}

+ (UIColor *)MogoYellow{
    return [self colorWithHexString:@"#FBD341"];
}

+ (UIColor *)MogoComBlack{
    return [self colorWithHexString:@"#001E32"];
}

+ (UIColor *)MogoRed{
    return [self colorWithHexString:@"#FF5249"];
}

+ (UIColor *)MogoDarkRed{
    return [self colorWithHexString:@"#F44321"];
}

+ (UIColor *)MogoBgGray{
    return [self colorWithHexString:@"#F5F5F5"];
}

+ (UIColor *)MogoLightGray{
    return [self colorWithHexString:@"#EBF0F5"];
}

+ (UIColor *)MogoMidGray{
    return [self colorWithHexString:@"#C8D2E6"];
}

+ (UIColor *)MogoComGray{
    return [self colorWithHexString:@"#8791AA"];
}

+ (UIColor *)MogoGreen{
    return [self colorWithHexString:@"#0FC9E7"];
}

+ (UIColor *)MogoBlack{
    return [self colorWithHexString:@"#07003B"];
}

+ (UIColor *)MogoCommonShadow{
    return [self colorWithHexString:@"#8E8E93"];
}



@end
