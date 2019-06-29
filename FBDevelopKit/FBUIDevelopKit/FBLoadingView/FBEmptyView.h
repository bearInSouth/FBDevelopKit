//
//  FBSMSEmptyView.h
//  Mogo
//
//  Created by zhaoyang on 2019/6/3.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FBEmptyViewModel;

NS_ASSUME_NONNULL_BEGIN

@interface FBEmptyView : UIView

- (instancetype)initWithModel:(FBEmptyViewModel *)model callBack:(dispatch_block_t)callBack;

@end



/**
 model默认是没有网络的状态
 */
@interface FBEmptyViewModel : NSObject

@property (strong, nonatomic) NSString *imageStr;

@property (strong, nonatomic) NSString *desStr;

@property (strong, nonatomic) NSString *btnStr;

@property (strong, nonatomic) NSString *btnImageStr;

@end


NS_ASSUME_NONNULL_END
