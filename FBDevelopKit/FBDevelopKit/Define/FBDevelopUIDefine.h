//
//  FBDevelopUIDefine.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#ifndef FBDevelopUIDefine_h
#define FBDevelopUIDefine_h

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
#define isFullScreen (isIphoneX_XS || isIphoneXR_XSMax)


#endif /* FBDevelopUIDefine_h */
