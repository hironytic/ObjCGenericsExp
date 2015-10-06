//
//  Animal.h
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Animal : NSObject

@property(nonatomic, copy) NSString *name;

- (instancetype)initWithName:(NSString *)name;
- (void)stay;

@end


@interface Dog : Animal

- (void)bite;

@end


@interface Cat : Animal

- (void)scratch;

@end
