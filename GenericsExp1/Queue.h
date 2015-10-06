//
//  Queue.h
//  GenericsExp1
//
//  Created by Hironori Ichimiya on 2015/10/06.
//  Copyright © 2015年 Hironytic. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Animal.h"

@interface Queue<__covariant ObjectType> : NSObject

- (instancetype)initWithArray:(NSArray<ObjectType> *)array;

- (ObjectType)next;

@end
