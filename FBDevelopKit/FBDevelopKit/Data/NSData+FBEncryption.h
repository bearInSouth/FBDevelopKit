//
//  NSData+FBEncryption.h
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonCryptor.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSData (FBEncryption)

- (NSString *)aes128Base64WithSecret:(NSString *)secret;

- (NSString *)aes128ECB7PaddingBase64WithSecret:(NSString *)secret;

- (NSString *)aes128Base64WithSecret:(NSString *)secret iv:(NSString *)iv option:(CCOptions)option;

@end

NS_ASSUME_NONNULL_END
