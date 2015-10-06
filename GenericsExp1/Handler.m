//
//  Handler.m
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import "Handler.h"

@interface Handler ()
@property(nonatomic, copy) void (^block)(id);
@end

@implementation Handler

- (instancetype)initWithBlock:(void(^)(id))block {
    self = [super init];
    if (self) {
        _block = [block copy];
    }
    return self;
}

- (void)handle:(id)obj {
    _block(obj);
}

@end
