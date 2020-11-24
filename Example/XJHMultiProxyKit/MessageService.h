//
//  MessageService.h
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol MessageReceiveDelegate <NSObject>

@optional

- (void)receiveMessage:(NSString *)message;

// type test
- (void)receiveMessageTypeTest:(NSString *)message
                           obj:(NSObject *)obj
                        intger:(NSInteger)age
                          size:(CGSize)size
                         point:(CGPoint)point
                         array:(NSArray *)array
                           sel:(SEL)sel
                         block:(void(^)(void))block
                         cChar:(char)cChar
                        cArray:(int [])cArray
                        cPoint:(void *)cPoint
                         aByte:(Byte)aByte;

@end

@interface MessageService : NSObject

- (void)stopReceive;
- (void)receiveNewMessage;

@end

NS_ASSUME_NONNULL_END
