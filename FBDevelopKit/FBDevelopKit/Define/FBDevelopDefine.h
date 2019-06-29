//
//  FBDevelopDefine.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#ifndef FBDevelopDefine_h
#define FBDevelopDefine_h

#import <UIKit/UIKit.h>

/** weak/strong **/
#define __ZZC_WEAK_SELF_YLSLIDE     __weak typeof(self) weakSelf = self;
#define __ZZC_STRONG_SELF_YLSLIDE   __strong typeof(weakSelf) strongSelf = weakSelf;

static inline UIImage *load_zzcdevkit_bundleImage(NSString *name)
{
    if (!name) {
        return nil;
    }
    return [UIImage imageNamed:[NSString stringWithFormat:@"ZZCDevelopkit.bundle/%@", name]];
}

static inline void ZZCOpenAppSetting()
{
    NSURL *url = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [[UIApplication sharedApplication] openURL:url];
}


#endif /* FBDevelopDefine_h */
