//
//  A.m
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "A.h"

@implementation A

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@--%@--%@", [self class], object, change);
}

@end



@implementation B

@end



@implementation C

- (instancetype)init
{
    if (self = [super init]) {
        self.obj = @"default";
    }
    return self;
}
@end