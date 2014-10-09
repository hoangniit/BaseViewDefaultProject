//
//  BaseViewResource.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseViewResource : NSObject

+(BaseViewResource *)resource;

#pragma mark - navigation resource
@property (strong,nonatomic) NSString *navMenuImage;
@property (strong,nonatomic) NSString *navBackImage;
@property (strong,nonatomic) NSString *navButton1Img;
@property (strong,nonatomic) NSString *navButton2Img;
@property (strong,nonatomic) NSString *navButton3Img;
@property (strong,nonatomic) NSString *navButton4Img;
@property (strong,nonatomic) NSString *navButton5Img;

-(void)setNavigationMenuImageName:(NSString *)imageName;
-(void)setNavigationBackImageName:(NSString *)imageName;
-(void)setNavigationButton1ImageName:(NSString *)imageName;
-(void)setNavigationButton2ImageName:(NSString *)imageName;
-(void)setNavigationButton3ImageName:(NSString *)imageName;
-(void)setNavigationButton4ImageName:(NSString *)imageName;
-(void)setNavigationButton5ImageName:(NSString *)imageName;

@end
