//
//  UIViewController+FBHUB.m
//  Mogo
//
//  Created by zhaoyang on 2019/6/13.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import "UIViewController+FBHUB.h"
#import <MBProgressHUD.h>
#import <objc/runtime.h>
#import <Lottie/LOTAnimationView.h>

#import "FBNoNetErrorView.h"

static void *propertyInfoKey = &propertyInfoKey;

@interface UIViewController()

@property (strong, nonatomic) NSMutableDictionary *propertyInfo;

/**
 加载loading
 */
@property (strong, nonatomic) MBProgressHUD *loadingHub;

/**
 中心图
 */
@property (strong, nonatomic) FBEmptyView *emptyView;

/**
 无网络时从上方弹出的红色errorView
 */
@property (strong, nonatomic) FBNoNetErrorView *noNetErrorView;

@end

@implementation UIViewController (FBHUB)

- (void)showLoading{
    //如果0.2s之内就消失了，则不显示
    self.loadingHub.graceTime = 0.2;
    
    [self.view addSubview:self.loadingHub];
    
    [self.loadingHub showAnimated:true];
}

- (void)hideLoading{
    if (self.loadingHub) {
        [self.loadingHub hideAnimated:true];
    }
}

- (void)showEmptyViewWithModel:(FBEmptyViewModel *)model callBack:(dispatch_block_t)callBack{
    [self hideEmptyView];
    
    self.emptyView = [[FBEmptyView alloc] initWithModel:model callBack:callBack];
    
    if (model.btnStr.length == 0) {
        self.emptyView.userInteractionEnabled = false;
    }
    
    [self.view addSubview:self.emptyView];
    
    [self.emptyView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.left.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(38);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(38);
        }
    }];
}

- (void)hideEmptyView{
    if (self.emptyView) {
        [self.emptyView removeFromSuperview];
    }
}

#pragma mark set/get
- (FBEmptyView *)emptyView{
    FBEmptyView *aView = (FBEmptyView *)[self.propertyInfo objectForKey:@"emptyView"];
    
    return aView;
}

- (void)setEmptyView:(FBEmptyView *)emptyView{
    [self.propertyInfo setObject:emptyView forKey:@"emptyView"];
}

- (FBNoNetErrorView *)noNetErrorView{
    FBNoNetErrorView *aView = (FBNoNetErrorView *)[self.propertyInfo objectForKey:@"noNetErrorView"];
    
    return aView;
}

- (void)setNoNetErrorView:(FBNoNetErrorView *)noNetErrorView{
    [self.propertyInfo setObject:noNetErrorView forKey:@"noNetErrorView"];
}

- (MBProgressHUD *)loadingHub{
    MBProgressHUD *hud = (MBProgressHUD *)[self.propertyInfo objectForKey:@"loadingHub"];
    
    if (!hud) {
        hud = [[self class] getLoadingHud];
        [self.propertyInfo setObject:hud forKey:@"loadingHub"];
    }
    
    return hud;
}

- (NSMutableDictionary *)propertyInfo{
    NSMutableDictionary *info = (NSMutableDictionary *)objc_getAssociatedObject(self, &propertyInfoKey);
    
    if (!info) {
        info = [NSMutableDictionary dictionary];
        
        objc_setAssociatedObject(self, &propertyInfoKey, info, OBJC_ASSOCIATION_RETAIN);
    }
    
    return info;
}

+ (MBProgressHUD *)getLoadingHud{
    MBProgressHUD *hud = [[MBProgressHUD alloc] init];
    hud.mode = MBProgressHUDModeCustomView;
    hud.removeFromSuperViewOnHide = true;
    
    hud.bezelView.style = MBProgressHUDBackgroundStyleSolidColor;
    hud.bezelView.backgroundColor = [UIColor whiteColor];
    
    hud.backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    
    hud.minSize = CGSizeMake(150, 150);
    LOTAnimationView *animationView = [LOTAnimationView animationNamed:@"cafe"];
    animationView.frame = CGRectMake(0, 0, 150, 150);
    animationView.contentMode = UIViewContentModeScaleAspectFit;
    animationView.loopAnimation = YES;
    [animationView play];
    hud.customView = animationView;
    
    hud.layer.zPosition = 2;
    
    return hud;
}

- (void)showNoNetErrorWithCallBack:(dispatch_block_t)callBack{
    
    self.noNetErrorView = [[FBNoNetErrorView alloc] initWithClickBlock:callBack];
    
    [self.view addSubview:self.noNetErrorView];
    
    [self.noNetErrorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-50+38);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(-50+38);
        }
        make.height.mas_equalTo(50);
    }];
    
    [self.view layoutIfNeeded];
    
    [self.noNetErrorView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-12+38);
        } else {
            make.top.equalTo(self.mas_topLayoutGuideBottom).offset(-12+38);
        }
        make.height.mas_equalTo(50);
    }];
    
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)hideNoNetError{
    if (self.noNetErrorView) {
        
        [self.noNetErrorView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            if (@available(iOS 11.0, *)) {
                make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(-50+38);
            } else {
                make.top.equalTo(self.mas_topLayoutGuideBottom).offset(-50+38);
            }
            make.height.mas_equalTo(50);
        }];
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished) {
            [self.noNetErrorView removeFromSuperview];
        }];
    }
}

@end
