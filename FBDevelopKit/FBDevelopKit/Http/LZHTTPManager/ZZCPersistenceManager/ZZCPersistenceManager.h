//
//  ZZCPersistenceManager.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

static inline dispatch_queue_t getIOQueue(){
    static dispatch_queue_t io_queue;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        io_queue = dispatch_queue_create("com.mogo.com.LZHTTPSession.io", DISPATCH_QUEUE_CONCURRENT);
    });
    
    return io_queue;
}

/**
 默认文件夹为 Documents/Persistence，可以自定义文件夹位置
 
 需要存储的data必须是可以被archive的
 */
@interface ZZCPersistenceManager : NSObject

/**
 适配之前的同步获取data的数据
 */
+ (id)syncGetPersistenceDataWithFileName:(NSString *)fileName;

+ (void)getPersistenceDataWithFileName:(NSString *)fileName complete:(void(^)(id data))complete;

+ (void)savePersistenceData:(id)data WithFileName:(NSString*)fileName complete:(void(^)(BOOL complete))complete;

+ (void)removePersistenceDataWithFile:(NSString *)fileName;

+ (void)removeAllPersistenceData;




+ (void)getPersistenceDataWithFileName:(NSString *)fileName document:(NSString *)document complete:(void(^)(id data))complete;

+ (void)savePersistenceData:(id)data WithFileName:(NSString*)fileName document:(NSString *)document complete:(void(^)(BOOL complete))complete;

+ (void)removePersistenceDataWithFile:(NSString *)fileName document:(NSString *)document;

+ (void)removeAllPersistenceDataWithDocument:(NSString *)document;



@end

NS_ASSUME_NONNULL_END
