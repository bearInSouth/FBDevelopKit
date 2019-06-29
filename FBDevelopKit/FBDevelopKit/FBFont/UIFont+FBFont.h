//
//  UIFont+IFFont.h
//  Mogo
//
//  Created by zhaoyang on 2019/5/30.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

static inline UIFont *regularFont(CGFloat size)
{
    UIFont *font = nil;
    if (@available(iOS 8.2, *)) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightRegular];
    } else {
        // Fallback on earlier versions
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

static inline UIFont *mediumFont(CGFloat size)
{
    UIFont *font = nil;
    if (@available(iOS 8.2, *)) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightMedium];
    } else {
        // Fallback on earlier versions
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

static inline UIFont *boldFont(CGFloat size)
{
    return [UIFont boldSystemFontOfSize:size];
}

static inline UIFont *lightFont(CGFloat size)
{
    UIFont *font = nil;
    if (@available(iOS 8.2, *)) {
        font = [UIFont systemFontOfSize:size weight:UIFontWeightLight];
    } else {
        // Fallback on earlier versions
        font = [UIFont systemFontOfSize:size];
    }
    return font;
}

@interface UIFont (ZZCFont)

@end

NS_ASSUME_NONNULL_END
