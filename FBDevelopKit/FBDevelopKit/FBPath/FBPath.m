//
//  FBPath.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "FBPath.h"

@implementation FBPath

+ (NSString *)documentPath {
    static NSString *documentPath;
    if (!documentPath) {
        documentPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
    }
    return documentPath;
}

+ (NSString *)libraryPath{
    static NSString *libraryPath;
    if (!libraryPath) {
        libraryPath = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).lastObject;
    }
    return libraryPath;
}

+ (NSString *)libraryCachesPath{
    static NSString *libraryCachesPath;
    if (!libraryCachesPath) {
        libraryCachesPath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject;
    }
    return libraryCachesPath;
}

+ (NSString *)tempPath {
    return NSTemporaryDirectory();
}

@end
