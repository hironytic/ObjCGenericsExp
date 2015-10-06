//
//  Queue.m
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import "Queue.h"

@interface Queue ()
@property(nonatomic, strong) NSMutableArray *array;
@end

@implementation Queue

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        _array = [array mutableCopy];
    }
    return self;
}

- (id)next {
    if ([self.array count] > 0) {
        id result = [self.array firstObject];
        [self.array removeObjectAtIndex:0];
        return result;
    } else {
        return nil;
    }
}

@end
