//
//  UIViewController+FBHUB.h
//  Mogo
//
//  Created by zhaoyang on 2019/6/13.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FBEmptyView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewController (FBHUB)

- (void)showLoading;

- (void)hideLoading;



- (void)showEmptyViewWithModel:(FBEmptyViewModel *)model callBack:(dispatch_block_t)callBack;

- (void)hideEmptyView;



- (void)showNoNetErrorWithCallBack:(dispatch_block_t)callBack;

- (void)hideNoNetError;

@end

NS_ASSUME_NONNULL_END
