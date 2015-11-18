//
//  Person.m
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "Person.h"

@implementation Person

- (instancetype)init
{
    if (self = [super init]) {
        self.name = @"default";
    }
    return self;
}

- (void)changeName:(NSString *)name
{
//    [self willChangeValueForKey:@"name"];
    _name = name;
//    [self didChangeValueForKey:@"name"];
}

@end


@implementation Observer

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@--%@--%@", [self class], object, change);
}

@end
