//
//  ObserverBridge.m
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import "ObserverDemo3.h"

@implementation ObserverDemo3

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    NSLog(@"%@--%@--%@", [self class], object, change);
}

@end

@implementation PersonDemo3

- (instancetype)init
{
    if (self = [super init]) {
        _familyName = @"li";
        _givenName = @"lei";
        _observer = [[ObserverDemo3 alloc] init];
        [self addObserver:_observer forKeyPath:@"fullName" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
    }
    return self;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", _givenName, _familyName];
}

//- (void)setFamilyName:(NSString *)familyName
//{
//    [self willChangeValueForKey:@"familyName"];
//    [self willChangeValueForKey:@"fullName"];
//    _familyName = familyName;
//    _fullName = self.fullName;
//    [self didChangeValueForKey:@"familyName"];
//    [self didChangeValueForKey:@"fullName"];
//}
//
//- (void)setGivenName:(NSString *)givenName
//{
//    [self willChangeValueForKey:@"givenName"];
//    [self willChangeValueForKey:@"fullName"];
//    _givenName = givenName;
//    _fullName = self.fullName;
//    [self didChangeValueForKey:@"givenName"];
//    [self didChangeValueForKey:@"fullName"];
//}

/** use kvo dependency instead of two setter method above */
+ (NSSet<NSString *> *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
    if ([key isEqualToString:@"fullName"]) {
        NSArray *affectingKeys = @[@"givenName", @"familyName"];
        keyPaths  = [keyPaths setByAddingObjectsFromArray:affectingKeys];
    }
    return keyPaths;
}

- (void)dealloc
{
    [self removeObserver:_observer forKeyPath:@"fullName"];
}














@end