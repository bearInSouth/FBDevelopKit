//
//  FBSMSEmptyView.m
//  Mogo
//
//  Created by zhaoyang on 2019/6/3.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import "FBEmptyView.h"

#import <Masonry.h>


@interface FBEmptyView ()

@property (strong, nonatomic) UIImageView *iconImageView;

@property (strong, nonatomic) UILabel *desLabel;

@property (strong, nonatomic) UIButton *callBackBtn;

@property (copy, nonatomic) dispatch_block_t callBack;

@end

@implementation FBEmptyView

- (instancetype)initWithModel:(FBEmptyViewModel *)model callBack:(dispatch_block_t)callBack{
    if ([super init]) {
        self.callBack = callBack;
        
        self.callBackBtn = ({
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [btn setTitle:model.btnStr forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.titleLabel.font = mediumFont(14);
            
            [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#456EFF"]] forState:UIControlStateNormal];
            [btn setBackgroundImage:[UIImage createImageWithColor:[UIColor colorWithHexString:@"#456EFF" alpha:0.7]] forState:UIControlStateHighlighted];
            
            if (model.btnImageStr.length > 0) {
                [btn setImage:[UIImage imageNamed:model.btnImageStr] forState:UIControlStateNormal];
                [btn setImage:[UIImage imageNamed:model.btnImageStr] forState:UIControlStateHighlighted];
            }
            
            btn.layer.cornerRadius = 24;
            btn.layer.masksToBounds = true;
            
            [btn addTarget:self action:@selector(callBackBtnClick) forControlEvents:UIControlEventTouchUpInside];
            
            btn;
        });
        
        [self addSubview:self.callBackBtn];
        
        [self.callBackBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.left.mas_equalTo(48);
            make.bottom.mas_equalTo(-100 - tabBarBottomChinHeight);
            make.height.mas_equalTo(48);
        }];
        
        
        self.desLabel = ({
            UILabel *aLabel = [[UILabel alloc] init];
            aLabel.font = regularFont(14);
            aLabel.textColor = [UIColor colorWithHexString:@"#5E6D82"];
            aLabel.numberOfLines = 0;
            aLabel.textAlignment = NSTextAlignmentCenter;
            
            aLabel.text = model.desStr;
            
            aLabel;
        });
        
        [self addSubview:self.desLabel];
        
        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.centerY.mas_equalTo(13.5);
        }];
        
        self.iconImageView = ({
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:model.imageStr]];
            imageView.contentMode = UIViewContentModeCenter;
            
            imageView;
        });
        
        [self addSubview:self.iconImageView];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.mas_equalTo(0);
            make.bottom.equalTo(self.desLabel.mas_top).offset(-24);
            make.width.mas_equalTo(300);
            make.height.mas_equalTo(170);
        }];
        
        if (model.btnStr.length == 0) {
            self.callBackBtn.hidden = true;
        }
    }
    
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    [self.callBackBtn layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:10];
}

- (void)callBackBtnClick{
    if (self.callBack) {
        self.callBack();
    }
}


@end




@implementation FBEmptyViewModel

- (instancetype)init{
    if ([super init]) {
        self.imageStr = @"fb_network_disconnection";
        self.desStr = @"你的设备没有连接到网络，\n请连接网络后再尝试~";
        self.btnStr = @"再试一次";
    }
    
    return self;
}

@end
