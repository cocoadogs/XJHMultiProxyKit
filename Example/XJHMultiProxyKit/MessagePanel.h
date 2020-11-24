//
//  MessagePanel.h
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import <Foundation/Foundation.h>
@class MessageService;

NS_ASSUME_NONNULL_BEGIN

@interface MessagePanel : NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name service:(MessageService *)service;

@end

NS_ASSUME_NONNULL_END
