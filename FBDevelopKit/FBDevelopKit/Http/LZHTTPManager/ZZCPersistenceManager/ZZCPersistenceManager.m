//
//  ZZCPersistenceManager.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "ZZCPersistenceManager.h"

#define defaultPersistenceDocument @"Documents/Persistence"

@implementation ZZCPersistenceManager

+ (id)syncGetPersistenceDataWithFileName:(NSString *)fileName{
    @try{
        NSString *cacheFile = [[NSHomeDirectory() stringByAppendingPathComponent:defaultPersistenceDocument] stringByAppendingPathComponent:fileName];
        
        NSData *dataInfo = [NSData dataWithContentsOfFile:cacheFile];
        
        if (dataInfo) {
            return [NSKeyedUnarchiver unarchiveObjectWithData:dataInfo];
        }else{
            return nil;
        }
    }@catch(NSException* exception){
        NSLog(@"----------->  %@信息读取失败",fileName);
    }
}

+ (void)getPersistenceDataWithFileName:(NSString *)fileName complete:(void(^)(id data))complete{
    [self getPersistenceDataWithFileName:fileName document:defaultPersistenceDocument complete:complete];
}

+ (void)savePersistenceData:(id)data WithFileName:(NSString*)fileName complete:(void(^)(BOOL complete))complete{
    [self savePersistenceData:data WithFileName:fileName document:defaultPersistenceDocument complete:complete];
}

+ (void)removePersistenceDataWithFile:(NSString *)fileName{
    [self removePersistenceDataWithFile:fileName document:defaultPersistenceDocument];
}

+ (void)removeAllPersistenceData{
    [self removeAllPersistenceDataWithDocument:defaultPersistenceDocument];
}




+ (void)getPersistenceDataWithFileName:(NSString *)fileName document:(NSString *)document complete:(void(^)(id data))complete{
    dispatch_async(getIOQueue(), ^{
        @try{
            NSString *cacheFile = [[NSHomeDirectory() stringByAppendingPathComponent:document] stringByAppendingPathComponent:fileName];
            
            NSData *dataInfo = [NSData dataWithContentsOfFile:cacheFile];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (dataInfo) {
                    if (complete) {
                        complete([NSKeyedUnarchiver unarchiveObjectWithData:dataInfo]);
                    }
                }else{
                    if (complete) {
                        complete(nil);
                    }
                }
            });
            
        }@catch(NSException* exception){
            NSLog(@"----------->  %@信息读取失败",fileName);
        }
    });
}

+ (void)savePersistenceData:(id)data WithFileName:(NSString*)fileName document:(NSString *)document complete:(void(^)(BOOL complete))complete{
    
    dispatch_async(getIOQueue(), ^{
        @try{
            if (!data) {
                return;
            }
            
            NSData *dataInfo = [NSKeyedArchiver archivedDataWithRootObject:data];
            
            NSString *cacheDocument = [NSHomeDirectory() stringByAppendingPathComponent:document];
            
            if (![[NSFileManager defaultManager] fileExistsAtPath:cacheDocument]) {
                [[NSFileManager defaultManager] createDirectoryAtPath:cacheDocument withIntermediateDirectories:true attributes:nil error:nil];
            }
            
            NSString *cacheFile = [cacheDocument stringByAppendingPathComponent:fileName];
            
            if ([[NSFileManager defaultManager] fileExistsAtPath:cacheFile]) {
                [dataInfo writeToFile:cacheFile atomically:true];
            }else{
                [[NSFileManager defaultManager] createFileAtPath:cacheFile contents:dataInfo attributes:nil];
            }
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(true);
                }
            });
            
        }@catch(NSException* exception){
            NSLog(@"----------->  %@信息写入失败",fileName);
            
            dispatch_async(dispatch_get_main_queue(), ^{
                if (complete) {
                    complete(false);
                }
            });
        }
    });
    
}

+ (void)removePersistenceDataWithFile:(NSString *)fileName document:(NSString *)document{
    dispatch_async(getIOQueue(), ^{
        NSString *cacheFile = [[NSHomeDirectory() stringByAppendingPathComponent:document] stringByAppendingPathComponent:fileName];
        
        [[NSFileManager defaultManager] removeItemAtPath:cacheFile error:nil];
    });
}

+ (void)removeAllPersistenceDataWithDocument:(NSString *)document{
    dispatch_async(getIOQueue(), ^{
        NSString *cachePath = [NSHomeDirectory() stringByAppendingPathComponent:document];
        
        [[NSFileManager defaultManager] removeItemAtPath:cachePath error:nil];
    });
}


@end
