//
//  DemoSource.m
//  XJHMultiProxyKit_Example
//
//  Created by cocoadogs on 2020/11/23.
//  Copyright © 2020 cocoadogs. All rights reserved.
//

#import "DemoSource.h"
#import <XJHMultiProxyKit/NSObject+XJHMultiProxyAdditions.h>

@implementation DemoSource

- (void)getId
{
//    if(self.delegate && [self.delegate respondsToSelector:@selector(getId)])
//    {
//        NSNumber *d = [self.delegate getId];
//        NSLog(@"---getId---Real number is %@",d);
//    }
    NSNumber *d = [XJHProxy(DemoSourceDelegate) getId];
    NSLog(@"---getId---Real number is %@",d);
}

- (void)getInt
{
//    if(self.delegate && [self.delegate respondsToSelector:@selector(getInt)])
//    {
//        int d = [self.delegate getInt];
//        NSLog(@"---getInt---Real number is %d",d);
//    }
    int d = [XJHProxy(DemoSourceDelegate) getInt];
    NSLog(@"---getInt---Real number is %d",d);
}
- (void)getNoReturn
{
//    if(self.delegate && [self.delegate respondsToSelector:@selector(getNoReturn)])
//    {
//        [self.delegate getNoReturn];
//    }
    [XJHProxy(DemoSourceDelegate) getNoReturn];
}

@end
