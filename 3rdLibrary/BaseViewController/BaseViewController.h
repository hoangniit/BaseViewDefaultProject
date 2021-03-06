//
//  BaseViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ContactViewController.h"
#import "ToolbarImageViewController.h"
#import "ToolbarButtonViewController.h"
#import "BaseViewResource.h"
#import "MenuViewController.h"

@interface BaseViewController : UIViewController <ContactViewDelegate,ToolbarImageDelegate,ButtonToolbarDelegate,MenuDelegate>

#define baseResource ([BaseViewResource resource])

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
@property (strong,nonatomic) UIImageView *topMainBackgroundImg;
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

-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitleImage:(NSString *)imageName contentMode:(UIViewContentMode) contentMode;
-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitle:(NSString *)title titleFont:(UIFont *)titleFont titleFontColor:(UIColor *)titleFontColor;
-(void)hideTopNavigationWithAnimation:(BOOL)ani;

-(void)setTopNavigationBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode) contentMode;
-(void)setTopNavigationBackgroundColor:(UIColor *)color;

#pragma mark - setup toolbar
@property (strong,nonatomic) UIView *bottomToolbar;
@property (strong,nonatomic) UIImageView *toolbarImgBackground;
@property (strong,nonatomic) ContactViewController *bottomContactView;
@property (strong,nonatomic) ToolbarImageViewController *bottomImageView;
@property (strong,nonatomic) ToolbarButtonViewController *bottomButtonView;
@property (nonatomic) int toolbarNumberOfbutton;
@property (nonatomic) float toolbarButtonWidth;

typedef enum{
    Toolbar_type_none = 0,
    Toolbar_type_contact = 1,
    Toolbar_type_button = 2,
    Toolbar_type_image = 3,
}ToolbarType;
#pragma mark toolbar
-(void)setToolbarBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode) contentMode;
-(void)setToolbarBackgroundColor:(UIColor *)color;
-(void)showBottomToolbarWithAnimation:(BOOL)ani withToolbarType:(ToolbarType) toolType;
-(void)hideToolbarWithAnimation:(BOOL)ani;

#pragma mark contact toolbar
-(void)setToolbarContactsPhone:(NSString *)phoneNumber andEmail:(NSString *)emailString;

#pragma mark image toolbar
-(void)setToolbarImage:(UIImage *)image withContentMode:(UIViewContentMode) contentMode;

#pragma mark button toolbar
-(void)setToolbarNumberOfButtons:(int)numberOfButtons withButtonWidth:(float)buttonWid isScrollable:(BOOL)isScrollable showTitle:(BOOL)isShowTitle titleColor:(UIColor *)color withButtonImageArray:(NSArray *)imageArr andButtonTitleArray:(NSArray *)titleArray;

#pragma mark slide menu
@property (strong,nonatomic) MenuViewController *slideMenu;
@property (nonatomic) BOOL isShowSlideMenu;

-(void)enableShowSlideMenu:(BOOL)enable;
-(void)showSlideMenuWithAnimation:(BOOL)ani;
-(void)hideSlideMenuWithAnimation:(BOOL)ani;
-(void)createSlideMenuGesture;
-(void)createBackgroundSlideMenu;

#pragma mark - others functions - can be override
#pragma mark navigation bar
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
