//
//  BaseViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DefineFlags.h"

@interface BaseViewController : UIViewController

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

-(void)tapNavBackButton;
-(void)tapNavMenuButton;
-(void)tapNavButton1;
-(void)tapNavButton2;
-(void)tapNavButton3;
-(void)tapNavButton4;
-(void)tapNavButton5;

@end
