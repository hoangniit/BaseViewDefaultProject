//
//  MenuViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewResource.h"

#pragma mark -

@protocol MenuDelegate <NSObject>

-(void)tapTopImage:(id)sender;
-(void)tapTopTitle:(id)sender;
-(void)tapTopDescription:(id)sender;
-(void)topMenuWillSearch;

-(void)tapBottomButton1:(id)sender;
-(void)tapBottomButton2:(id)sender;
-(void)tapBottomButton3:(id)sender;

-(NSInteger)slideMenuNumberOfSectionsInMenu;
-(NSInteger)slideMenuNumberOfItemsInMenuSection:(NSInteger)section;
-(UITableViewCell *)slideMenuItemAtIndexPath:(NSIndexPath *)indexPath;
-(void)slideMenuDidSelectItemAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)slideMenuHeightForRowAtIndexPath:(NSIndexPath *)indexPath;
-(CGFloat)slideMenuHeightForHeaderInSection:(NSInteger)section;
-(UIView *)slideMenuViewForHeaderInSection:(NSInteger)section;

@end

#pragma mark -

@interface BottomUnitView : UIView

#define defaultBottomButtonFont ([UIFont fontWithName:@"Helvetica" size:13.0])

@property (strong,nonatomic) IBOutlet UILabel *buttonTitle;
@property (strong,nonatomic) IBOutlet UIImageView *buttonImage;
@property (strong,nonatomic) IBOutlet UIButton *buttonMain;

@end

#pragma mark -

@interface BottomButtonTitles : NSObject

@property (strong,nonatomic) NSString *button1Title;
@property (strong,nonatomic) NSString *button2Title;
@property (strong,nonatomic) NSString *button3Title;

@end

#pragma mark -

@interface BottomButtonImages : NSObject

@property (strong,nonatomic) UIImage *button1Image;
@property (strong,nonatomic) UIImage *button2Image;
@property (strong,nonatomic) UIImage *button3Image;

@end

#pragma mark -

@interface MenuViewController : UIViewController <UITextFieldDelegate,UITableViewDataSource,UITableViewDelegate>

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
@property (strong,nonatomic) IBOutlet UIImageView *topPanelLine;
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
    bottomMenuType1Button = 1,
    bottomMenuType2Buttons = 2,
    bottomMenuType3Buttons = 3,
}BottomMenuType;

@property (strong,nonatomic) IBOutlet UIView *bottomPanel;
@property (strong,nonatomic) IBOutlet UIImageView *bottomPanelBackground;
@property (strong,nonatomic) IBOutlet UIImageView *bottomPanelLine;

@property (nonatomic) BOOL showBottomPanelText;
@property (nonatomic) BottomMenuType bottomMenuType;
@property (nonatomic) BOOL isShowBottomMenu;
@property (strong,nonatomic) BottomButtonTitles *bottomButtonTitles;
@property (strong,nonatomic) BottomButtonImages *bottomButtonImages;

-(void)showMenuBottomPanel:(BOOL)isShowBottom;
-(void)setBottomMenuBackgroundColor:(UIColor *)backgroundColor;
-(void)setBottomMenuBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode)contentMode;
-(void)setBottomMenuType:(BottomMenuType)bottomMenuType;

-(void)menuBottom_setButtonFont:(UIFont *)fontName;
-(void)menuBottom_setButtonFontColor:(UIColor *)fontColor;

-(void)menuBottom_setBottomButtonImages:(BottomButtonImages *)bottomButtonImage;
-(void)menuBottom_setBottomButtonTitles:(BottomButtonTitles *)bottomButtonTitle;

#pragma mark - menu panel
@property (strong,nonatomic) IBOutlet UITableView *tableMenuItem;
@property (nonatomic) BOOL isShowMenuItemSection;

typedef enum{
    slideMenuTypeDefault = 0,
    slideMenuTypeTitle = 1,
    slideMenuTypeTitleDescription = 2,
    slideMenuTypeTitleWithButton = 3,
    slideMenuTypeTitleDescriptionWithButton = 4,
    slideMenuTypeImageTitle = 5,
    slideMenuTypeImageTitleDescription = 6,
    slideMenuTypeImageTitleWithButton = 7,
    slideMenuTypeImageTitleDescriptionWithButton = 8,
}SlideMenuCellType;

@property (nonatomic) SlideMenuCellType slideMenuCellType;

-(void)setMainMenuShowItemSection:(BOOL)isShow;
-(void)setMainMenuBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode)contentMode;
-(void)setMainMenuBackgroundColor:(UIColor *)color;
-(void)reloadMenuData;

@end
