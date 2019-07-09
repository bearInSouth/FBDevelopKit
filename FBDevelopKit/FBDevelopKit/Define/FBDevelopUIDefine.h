//
//  FBDevelopUIDefine.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#ifndef FBDevelopUIDefine_h
#define FBDevelopUIDefine_h

static inline BOOL isFullScreen(){
    if (@available(iOS 11.0, *)) {
        return UIApplication.sharedApplication.windows.firstObject.safeAreaInsets.bottom > 0.0;
    } else {
        // Fallback on earlier versions
        return false;
    }
}

#import <Masonry/Masonry.h>

/** main screen width scale with iphone6 width **/
#define FBScale(value) value * [UIScreen mainScreen].bounds.size.width / 375.0

#define UIMainScreenWidth [[UIScreen mainScreen] bounds].size.width
#define UIMainScreenHeight [[UIScreen mainScreen] bounds].size.height

//iPhoneX / iPhoneXS
#define isIphoneX_XS (UIMainScreenWidth == 375.f && UIMainScreenHeight == 812.f ? YES : NO)
//iPhoneXR / iPhoneXSMax
#define isIphoneXR_XSMax (UIMainScreenWidth == 414.f && UIMainScreenHeight == 896.f ? YES : NO)
//全面屏
#define isFullScreen isFullScreen()

#define isiPhone                UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone

#define LargeTitlesHeight       38.f
#define staBarHeight            (isFullScreen ? 44 : 20)
#define navBarHeight            (isiPhone && isFullScreen ? 88 : 64)
#define navBarLargeHeight       (navBarHeight + LargeTitlesHeight)
#define tabBarBottomChinHeight  (isFullScreen ? 34 : 0)
#define tabBarHeight            (isFullScreen ? (64.f+34.f) : 64.f)

//一个像素
#define SCREEN_ONEPX 1.0 / [UIScreen mainScreen].scale


#endif /* FBDevelopUIDefine_h */
