//
//  BaseViewResource.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "BaseViewResource.h"

static BaseViewResource *__resource;

@implementation BaseViewResource

+(BaseViewResource *)resource{
    if (__resource == nil) {
        __resource = [[BaseViewResource alloc] init];
    }
    return __resource;
}

-(void)setNavigationMenuImageName:(NSString *)imageName{
    _navMenuImage = imageName;
}

-(void)setNavigationBackImageName:(NSString *)imageName{
    _navBackImage = imageName;
}

-(void)setNavigationButton1ImageName:(NSString *)imageName{
    _navButton1Img = imageName;
}

-(void)setNavigationButton2ImageName:(NSString *)imageName{
    _navButton2Img = imageName;
}

-(void)setNavigationButton3ImageName:(NSString *)imageName{
    _navButton3Img = imageName;
}

-(void)setNavigationButton4ImageName:(NSString *)imageName{
    _navButton4Img = imageName;
}

-(void)setNavigationButton5ImageName:(NSString *)imageName{
    _navButton5Img = imageName;
}

@end
