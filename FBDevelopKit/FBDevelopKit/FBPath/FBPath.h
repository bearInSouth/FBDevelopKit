//
//  FBPath.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FBPath : NSObject

/**
 用于存储不可再生用户数据。
 可通过配置实现iTunes共享文件。
 可被iTunes备份。
 
 Documents/Inbox：该目录用来保存由外部应用请求当前应用程序打开的文件。
 可被iTunes备份。
 eg：应用A向系统注册了几种可打开的文件格式。
 B应用有一个A支持的格式的文件F，并且申请调用A打开F。
 沙盒机制是不允许A访问B沙盒中的文件。
 因此苹果的解决方案是讲F拷贝一份到A应用的Documents/Inbox目录下，再让A打开F。
 
 @return document路径
 */
+  (NSString *)documentPath;

/**
 苹果建议用来存放默认设置或其它状态信息。
 可创建子文件夹。
 除Caches子目录外都会被被iTunes同步。
 
 Library/Preferences：应用程序的偏好设置文件。不应该直接创建偏好设置文件，而是应该使用NSUserDefaults类来取得和设置应用程序的偏好.
 Library/Caches：用于保存可再生的文件,比如网络请求的数据。应用程序通常还需要负责删除这些文件。
 
 @return library路径
 */
+  (NSString *)libraryPath;


/**
 用于保存可再生的文件,比如网络请求的数据。应用程序通常还需要负责删除这些文件。
 
 @return libraryCaches路径
 */
+ (NSString *)libraryCachesPath;

/**
 这个目录用于存放临时文件，保存应用程序再次启动过程中不需要的信息。
 该目录下的文件随时有可能被系统清理掉。eg：系统磁盘存储空间不足的时候。
 该路径下的文件不会被iTunes备份。
 
 @return temp路径
 */
+  (NSString *)tempPath;

@end



static inline NSString* FBDocumentPath(){
    return [FBPath documentPath];
}

static inline NSString* FBLibraryPath(){
    return [FBPath libraryPath];
}

static inline NSString* FBLibraryCachesPath(){
    return [FBPath libraryCachesPath];
}

static inline NSString* FBTempPath(){
    return [FBPath tempPath];
}


static inline NSString* FBDocumentSubPath(NSString *path){
    return [[FBPath documentPath] stringByAppendingPathComponent:path];
}

static inline NSString* FBLibrarySubPath(NSString *path){
    return [[FBPath libraryPath] stringByAppendingPathComponent:path];
}

static inline NSString* FBLibraryCachesSubPath(NSString *path){
    return [[FBPath libraryCachesPath] stringByAppendingPathComponent:path];
}

static inline NSString* FBTempSubPath(NSString *path){
    return [[FBPath tempPath] stringByAppendingPathComponent:path];
}


NS_ASSUME_NONNULL_END
