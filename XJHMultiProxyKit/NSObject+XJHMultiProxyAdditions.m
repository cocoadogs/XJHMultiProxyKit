//
//  NSObject+XJHMultiProxyAdditions.m
//  XJHMultiProxyKit
//
//  Created by cocoadogs on 2020/11/23.
//

#import "NSObject+XJHMultiProxyAdditions.h"
#import <objc/runtime.h>

@implementation NSObject (XJHMultiProxyAdditions)

#pragma mark - Public Methods

- (void)xjh_addDelegate:(id)delegate {
    [self.xjh_multiProxy addDelegate:delegate];
}

- (void)xjh_removeDelegate:(id)delegate {
    [self.xjh_multiProxy removeDelete:delegate];
}

- (void)xjh_removeAllDelegates {
    [self.xjh_multiProxy removeAllDelegates];
}

#pragma mark - Property Methods

- (XJHMultiProxy *)xjh_multiProxy {
    @synchronized (self) {
        XJHMultiProxy *proxy = objc_getAssociatedObject(self, @selector(xjh_multiProxy));
        if (!proxy) {
            proxy = XJHMultiProxy.proxy;
            objc_setAssociatedObject(self, @selector(xjh_multiProxy), proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return proxy;
    }
}

- (XJHMultiProxy *)xjh_multiExceptFirstDelegateProxy {
    @synchronized (self) {
        XJHMultiProxy *proxy = objc_getAssociatedObject(self, @selector(xjh_multiExceptFirstDelegateProxy));
        if (!proxy) {
            proxy = self.xjh_multiProxy.allExceptFirstDelegate;
            objc_setAssociatedObject(self, @selector(xjh_multiExceptFirstDelegateProxy), proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return proxy;
    }
}

- (XJHMultiProxy *)xjh_multiExceptLastDelegateProxy {
    @synchronized (self) {
        XJHMultiProxy *proxy = objc_getAssociatedObject(self, @selector(xjh_multiExceptLastDelegateProxy));
        if (!proxy) {
            proxy = self.xjh_multiProxy.allExceptLastDelegate;
            objc_setAssociatedObject(self, @selector(xjh_multiExceptLastDelegateProxy), proxy, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        }
        return proxy;
    }
}

@end
