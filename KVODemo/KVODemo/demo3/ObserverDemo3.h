//
//  ObserverBridge.h
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ObserverDemo3 : NSObject

@end


@interface PersonDemo3 : NSObject
{
    ObserverDemo3 *_observer;
}

@property (nonatomic, copy) NSString *familyName;
@property (nonatomic, copy) NSString *givenName;
@property (nonatomic, copy) NSString *fullName;

@end