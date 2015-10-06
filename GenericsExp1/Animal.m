//
//  Animal.m
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import "Animal.h"

@implementation Animal

- (instancetype)initWithName:(NSString *)name {
    self = [super init];
    if (self) {
        _name = [name copy];
    }
    return self;
}

- (void)stay {
    NSLog(@"%@ は、じっとしている。", self.name);
}

@end

@implementation Dog

- (void)bite {
    NSLog(@"%@ は、噛み付いた。", self.name);
}

@end

@implementation Cat

- (void)scratch {
    NSLog(@"%@ は、引っ掻いた。", self.name);
}

@end
