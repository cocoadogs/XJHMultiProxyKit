//
//  Demo1.m
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import "Demo1.h"

@implementation Demo1

- (NSNumber *)getId
{
    NSLog(@"Demo1 return 2");
    return @2;
}

- (int)getInt
{
    NSLog(@"Demo1 return 2");
    return 2;
}

- (void)getNoReturn
{
    NSLog(@"Demo1 get no return ");
}

@end
