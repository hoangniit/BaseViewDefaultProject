//
//  BaseViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController

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

#pragma mark - setup_inactive_view
@property (strong,nonatomic) UIView *viewActive;

-(void)activeView;
-(void)unactiveView;
-(void)activeViewWithAnimation;
-(void)unactiveViewWithAnimation;

#pragma mark - setup_process_view
@property (strong,nonatomic) UIView *viewProcess;
@property (strong,nonatomic) UIActivityIndicatorView *processIndicatorView;
@property (strong,nonatomic) UILabel *processTitle;

-(void)showProcess_WithTitle:(NSString *)title;
-(void)hideProcess;

#pragma mark - setup_navigation_bar
@property (strong,nonatomic) UIView *topPanelBar;
@property (strong,nonatomic) UIButton *btNavBack;
@property (strong,nonatomic) UIButton *btNavMenu;
@property (strong,nonatomic) UIButton *btNavRight1;
@property (strong,nonatomic) UILabel *lblNavRightNote1;
@property (strong,nonatomic) UIButton *btNavRight2;
@property (strong,nonatomic) UILabel *lblNavRightNote2;
@property (strong,nonatomic) UIButton *btNavRight3;
@property (strong,nonatomic) UILabel *lblNavRightNote3;
@property (strong,nonatomic) UIButton *btNavRight4;
@property (strong,nonatomic) UILabel *lblNavRightNote4;
@property (strong,nonatomic) UIButton *btNavRight5;
@property (strong,nonatomic) UILabel *lblNavRightNote5;
@property (strong,nonatomic) UIImageView *imgNavTitle;
@property (strong,nonatomic) UILabel *lblNavTitle;

typedef enum{
    left_None = 0,
    left_WithMenu = 1,
    left_WithBack = 2,
    left_WithBackMenu= 3,
    left_WithMenuBack = 4,
}NavigationLeftButton;

typedef enum{
    right_None = 0,
    right_With1Button = 1,
    right_With2Buttons = 2,
    right_With3Buttons = 3,
    right_With4Buttons = 4,
    right_With5Buttons = 5,
}NavigationRightButton;

-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitleImage:(NSString *)imageName;
-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitle:(NSString *)title;
-(void)hideTopNavigationWithAnimation:(BOOL)ani;

#pragma mark - others functions - can be override - can be delete
-(void)tapNavBackButton;
-(void)tapNavMenuButton;
-(void)tapNavButton1;
-(void)UpdateButton1NotificationLabel:(NSString *)note;
-(void)tapNavButton2;
-(void)UpdateButton2NotificationLabel:(NSString *)note;
-(void)tapNavButton3;
-(void)UpdateButton3NotificationLabel:(NSString *)note;
-(void)tapNavButton4;
-(void)UpdateButton4NotificationLabel:(NSString *)note;
-(void)tapNavButton5;
-(void)UpdateButton5NotificationLabel:(NSString *)note;

@end