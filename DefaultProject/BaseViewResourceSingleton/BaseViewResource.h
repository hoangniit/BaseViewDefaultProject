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

#pragma mark - default defines
#define is_IOS7_or_Later ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define is_IPhone5 (([[UIScreen mainScreen] bounds].size.height - 568) ? NO : YES)
#define is_IPhone6 (([[UIScreen mainScreen] bounds].size.height - 667) ? NO : YES)
#define is_IPhone6Plus (([[UIScreen mainScreen] bounds].size.height - 736) ? NO : YES)
#define is_IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define is_IPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iOS6_NavHeight 44.0
#define iOS7_or_Later_NavHeight 64.0
#define iOS7_or_later_StatusBarHeight 20.0
#define iOS6_ToolbarHeight 44.0
#define iOS7_or_Later_ToolbarHeight 44.0

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
