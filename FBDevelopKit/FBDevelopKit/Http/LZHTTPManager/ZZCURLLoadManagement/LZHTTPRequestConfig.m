//
//  LZHTTPRequestConfig.m
//  LZURLManagementTest
//
//  Created by zzc-13 on 2019/1/29.
//  Copyright © 2019年 lzy. All rights reserved.
//

#import "LZHTTPRequestConfig.h"

@interface LZHTTPRequestConfig ()<NSCopying>

@end

@implementation LZHTTPRequestConfig

- (id)copyWithZone:(NSZone *)zone{
    LZHTTPRequestConfig *config = [[LZHTTPRequestConfig allocWithZone:zone] init];
    
    config.method = self.method;
    config.url_id = self.url_id;
    config.para = self.para;
    config.cachePolicy = self.cachePolicy;
    config.timeout = self.timeout;
    config.httpModel = self.httpModel;
    config.uniqueSignKey = self.uniqueSignKey;
    config.successCode = self.successCode;
    
    return config;
}

- (instancetype)init{
    if ([super init]) {
        self.successCode = 200;
    }
    
    return self;
}

@end
