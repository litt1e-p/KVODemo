//
//  main.m
//  KVODemo
//
//  Created by xzc on 15/11/18.
//  Copyright © 2015年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "A.h"
#import "Person.h"
#import "Bridge.h"
#import "ObserverDemo3.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        /** demo1 */
        C *c = [[C alloc] init];
        A *a = [[A alloc] init];
        B *b = [[B alloc] init];
        [c addObserver:a forKeyPath:@"obj" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        [c addObserver:b forKeyPath:@"obj" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        c.obj = @"hello world";
        
        [c removeObserver:a forKeyPath:@"obj" context:NULL];
        [c removeObserver:b forKeyPath:@"obj" context:NULL];
        /** demo1 result */
        /** 2015-11-18 21:57:24.552 KVODemo[46179:18659090] B--<C: 0x7fd2f2d00e40>--{
         kind = 1;
         new = "hello world";
         old = default;
         }
         2015-11-18 21:57:24.554 KVODemo[46179:18659090] A--<C: 0x7fd2f2d00e40>--{
         kind = 1;
         new = "hello world";
         old = default;
         } */
        
        /** demo2 */
        Observer *observer = [Observer new];
        Person *person = [[Person alloc] init];
        [person addObserver:observer forKeyPath:@"name" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:NULL];
        //kvo trigger1
        person.name = @"Jack";
        /** 2015-11-18 22:07:27.323 KVODemo[46760:18682752] Observer--<Person: 0x7ff1a950a640>--{
         kind = 1;
         new = Jack;
         old = default;
         } */
        
        //kvo trigger2
        [person setValue:@"Jack" forKey:@"name"];
        /** 2015-11-18 22:07:27.323 KVODemo[46760:18682752] Observer--<Person: 0x7ff1a950a640>--{
         kind = 1;
         new = Jack;
         old = Jack;
         } */
        
        //kvo not work
        [person changeName:@"Rose"];
        /** kvo works base on setter, to trigger kvo: manual add 'willChangeValueForKey:' & 'didChangeValueForKey:' in 'changeName:'
         
         - (void)changeName:(NSString *)name
         {
         [self willChangeValueForKey:@"name"]
         _name = name;
         [self didChangeValueForKey:@"name"]
         
         }
         */
        [person removeObserver:observer forKeyPath:@"name" context:NULL];
        
        /** demo3 */
        Bridge *bridge = [[Bridge alloc] init];
        PersonBridge *person1 = [[PersonBridge alloc] initWithBridge:bridge];
        PersonBridge *person2 = [[PersonBridge alloc] initWithBridge:bridge];
        person1.bridge.conversation = @"I love you";
        person2.bridge.conversation = @"I love you too";
        
        PersonDemo3 *personDemo3 = [[PersonDemo3 alloc] init];
        personDemo3.givenName = @"meimei";
        [personDemo3 setValue:@"han" forKey:@"familyName"];
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    return 0;
}
