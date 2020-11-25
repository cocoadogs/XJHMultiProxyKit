//
//  XJHMultiProxy.h
//  XJHMultiProxyKit
//
//  Created by cocoadogs on 2020/11/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XJHMultiProxy : NSProxy

/// Create a instance when you add the multicast delegate funciton to your class
+ (XJHMultiProxy *)proxy;

@property (nonatomic, weak, readonly) id lastDelegate;

@property (nonatomic, weak, readonly) id firstDelegate;

@property (nonatomic, assign, readonly) NSUInteger count;

/// Add a delegate to the list
/// @param delegate : delegate
- (void)addDelegate:(id)delegate;

/// Remove a delegate from the list
/// @param delegate : delegate
- (void)removeDelete:(id)delegate;

/// Remove all delegates from the list
- (void)removeAllDelegates;

/// delgate at index
/// @param index index
- (id)delegateAtIndex:(NSUInteger)index;

- (XJHMultiProxy *)allExceptFirstDelegate;

- (XJHMultiProxy *)allExceptLastDelegate;

@end

NS_ASSUME_NONNULL_END
