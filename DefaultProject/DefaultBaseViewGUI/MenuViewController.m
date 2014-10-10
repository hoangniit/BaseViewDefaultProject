//
//  MenuViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "MenuViewController.h"

@interface MenuViewController ()

@end

@implementation MenuViewController

#pragma mark - view setup

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _topSearchField) {
        [self.view endEditing:YES];
        [self topMenuWillSearch];
    }
    return YES;
}

#pragma mark - top panel

-(void)showMenuTopPanel:(BOOL)isShowTop{
    _isShowTopMenu = isShowTop;
}

-(void)setTopMenuBackgroundColor:(UIColor *)color{
    [_topPanel setBackgroundColor:color];
}

-(void)setTopMenuBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode)contentMode{
    [_topPanelBackground setContentMode:contentMode];
    [_topPanelBackground setImage:image];
}

-(void)setTopMenuType:(TopMenuType)topType{
    for (UIView *childView in [_topPanel subviews]) {
        if (childView != _topPanelBackground) {
            [childView removeFromSuperview];
        }
    }
    
    switch (topType) {
        case topMenuTypeImage:
        {
            _topMenuImage = [[UIImageView alloc] init];
            _topMenuImage.frame = CGRectMake(2, 2, menuWid - 4, 40);
            _topMenuImage.layer.borderWidth = 1.0;
            _topMenuImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
            _topMenuImage.layer.cornerRadius = 2.0;
            
            _topMenuImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuImageButton.frame = CGRectMake(2, 2, menuWid - 4, 40);
            _topMenuImageButton.backgroundColor = [UIColor clearColor];
            [_topMenuImageButton addTarget:self action:@selector(tapTopImage:) forControlEvents:UIControlEventTouchUpInside];
            
            [_topPanel addSubview:_topMenuImage];
            [_topPanel addSubview:_topMenuImageButton];
            [_topPanel bringSubviewToFront:_topMenuImageButton];
        }
            break;
        case topMenuTypeImageTitle:
        {
            _topMenuImage = [[UIImageView alloc] init];
            _topMenuImage.frame = CGRectMake(2, 2, 40, 40);
            _topMenuImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
            _topMenuImage.layer.cornerRadius = 2.0;
            
            _topMenuImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuImageButton.frame = CGRectMake(2, 2, 40, 40);
            _topMenuImageButton.backgroundColor = [UIColor clearColor];
            [_topMenuImageButton addTarget:self action:@selector(tapTopImage:) forControlEvents:UIControlEventTouchUpInside];
            
            _topMenuTitle = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuTitle.frame = CGRectMake(44, 2, menuWid - 4 - 2 - 40, 40);
            _topMenuTitle.backgroundColor = [UIColor clearColor];
            _topMenuTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [_topMenuTitle addTarget:self action:@selector(tapTopTitle:) forControlEvents:UIControlEventTouchUpInside];
            
            [_topPanel addSubview:_topMenuImage];
            [_topPanel addSubview:_topMenuImageButton];
            [_topPanel bringSubviewToFront:_topMenuImageButton];
            [_topPanel addSubview:_topMenuTitle];
            [_topPanel bringSubviewToFront:_topMenuTitle];
        }
            break;
        case topMenuTypeImageTitleDesciption:
        {
            _topMenuImage = [[UIImageView alloc] init];
            _topMenuImage.frame = CGRectMake(2, 2, 40, 40);
            _topMenuImage.layer.borderColor = [UIColor darkGrayColor].CGColor;
            _topMenuImage.layer.cornerRadius = 2.0;
            
            _topMenuImageButton = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuImageButton.frame = CGRectMake(2, 2, 40, 40);
            _topMenuImageButton.backgroundColor = [UIColor clearColor];
            [_topMenuImageButton addTarget:self action:@selector(tapTopImage:) forControlEvents:UIControlEventTouchUpInside];
            
            _topMenuTitle = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuTitle.frame = CGRectMake(44, 2, menuWid - 4 - 2 - 40, 20);
            _topMenuTitle.backgroundColor = [UIColor clearColor];
            _topMenuTitle.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [_topMenuTitle addTarget:self action:@selector(tapTopTitle:) forControlEvents:UIControlEventTouchUpInside];
            
            _topMenuDescription = [UIButton buttonWithType:UIButtonTypeCustom];
            _topMenuDescription.frame = CGRectMake(44, 22, menuWid - 4 - 2 - 40, 20);
            _topMenuDescription.backgroundColor = [UIColor clearColor];
            _topMenuDescription.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [_topMenuDescription addTarget:self action:@selector(tapTopDescription:) forControlEvents:UIControlEventTouchUpInside];
            
            [_topPanel addSubview:_topMenuImage];
            [_topPanel addSubview:_topMenuImageButton];
            [_topPanel bringSubviewToFront:_topMenuImageButton];
            [_topPanel addSubview:_topMenuTitle];
            [_topPanel bringSubviewToFront:_topMenuTitle];
            [_topPanel addSubview:_topMenuDescription];
            [_topPanel bringSubviewToFront:_topMenuDescription];
        }
            break;
        case topMenuTypeSearch:
        {
            _topSearchField = [[UITextField alloc] init];
            _topSearchField.frame = CGRectMake(2, 7, menuWid - 2 - 4 - 30, 30);
            _topSearchField.layer.borderWidth = 1.0;
            _topSearchField.layer.borderColor = [UIColor darkGrayColor].CGColor;
            _topSearchField.backgroundColor = [UIColor whiteColor];
            _topSearchField.layer.cornerRadius = 6.0;
            _topSearchField.delegate = self;
            [_topSearchField setPlaceholder:@" Enter text search "];
            
            _topButtonSearch = [UIButton buttonWithType:UIButtonTypeCustom];
            _topButtonSearch.frame = CGRectMake(_topSearchField.frame.size.width + 4, 7, 30, 30);
            _topButtonSearch.layer.borderColor = [UIColor darkGrayColor].CGColor;
            _topButtonSearch.layer.borderWidth = 1.0;
            _topButtonSearch.backgroundColor = [UIColor clearColor];
            _topButtonSearch.layer.cornerRadius = 3.0;
            [_topButtonSearch addTarget:self action:@selector(topMenuWillSearch) forControlEvents:UIControlEventTouchUpInside];
            
            [_topPanel addSubview:_topSearchField];
            [_topPanel addSubview:_topButtonSearch];
        }
            break;
            
        default:
            break;
    }
}

-(void)menuTop_setImage:(UIImage *)image{ [_topMenuImage setImage:image]; }

-(void)menuTop_setTitle:(NSString *)title{ [_topMenuTitle setTitle:title forState:UIControlStateNormal]; }

-(void)menuTop_SetTitleFont:(UIFont *)titleFont{ [_topMenuTitle.titleLabel setFont:titleFont]; }

-(void)menuTop_SetTitleFontColor:(UIColor *)titleFontColor{ [_topMenuTitle setTitleColor:titleFontColor forState:UIControlStateNormal]; }

-(void)menuTop_setDescription:(NSString *)desciption{ [_topMenuDescription setTitle:desciption forState:UIControlStateNormal]; }

-(void)menuTop_setDescriptionFont:(UIFont *)desciptionFont{ [_topMenuDescription.titleLabel setFont:desciptionFont]; }

-(void)menuTop_setDescriptionFontColor:(UIColor *)desciptionFontColor { [_topMenuDescription setTitleColor:desciptionFontColor forState:UIControlStateNormal]; }

-(void)menuTop_setSearchFieldPlaceHolder:(NSString *)placeHolderText { [_topSearchField setPlaceholder:placeHolderText]; }

-(void)menuTop_setSearchFieldFont:(UIFont *)searchFieldFont { [_topSearchField setFont:searchFieldFont]; }

-(void)menuTop_setSearchFieldFontColor:(UIColor *)searchFieldFontColor { [_topSearchField setTextColor:searchFieldFontColor]; }

-(void)menuTop_setSearchButtonImage:(UIImage *)searchImage{ [_topButtonSearch setImage:searchImage forState:UIControlStateNormal]; }

-(void)tapTopImage:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Slide menu not delegate tap top image");
    }else{
        @try {
            [_slideMenuDelegate tapTopImage:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Slide menu not delegate tap top image");
        }
    }
}

-(void)tapTopTitle:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Slide menu not delegate tap top title");
    }else{
        @try {
            [_slideMenuDelegate tapTopTitle:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Slide menu not delegate tap top title");
        }
    }
}

-(void)tapTopDescription:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Slide menu not delegate tap description");
    }else{
        @try {
            [_slideMenuDelegate tapTopDescription:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Slide menu not delegate tap description");
        }
    }
}

-(void)topMenuWillSearch{
    if (!_slideMenuDelegate) {
        NSLog(@"Not delegate. Slide menu will search: %@",_topSearchField.text);
    }else{
        @try {
            [_slideMenuDelegate topMenuWillSearch];
        }
        @catch (NSException *exception) {
            NSLog(@"Not delegate. Slide menu will search: %@",_topSearchField.text);
        }
    }
}

#pragma mark - bottom panel

@end
