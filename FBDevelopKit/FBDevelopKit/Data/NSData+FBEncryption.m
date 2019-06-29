//
//  NSData+FBEncryption.m
//  FBDevelopKit
//
//  Created by zhaoyang on 2019/6/26.
//  Copyright © 2019 zhaoyang. All rights reserved.
//

#import "NSData+FBEncryption.h"

@implementation NSData (FBEncryption)

- (NSString *)aes128Base64WithSecret:(NSString *)secret
{
    return [self aes128Base64WithSecret:secret iv:@"1234567890123456" option:kCCOptionPKCS7Padding];
}

- (NSString *)aes128ECB7PaddingBase64WithSecret:(NSString *)secret
{
    return [self aes128Base64WithSecret:secret iv:@"" option:kCCOptionPKCS7Padding | kCCOptionECBMode];
}

- (NSString *)aes128Base64WithSecret:(NSString *)secret iv:(NSString *)iv option:(CCOptions)option
{
    if (!secret) {
        return nil;
    }
    NSData * date = nil;
    if (iv) {
        date = [iv dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    
    char keyPtr[kCCKeySizeAES128 + 1];
    memset(keyPtr, 0, sizeof(keyPtr));
    [secret getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    
    NSUInteger dataLength = [self length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    
    size_t numBytesCrypted = 0;
    
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt,
                                          
                                          kCCAlgorithmAES128,
                                          
                                          option,
                                          
                                          keyPtr,
                                          
                                          kCCBlockSizeAES128,
                                          
                                          [date bytes],
                                          
                                          [self bytes],
                                          
                                          dataLength,
                                          
                                          buffer,
                                          
                                          bufferSize,
                                          
                                          &numBytesCrypted);
    
    if (cryptStatus == kCCSuccess) {
        
        NSData *resultData = [NSData dataWithBytesNoCopy:buffer length:numBytesCrypted];
        return [resultData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
        
    }
    
    free(buffer);
    
    return nil;
}


@end
