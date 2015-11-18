//
//  Bridge.m
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "Bridge.h"

@implementation Bridge

- (instancetype)init
{
    if (self = [super init]) {
        _conversation = @"default";
        _observers = [NSMutableArray array];
    }
    return self;
}

- (void)addObserver:(NSObject *)obj
{
    [_observers addObject:obj];
    [self addObserver:obj forKeyPath:@"conversation" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
}

- (void)dealloc
{
    for (NSObject *obj in _observers) {
        [self removeObserver:obj forKeyPath:@"conversation"];
    }
}

@end


@implementation PersonBridge

- (instancetype)initWithBridge:(Bridge *)bridge
{
    if (self = [super init]) {
        _bridge = bridge;
        [_bridge addObserver:self];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@--%@--%@", [self class], object, change);
}

@end