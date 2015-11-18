//
//  Bridge.h
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Bridge : NSObject

@property (nonatomic, copy) NSString *conversation;
@property (nonatomic, strong) NSMutableArray *observers;
- (void)addObserver:(NSObject *)obj;

@end


@interface PersonBridge : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, strong) Bridge *bridge;

- (instancetype)initWithBridge:(Bridge *)bridge;

@end