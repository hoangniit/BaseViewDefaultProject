//
//  DefineFlags.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "DefineFlags.h"

static DefineFlags *__shareInstance;

@implementation DefineFlags

+(DefineFlags *)shareInstance{
    if (__shareInstance == nil) {
        __shareInstance = [[DefineFlags alloc] init];
    }
    return __shareInstance;
}

@end
