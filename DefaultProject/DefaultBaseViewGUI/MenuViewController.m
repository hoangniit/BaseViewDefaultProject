//
//  MenuViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "MenuViewController.h"

#pragma mark -
@implementation BottomUnitView

@end

#pragma mark -

@implementation BottomButtonTitles

@end

#pragma mark -

@implementation BottomButtonImages

@end

#pragma mark -

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
    _topPanel.hidden = !_isShowTopMenu;
    [self reloadFrameOfTable];
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

-(void)setBottomMenuType:(BottomMenuType)bottomMenuType{
    for (UIView *childView in [_bottomPanel subviews]) {
        if (childView != _bottomPanelBackground) {
            [childView removeFromSuperview];
        }
    }
    switch (bottomMenuType) {
        case bottomMenuType1Button:
        {
            BottomUnitView *bottomButton = [[BottomUnitView alloc] init];
            bottomButton.buttonImage = [[UIImageView alloc] init];
            bottomButton.buttonTitle = [[UILabel alloc] init];
            bottomButton.buttonMain = [UIButton buttonWithType:UIButtonTypeCustom];
            
            bottomButton.frame = CGRectMake(0, 0, _bottomPanel.frame.size.width, _bottomPanel.frame.size.height);
            [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton1:) forControlEvents:UIControlEventTouchUpInside];
            bottomButton.tag = 0;
            
            bottomButton.buttonImage.frame = CGRectMake((bottomButton.frame.size.width - 22)/2, 2, 22, 22);
            [bottomButton addSubview:bottomButton.buttonImage];
            
            bottomButton.buttonTitle.frame = CGRectMake(0, 23, bottomButton.frame.size.width, 20);
            [bottomButton.buttonTitle setFont:defaultBottomButtonFont];
            [bottomButton.buttonTitle setTextAlignment:NSTextAlignmentCenter];
            [bottomButton addSubview:bottomButton.buttonTitle];
            
            bottomButton.buttonMain.frame = CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height);
            [bottomButton setBackgroundColor:[UIColor clearColor]];
            [bottomButton addSubview:bottomButton.buttonMain];
            
            [_bottomPanel addSubview:bottomButton];
        }
            break;
        case bottomMenuType2Buttons:
        {
            for (int i = 0; i<2; i++) {
                BottomUnitView *bottomButton = [[BottomUnitView alloc] init];
                bottomButton.buttonImage = [[UIImageView alloc] init];
                bottomButton.buttonTitle = [[UILabel alloc] init];
                bottomButton.buttonMain = [UIButton buttonWithType:UIButtonTypeCustom];
                
                if (i == 0) {
                    bottomButton.frame = CGRectMake(0, 0, _bottomPanel.frame.size.width/2, _bottomPanel.frame.size.height);
                    [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton1:) forControlEvents:UIControlEventTouchUpInside];
                }else{
                    bottomButton.frame = CGRectMake(_bottomPanel.frame.size.width/2, 0, _bottomPanel.frame.size.width/2, _bottomPanel.frame.size.height);
                    [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton2:) forControlEvents:UIControlEventTouchUpInside];
                }
                
                bottomButton.buttonImage.frame = CGRectMake((bottomButton.frame.size.width - 22)/2, 2, 22, 22);
                [bottomButton addSubview:bottomButton.buttonImage];
                
                bottomButton.buttonTitle.frame = CGRectMake(0, 23, bottomButton.frame.size.width, 20);
                [bottomButton.buttonTitle setFont:defaultBottomButtonFont];
                [bottomButton.buttonTitle setTextAlignment:NSTextAlignmentCenter];
                [bottomButton addSubview:bottomButton.buttonTitle];
                
                bottomButton.buttonMain.frame = CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height);
                [bottomButton setBackgroundColor:[UIColor clearColor]];
                [bottomButton addSubview:bottomButton.buttonMain];
                
                bottomButton.tag = i;
                [_bottomPanel addSubview:bottomButton];
            }
        }
            break;
        case bottomMenuType3Buttons:
        {
            for (int i = 0; i<3; i++) {
                BottomUnitView *bottomButton = [[BottomUnitView alloc] init];
                bottomButton.buttonImage = [[UIImageView alloc] init];
                bottomButton.buttonTitle = [[UILabel alloc] init];
                bottomButton.buttonMain = [UIButton buttonWithType:UIButtonTypeCustom];
                
                if (i == 0) {
                    bottomButton.frame = CGRectMake(0, 0, _bottomPanel.frame.size.width/3, _bottomPanel.frame.size.height);
                    [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton1:) forControlEvents:UIControlEventTouchUpInside];
                }else if (i==1){
                    bottomButton.frame = CGRectMake(_bottomPanel.frame.size.width/3, 0, _bottomPanel.frame.size.width/3, _bottomPanel.frame.size.height);
                    [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton2:) forControlEvents:UIControlEventTouchUpInside];
                }else{
                    bottomButton.frame = CGRectMake((_bottomPanel.frame.size.width/3) *2, 0, _bottomPanel.frame.size.width/3, _bottomPanel.frame.size.height);
                    [bottomButton.buttonMain addTarget:self action:@selector(tapBottomButton3:) forControlEvents:UIControlEventTouchUpInside];
                }
                bottomButton.tag = i;
                bottomButton.buttonImage.frame = CGRectMake((bottomButton.frame.size.width - 22)/2, 2, 22, 22);
                [bottomButton addSubview:bottomButton.buttonImage];
                
                bottomButton.buttonTitle.frame = CGRectMake(0, 23, bottomButton.frame.size.width, 20);
                [bottomButton.buttonTitle setFont:defaultBottomButtonFont];
                [bottomButton.buttonTitle setTextAlignment:NSTextAlignmentCenter];
                [bottomButton addSubview:bottomButton.buttonTitle];
                
                bottomButton.buttonMain.frame = CGRectMake(0, 0, bottomButton.frame.size.width, bottomButton.frame.size.height);
                [bottomButton setBackgroundColor:[UIColor clearColor]];
                [bottomButton addSubview:bottomButton.buttonMain];
                
                [_bottomPanel addSubview:bottomButton];
            }
        }
            break;
            
        default:
            break;
    }
}

-(void)showMenuBottomPanel:(BOOL)isShowBottom{
    _isShowBottomMenu = isShowBottom;
    _bottomPanel.hidden = !_isShowBottomMenu;
    [self reloadFrameOfTable];
}

-(void)menuBottom_setButtonFont:(UIFont *)fontName{
    for (UIView *childControls in [_bottomPanel subviews]) {
        if ([childControls isKindOfClass:[BottomUnitView class]]) {
            [((BottomUnitView *)childControls).buttonTitle setFont:fontName];
        }
    }
}

-(void)menuBottom_setButtonFontColor:(UIColor *)fontColor{
    for (UIView *childControls in [_bottomPanel subviews]) {
        if ([childControls isKindOfClass:[BottomUnitView class]]) {
            [((BottomUnitView *)childControls).buttonTitle setTextColor:fontColor];
        }
    }
}

-(void)setBottomMenuBackgroundColor:(UIColor *)backgroundColor{[_bottomPanel setBackgroundColor:backgroundColor];}

-(void)setBottomMenuBackgroundImage:(UIImage *)image withContentMode:(UIViewContentMode)contentMode{
    [_bottomPanelBackground setImage:image];
    [_bottomPanelBackground setContentMode:contentMode];
}

//bottom button actions
-(void)tapBottomButton1:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Menu delegate nil tap bottom button 1");
    }else{
        @try {
            [_slideMenuDelegate tapBottomButton1:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Menu delegate nil tap bottom button 1");
        }
    }
}

-(void)tapBottomButton2:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Menu delegate nil tap bottom button 2");
    }else{
        @try {
            [_slideMenuDelegate tapBottomButton2:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Menu delegate nil tap bottom button 2");
        }
    }
}

-(void)tapBottomButton3:(id)sender{
    if (!_slideMenuDelegate) {
        NSLog(@"Menu delegate nil tap bottom button 3");
    }else{
        @try {
            [_slideMenuDelegate tapBottomButton3:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Menu delegate nil tap bottom button 3");
        }
    }
}

-(void)menuBottom_setBottomButtonImages:(BottomButtonImages *)bottomButtonImage{
    for (UIView *childControls in [_bottomPanel subviews]) {
        if ([childControls isKindOfClass:[BottomUnitView class]]) {
            if (childControls.tag == 0) {
                [((BottomUnitView *)childControls).buttonImage setImage:bottomButtonImage.button1Image];
            }else if (childControls.tag == 1){
                [((BottomUnitView *)childControls).buttonImage setImage:bottomButtonImage.button2Image];
            }else{
                [((BottomUnitView *)childControls).buttonImage setImage:bottomButtonImage.button3Image];
            }
        }
    }
}

-(void)menuBottom_setBottomButtonTitles:(BottomButtonTitles *)bottomButtonTitle{
    for (UIView *childControls in [_bottomPanel subviews]) {
        if ([childControls isKindOfClass:[BottomUnitView class]]) {
            if (childControls.tag == 0) {
                [((BottomUnitView *)childControls).buttonTitle setText:bottomButtonTitle.button1Title];
            }else if (childControls.tag == 1){
                [((BottomUnitView *)childControls).buttonTitle setText:bottomButtonTitle.button2Title];
            }else{
                [((BottomUnitView *)childControls).buttonTitle setText:bottomButtonTitle.button3Title];
            }
        }
    }
}

#pragma mark - menu panel
-(void)reloadFrameOfTable{
    float x = 0;
    float y = 0;
    float wid = 228;
    float hei = self.view.frame.size.height;
    //setup bottom menu
    if (_isShowBottomMenu == YES) {
        y = 44;
        hei = hei - 44;
    }
    
    //setup top menu
    if (_isShowTopMenu == YES) {
        hei = hei - 44;
    }
    
    _tbvMainMenu.frame = CGRectMake(x, y, wid, hei);
}

@end
