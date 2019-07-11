//
//  LZHTTPSession.h
//  LZURLManagementTest
//
//  Created by zzc-13 on 2019/1/28.
//  Copyright © 2019年 lzy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "LZHTTPSessionSignal.h"

NS_ASSUME_NONNULL_BEGIN

@interface LZHTTPSession : NSObject

+ (LZHTTPSession *)shareInstance;

/**
 外部设置环境
 
 @param dev true：dev    false：正式环境
 */
+ (void)setEnviStateIfDev:(BOOL)dev;

/**
 设置自定义域名
 */
+ (void)setCustomHost:(NSString *)host;

/**
 对某个base_id设置自定义域名
 */
+ (void)setCustomHost:(NSString *)host baseId:(NSString *)base_id;

/**
 注册header公参
 
 @param parameter 参数
 */
- (void)registerHeaderParameter:(NSDictionary<NSString *,NSString *> *)parameter;

/**
 注册body公参
 
 @param parameter 参数
 */
- (void)registerBodyParameter:(NSDictionary<NSString *,NSString *> *)parameter;

/**
 清除所有的缓存
 */
- (void)cleanAllHTTPModelData;

/**
 清除所有的内存缓存
 */
- (void)cleanAllOlCacheData;

/**
 缓存地址
 */
@property (strong, nonatomic, readonly) NSString *cacheDirec;


/**
 外部HOOK当前的参数，进行加密操作；操作完成之后进行赋值
 */
@property (copy, nonatomic) void(^HookParamsEncryptBlock)(NSDictionary *params,void(^entryComplete)(NSDictionary<NSString *,NSString *> *headerParams,NSDictionary<NSString *,NSString *> *bodyParams));

@end

@interface LZHTTPSession (signal)

/**
 根据url_id创建signal，url_id需要提前配置
 
 适用于APP内分模块管理url
 */
+ (LZHTTPSessionSignal *)creatSignalWithUrlId:(NSString *)url_id maker:(void(^)(LZHTTPRequestMaker *make))makeBlock;

+ (LZHTTPSessionSignal *)getSignalWithUrlId:(NSString *)url_id;

/**
 根据url创建signal，测试域名为m_app.zuzuche.net
 */
+ (LZHTTPSessionSignal *)creatSignalWithUrl:(NSString *)url maker:(void(^)(LZHTTPRequestMaker *make))makeBlock;

/**
 单例获取（同一个url或者url_idm，返回相同的signal对象）
 */
+ (LZHTTPSessionSignal *)signalWithUrlId:(NSString *)url_id maker:(void(^)(LZHTTPRequestMaker *make))makeBlock;

+ (LZHTTPSessionSignal *)signalWithUrl:(NSString *)url maker:(void(^)(LZHTTPRequestMaker *make))makeBlock;

- (void)request:(LZHTTPSessionSignal *)signal;

- (void)refresh:(LZHTTPSessionSignal *)signal;

- (void)readCache:(LZHTTPSessionSignal *)signal;

- (void)requestBindedSignal:(NSArray<LZHTTPSessionSignal *> *)signals;

@end

static inline void setUrlId(NSString *module_id,NSString *url_id,NSString *formal_url,NSString *dev_url);

static inline NSString *urlAppendPath(NSString *path){
    return [NSString stringWithFormat:@"%@%@",@"http://newapi.ifreegroup.net:8000/",path];
}

NS_ASSUME_NONNULL_END
