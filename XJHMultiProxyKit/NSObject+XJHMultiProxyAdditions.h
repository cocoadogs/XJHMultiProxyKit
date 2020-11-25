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

#define XJHProxyExceptFirst(Protocol) ((id<Protocol>)self.xjh_multiExceptFirstDelegateProxy)

#define XJHProxyExceptLast(Protocol) ((id<Protocol>)self.xjh_multiExceptLastDelegateProxy)

@interface NSObject (XJHMultiProxyAdditions)

/// the proxy that contains every delegate
@property (nonatomic, strong, readonly) XJHMultiProxy *xjh_multiProxy;

/// the proxy that containes every delegate except the first delegate
@property (nonatomic, strong, readonly) XJHMultiProxy *xjh_multiExceptFirstDelegateProxy;

/// the proxy that containes every delegate except the last delegate
@property (nonatomic, strong, readonly) XJHMultiProxy *xjh_multiExceptLastDelegateProxy;

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
