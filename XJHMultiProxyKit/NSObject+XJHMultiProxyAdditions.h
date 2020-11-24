//
//  NSObject+XJHMultiProxyAdditions.h
//  XJHMultiProxyKit
//
//  Created by cocoadogs on 2020/11/23.
//

#import <Foundation/Foundation.h>
#import "XJHMultiProxy.h"

NS_ASSUME_NONNULL_BEGIN

#define XJHProxy(Protocol) ((id<Protocol>)self.xjh_multiProxy)

@interface NSObject (XJHMultiProxyAdditions)

@property (nonatomic, strong, readonly) XJHMultiProxy *xjh_multiProxy;

/// Add a delegate to the proxy
/// @param delegate delegate object
- (void)xjh_addDelegate:(id)delegate;

/// Remove a delegate from the proxy
/// @param delegate delegate object
- (void)xjh_removeDelegate:(id)delegate;

/// Remove all delegates from the proxy
- (void)xjh_removeAllDelegates;

@end

NS_ASSUME_NONNULL_END
