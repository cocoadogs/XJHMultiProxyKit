//
//  XJHMultiProxy.m
//  XJHMultiProxyKit
//
//  Created by cocoadogs on 2020/11/23.
//

#import "XJHMultiProxy.h"

@implementation XJHMultiProxy {
    NSHashTable *_delegates;
    dispatch_semaphore_t _semaphore;
}

+ (id)alloc {
    XJHMultiProxy *instance = [super alloc];
    if (instance) {
        instance->_semaphore = dispatch_semaphore_create(1);
        instance->_delegates = [NSHashTable weakObjectsHashTable];
    }
    return instance;
}

#pragma mark - Public Methods

+ (XJHMultiProxy *)proxy {
    return [XJHMultiProxy alloc];
}

- (void)addDelegate:(id)delegate {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_delegates addObject:delegate];
    dispatch_semaphore_signal(_semaphore);
}

- (void)removeDelete:(id)delegate {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_delegates removeObject:delegate];
    dispatch_semaphore_signal(_semaphore);
}

- (void)removeAllDelegates {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [_delegates removeAllObjects];
    dispatch_semaphore_signal(_semaphore);
}

#pragma mark - Forward Methods

- (BOOL)respondsToSelector:(SEL)aSelector {
    return YES;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    NSMethodSignature *methodSignature;
    for (id delegate in _delegates) {
        if ([delegate respondsToSelector:selector]) {
            methodSignature = [delegate methodSignatureForSelector:selector];
            break;
        }
    }
    dispatch_semaphore_signal(_semaphore);
    if (methodSignature) {
        return methodSignature;
    }
    
    // To avoid crash, we must return a default methodSignature
    // because a delegate's methodSignature never equal to a block's methodSignature,
    // so we return a block's methodSignature as default (void(^)(void) -> "v@")
    return [NSMethodSignature signatureWithObjCTypes:"v@"];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    // do nothing if the methodSignature is default
    if (invocation.methodSignature == [NSMethodSignature signatureWithObjCTypes:"v@"]) {
        return;
    }

    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    NSHashTable *copyDelegates = [_delegates copy];
    dispatch_semaphore_signal(_semaphore);

    void *returnValue = NULL;
    SEL selector = invocation.selector;

    for (id delegate in copyDelegates) {
        if ([delegate respondsToSelector:selector]) {
            NSInvocation *dupInvocation = [self duplicateInvocation:invocation target:delegate];
            [dupInvocation invokeWithTarget:delegate];
            if (dupInvocation.methodSignature.methodReturnLength != 0) {
                void *value = nil;
                [dupInvocation getReturnValue:&value];
                if(value){
                    returnValue = value;
                }
            }
        }
    }
    if (returnValue) {
        [invocation setReturnValue:&returnValue];
    }
}

- (NSInvocation *)duplicateInvocation:(NSInvocation *)invocation target:(id)target {
    SEL selector = invocation.selector;
    NSMethodSignature *methodSignature = invocation.methodSignature;
    NSInvocation *dupInvocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    dupInvocation.selector = selector;
    dupInvocation.target = target;
    
    NSUInteger count = methodSignature.numberOfArguments;
    for (NSUInteger i = 2; i < count; i++) {
        // copy bytes from invocation to dupInvocation
        const char *valueType = [methodSignature getArgumentTypeAtIndex:i];
        NSUInteger valueSize = 0;
        NSGetSizeAndAlignment(valueType, &valueSize, NULL);
        unsigned char valueBytes[valueSize];
        [invocation getArgument:valueBytes atIndex:i];
        [dupInvocation setArgument:valueBytes atIndex:i];
    }
    [dupInvocation retainArguments];
    return dupInvocation;
}

@end
