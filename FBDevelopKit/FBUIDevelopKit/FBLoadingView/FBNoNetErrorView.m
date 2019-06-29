//
//  FBNoNetErrorView.m
//  Mogo
//
//  Created by zhaoyang on 2019/6/10.
//  Copyright © 2019 iFREEGROUP. All rights reserved.
//

#import "FBNoNetErrorView.h"
#import <Masonry.h>


@interface FBNoNetErrorView ()

@property (strong, nonatomic) UIImageView *iconImageView;

@property (strong, nonatomic) UILabel *tipLabel;

@property (strong, nonatomic) UIImageView *arrowImageView;

@property (strong, nonatomic) UIControl *bgControl;

@property (copy, nonatomic) dispatch_block_t clickBlock;

@end

@implementation FBNoNetErrorView

- (instancetype)initWithClickBlock:(dispatch_block_t)clickBlock{
    if ([super init]) {
        self.backgroundColor = [UIColor colorWithHexString:@"#F44321"];
        self.clickBlock = clickBlock;
        
        self.iconImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fb_noNet"]];
        
        [self addSubview:self.iconImageView];
        
        [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(16);
            make.bottom.mas_equalTo(-5);
            make.width.height.mas_equalTo(24);
        }];
        
        self.arrowImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fb_noNet_arrow"]];
        self.arrowImageView.hidden = true;
        
        [self addSubview:self.arrowImageView];
        
        [self.arrowImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(-16);
            make.bottom.mas_equalTo(-8);
            make.width.height.mas_equalTo(24);
        }];
        
        self.tipLabel = ({
            UILabel *aLabel = [[UILabel alloc] init];
            aLabel.font = regularFont(12);
            aLabel.textColor = [UIColor colorWithHexString:@"#FFFFFF"];
            aLabel.textAlignment = NSTextAlignmentLeft;
            aLabel.lineBreakMode = NSLineBreakByTruncatingTail;
            
            aLabel.text = @"设备未连接到网络，请检查连接...";
            
            aLabel;
        });
        
        [self addSubview:self.tipLabel];
        
        [self.tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.iconImageView.mas_right).offset(8);
            make.right.equalTo(self.arrowImageView.mas_left).offset(-8);
            make.bottom.mas_equalTo(-8);
            make.height.mas_equalTo(18);
        }];
        
        self.bgControl = ({
            UIControl *control = [[UIControl alloc] init];
            [control addTarget:self action:@selector(bgControlClick) forControlEvents:UIControlEventTouchUpInside];
            
            control;
        });
        
        [self addSubview:self.bgControl];
        
        [self.bgControl mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.mas_equalTo(0);
        }];
    }
    
    return self;
}

- (void)layoutSubviews{
    UIBezierPath *defaultNumberViewMaskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight) cornerRadii:CGSizeMake(10, 10)];
    CAShapeLayer *defaultNumberViewMaskLayer = [[CAShapeLayer alloc] init];
    defaultNumberViewMaskLayer.frame = self.bounds;
    defaultNumberViewMaskLayer.path = defaultNumberViewMaskPath.CGPath;
    self.layer.mask = defaultNumberViewMaskLayer;
    self.layer.masksToBounds = YES;
}

- (void)bgControlClick{
    if (self.clickBlock) {
        self.clickBlock();
    }
}


@end
