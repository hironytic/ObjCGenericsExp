//
//  Handler.h
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Handler<__contravariant ObjectType> : NSObject

- (instancetype)initWithBlock:(void(^)(ObjectType))block;
- (void)handle:(ObjectType)obj;

@end
