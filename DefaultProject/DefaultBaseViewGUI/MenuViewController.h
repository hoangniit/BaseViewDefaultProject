//
//  MenuViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MenuDelegate <NSObject>

-(void)tapTopImage:(id)sender;
-(void)tapTopTitle:(id)sender;
-(void)tapTopDescription:(id)sender;
-(void)topMenuWillSearch;

@end

@interface MenuViewController : UIViewController <UITextFieldDelegate>

@property (strong,nonatomic) id <MenuDelegate> slideMenuDelegate;

#define menuWid 228.0
#define panelHei 44.0

#pragma mark - top panel
typedef enum{
    topMenuTypeDefault = 0,
    topMenuTypeImage = 1,
    topMenuTypeImageTitle = 2,
    topMenuTypeImageTitleDesciption = 3,
    topMenuTypeSearch = 4,
}TopMenuType;

@property (strong,nonatomic) IBOutlet UIView *topPanel;
@property (strong,nonatomic) IBOutlet UIImageView *topPanelBackground;
@property (nonatomic) TopMenuType topType;
@property (nonatomic) BOOL isShowTopMenu;

@property (strong,nonatomic) UIImageView *topMenuImage;
@property (strong,nonatomic) UIButton *topMenuImageButton;
@property (strong,nonatomic) UIButton *topMenuTitle;
@property (strong,nonatomic) UIButton *topMenuDescription;
@property (strong,nonatomic) UITextField *topSearchField;
@property (strong,nonatomic) UIButton *topButtonSearch;

-(void)showMenuTopPanel:(BOOL)isShowTop;
-(void)setTopMenuBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode)contentMode;
-(void)setTopMenuBackgroundColor:(UIColor *)color;
-(void)setTopMenuType:(TopMenuType)topType;

-(void)menuTop_setImage:(UIImage *)image;

-(void)menuTop_setTitle:(NSString *)title;
-(void)menuTop_SetTitleFont:(UIFont *)titleFont;
-(void)menuTop_SetTitleFontColor:(UIColor *)titleFontColor;

-(void)menuTop_setDescription:(NSString *)desciption;
-(void)menuTop_setDescriptionFont:(UIFont *)desciptionFont;
-(void)menuTop_setDescriptionFontColor:(UIColor *)desciptionFontColor;

-(void)menuTop_setSearchFieldPlaceHolder:(NSString *)placeHolderText;
-(void)menuTop_setSearchFieldFont:(UIFont *)searchFieldFont;
-(void)menuTop_setSearchFieldFontColor:(UIColor *)searchFieldFontColor;

-(void)menuTop_setSearchButtonImage:(UIImage *)searchImage;

-(void)tapTopImage:(id)sender;
-(void)tapTopTitle:(id)sender;
-(void)tapTopDescription:(id)sender;
-(void)topMenuWillSearch;

#pragma mark - bottom panel
typedef enum{
    bottomMenuTypeDefault = 0,
}BottomMenuType;

@property (nonatomic) BOOL showBottomPanelText;

@end
