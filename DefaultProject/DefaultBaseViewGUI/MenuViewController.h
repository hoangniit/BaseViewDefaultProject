//
//  MenuViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MenuViewController : UIViewController

#pragma mark - top panel
typedef enum{
    topMenuTypeDefault = 0,
    topMenuTypeImage = 1,
    topMenuTypeAccount = 2,
    topMenuTypeSearch = 3,
    topMenuTypeLogoWithText = 4,
    topMenuTypeLogoWith2Textline = 5,
}TopMenuType;

//@property (strong,nonatomic) UIImageView *topImage;
//@property (strong,nonatomic) UITextField *searchText;
//@property (strong,nonatomic) UILabel *lblTextLine1;
//@property (strong,nonatomic) UILabel *lblTextLine2;

#pragma mark - bottom panel
typedef enum{
    bottomMenuTypeDefault = 0,
    bottomMenu1Button = 1,
    bottomMenu2Button = 2,
    bottomMenu3Button = 3,
}BottomMenuType;

@property (nonatomic) BOOL showBottomPanelText;

@end
