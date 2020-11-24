//
//  DemoSource.h
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol DemoSourceDelegate <NSObject>

@optional

- (NSNumber *)getId;
- (int)getInt;
- (void)getNoReturn;

@end

@interface DemoSource : NSObject

@property (weak, nonatomic) id <DemoSourceDelegate> delegate;

- (void)getId;
- (void)getInt;
- (void)getNoReturn;


@end

NS_ASSUME_NONNULL_END
