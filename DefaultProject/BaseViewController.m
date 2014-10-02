//
//  BaseViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

#pragma mark - setup_active_view
-(void)createActiveView{
    if (_viewActive == nil) {
        _viewActive = [[UIView alloc] init];
    }
    [self.view addSubview:_viewActive];
    _viewActive.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    _viewActive.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight ;
    _viewActive.backgroundColor = [UIColor darkGrayColor];
    _viewActive.alpha = 0.0;
    [_viewActive setUserInteractionEnabled:NO];
}

-(void)activeView{
    _viewActive.alpha = 0.7;
    [_viewActive setUserInteractionEnabled:YES];
}

-(void)unactiveView{
    _viewActive.alpha = 0.0;
    [_viewActive setUserInteractionEnabled:NO];
}

-(void)activeViewWithAnimation{
    _viewActive.alpha = 0.0;
    [_viewActive setUserInteractionEnabled:YES];
    [UIView animateWithDuration:0.3 animations:^{
        _viewActive.alpha = 0.7;
    }];
}

-(void)unactiveViewWithAnimation{
    _viewActive.alpha = 0.7;
    [_viewActive setUserInteractionEnabled:NO];
    [UIView animateWithDuration:0.3 animations:^{
        _viewActive.alpha = 0.0;
    }];
}

#pragma mark - setup_process_view
-(void)createMainProcessView{
    if (_viewProcess == nil) {
        _viewProcess = [[UIView alloc] init];
    }
    [self.view addSubview:_viewProcess];
    
    _viewProcess.frame = CGRectMake(10, self.view.frame.size.height/2 - 40, 0, 0);
    _viewProcess.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin ;
    _viewProcess.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _viewProcess.layer.borderWidth = 2.0;
    _viewProcess.layer.cornerRadius = 5.0;
    _viewProcess.layer.masksToBounds = YES;
    _viewProcess.layer.backgroundColor = [UIColor whiteColor].CGColor;
    _viewProcess.clipsToBounds = YES;
    
    if (_processIndicatorView == nil) {
        _processIndicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
    _processIndicatorView.frame = CGRectMake(10, 10, 60, 60);
    [_processIndicatorView startAnimating];
    [_viewProcess addSubview:_processIndicatorView];
    
    if (_processTitle == nil) {
        _processTitle = [[UILabel alloc] init];
    }
    _processTitle.frame = CGRectMake(80, 25, self.view.frame.size.width - 110, 30);
    _processTitle.backgroundColor = [UIColor clearColor];
    [_viewProcess addSubview:_processTitle];
}

-(void)showProcess_WithTitle:(NSString *)title{
    [self activeView];
    [_processTitle setText:title];
    float x = (self.view.frame.size.width - 300) / 2;
    _viewProcess.frame = CGRectMake(x, self.view.frame.size.height/2 - 40, 300, 80);
}

-(void)hideProcess{
    [self unactiveView];
    _viewProcess.frame = CGRectMake(10, self.view.frame.size.height/2 - 40, 0, 0);
}

#pragma mark - setup_navigation_bar
#define navNoteTextFont ([UIFont fontWithName:@"Helvetica" size:10.0])
-(void)createTopNavigationBarControls{
    if (_topPanelBar == nil) {
        _topPanelBar = [[UIView alloc] init];
    }
    _topPanelBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    
    if (_btNavMenu == nil) {
        _btNavMenu = [[UIButton alloc] init];
    }
    _btNavMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavMenu.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    if (_btNavBack == nil) {
        _btNavBack = [[UIButton alloc] init];
    }
    _btNavBack = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavBack.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleBottomMargin;
    
    //gruop button 1
    if (_btNavRight1 == nil) {
        _btNavRight1 = [[UIButton alloc] init];
    }
    _btNavRight1 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavRight1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    if (_lblNavRightNote1 == nil) {
        _lblNavRightNote1 = [[UILabel alloc] init];
    }
    _lblNavRightNote1.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_lblNavRightNote1 setFont:navNoteTextFont];
    [_lblNavRightNote1 setTextAlignment:NSTextAlignmentCenter];
    [_lblNavRightNote1 setLineBreakMode:NSLineBreakByWordWrapping];
    
    //group button 2
    if (_btNavRight2 == nil) {
        _btNavRight2 = [[UIButton alloc] init];
    }
    _btNavRight2 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavRight2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    if (_lblNavRightNote2 == nil) {
        _lblNavRightNote2 = [[UILabel alloc] init];
    }
    _lblNavRightNote2.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_lblNavRightNote2 setFont:navNoteTextFont];
    [_lblNavRightNote2 setTextAlignment:NSTextAlignmentCenter];
    [_lblNavRightNote2 setLineBreakMode:NSLineBreakByWordWrapping];
    
    //group button 3
    if (_btNavRight3 == nil) {
        _btNavRight3 = [[UIButton alloc] init];
    }
    _btNavRight3 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavRight3.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    if (_lblNavRightNote3 == nil) {
        _lblNavRightNote3 = [[UILabel alloc] init];
    }
    _lblNavRightNote3.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_lblNavRightNote3 setFont:navNoteTextFont];
    [_lblNavRightNote3 setTextAlignment:NSTextAlignmentCenter];
    [_lblNavRightNote3 setLineBreakMode:NSLineBreakByWordWrapping];
    
    //group button 4
    if (_btNavRight4 == nil) {
        _btNavRight4 = [[UIButton alloc] init];
    }
    _btNavRight4 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavRight4.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    if (_lblNavRightNote4 == nil) {
        _lblNavRightNote4 = [[UILabel alloc] init];
    }
    _lblNavRightNote4.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_lblNavRightNote4 setFont:navNoteTextFont];
    [_lblNavRightNote4 setTextAlignment:NSTextAlignmentCenter];
    [_lblNavRightNote4 setLineBreakMode:NSLineBreakByWordWrapping];
    
    //group button 5
    if (_btNavRight5 == nil) {
        _btNavRight5 = [[UIButton alloc] init];
    }
    _btNavRight5 = [UIButton buttonWithType:UIButtonTypeCustom];
    _btNavRight5.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    if (_lblNavRightNote5 == nil) {
        _lblNavRightNote5 = [[UILabel alloc] init];
    }
    _lblNavRightNote5.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    [_lblNavRightNote5 setFont:navNoteTextFont];
    [_lblNavRightNote5 setTextAlignment:NSTextAlignmentCenter];
    [_lblNavRightNote5 setLineBreakMode:NSLineBreakByWordWrapping];
    
    if (_imgNavTitle == nil) {
        _imgNavTitle = [[UIImageView alloc] init];
    }
    _imgNavTitle.backgroundColor = [UIColor clearColor];
    _imgNavTitle.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleBottomMargin;
    _imgNavTitle.contentMode = UIViewContentModeScaleAspectFit;
    
    if (_lblNavTitle == nil) {
        _lblNavTitle = [[UILabel alloc] init];
    }
    _lblNavTitle.backgroundColor = [UIColor clearColor];
    _lblNavTitle.autoresizingMask = UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleWidth;
    [_lblNavTitle setTextAlignment:NSTextAlignmentLeft];
    
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = YES;
}

-(void)clearTopNavigationControls{
    for (UIView *childControl in [_topPanelBar subviews]) {
        [childControl removeFromSuperview];
    }
}

-(void)createTopNavigation_WithLeftButtons:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons{
    [self clearTopNavigationControls];
    float y = (iOS6_NavHeight - 30)/2;
    if (is_IOS7_or_Later) {
        y = 20 + ((iOS6_NavHeight -30)/2);
    }
    
    //left buttons
    switch (leftButtons) {
        case left_WithBack:
        {
            _btNavBack.frame = CGRectMake(5, y, 30, 30);
            [_topPanelBar addSubview:_btNavBack];
        }
            break;
        case left_WithMenu:
        {
            _btNavMenu.frame = CGRectMake(5, y, 30, 30);
            [_topPanelBar addSubview:_btNavMenu];
        }
            break;
        case left_WithBackMenu:
        {
            _btNavBack.frame = CGRectMake(5, y, 30, 30);
            _btNavMenu.frame = CGRectMake(40, y, 30, 30);
            [_topPanelBar addSubview:_btNavBack];
            [_topPanelBar addSubview:_btNavMenu];
        }
            break;
        case left_WithMenuBack:
        {
            _btNavMenu.frame = CGRectMake(5, y, 30, 30);
            _btNavBack.frame = CGRectMake(40, y, 30, 30);
            [_topPanelBar addSubview:_btNavBack];
            [_topPanelBar addSubview:_btNavMenu];
        }
            break;
            
        default:
            break;
    }
    
    //right buttons
    float x = self.view.frame.size.width - 35;
    
    switch (rightButtons) {
        case right_With1Button:
        {
            _btNavRight1.frame = CGRectMake(x, y, 30, 30);
            _lblNavRightNote1.frame = CGRectMake(x + 15, y - 10, 20, 20);
            _lblNavRightNote1.layer.cornerRadius = 20/2;
            _lblNavRightNote1.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote1];
            [_topPanelBar addSubview:_btNavRight1];
            
            [_topPanelBar bringSubviewToFront:_lblNavRightNote1];
        }
            break;
        case right_With2Buttons:
        {
            _btNavRight1.frame = CGRectMake(x - 35, y, 30, 30);
            _lblNavRightNote1.frame = CGRectMake(x - 35 + 15, y - 10, 20, 20);
            _lblNavRightNote1.layer.cornerRadius = 20/2;
            _lblNavRightNote1.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote1];
            [_topPanelBar addSubview:_btNavRight1];
            
            _btNavRight2.frame = CGRectMake(x, y, 30, 30);
            _lblNavRightNote2.frame = CGRectMake(x + 15, y - 10, 20, 20);
            _lblNavRightNote2.layer.cornerRadius = 20/2;
            _lblNavRightNote2.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote2];
            [_topPanelBar addSubview:_btNavRight2];
            
            [_topPanelBar bringSubviewToFront:_lblNavRightNote1];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote2];
        }
            break;
        case right_With3Buttons:
        {
            _btNavRight1.frame = CGRectMake(x - 70, y, 30, 30);
            _lblNavRightNote1.frame = CGRectMake(x - 70 + 15, y - 10, 20, 20);
            _lblNavRightNote1.layer.cornerRadius = 20/2;
            _lblNavRightNote1.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote1];
            [_topPanelBar addSubview:_btNavRight1];
            
            _btNavRight2.frame = CGRectMake(x - 35, y, 30, 30);
            _lblNavRightNote2.frame = CGRectMake(x - 35 + 15, y - 10, 20, 20);
            _lblNavRightNote2.layer.cornerRadius = 20/2;
            _lblNavRightNote2.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote2];
            [_topPanelBar addSubview:_btNavRight2];
            
            _btNavRight3.frame = CGRectMake(x, y, 30, 30);
            _lblNavRightNote3.frame = CGRectMake(x + 15, y - 10, 20, 20);
            _lblNavRightNote3.layer.cornerRadius = 20/2;
            _lblNavRightNote3.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote3];
            [_topPanelBar addSubview:_btNavRight3];
            
            [_topPanelBar bringSubviewToFront:_lblNavRightNote1];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote2];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote3];
        }
            break;
        case right_With4Buttons:
        {
            _btNavRight1.frame = CGRectMake(x - 105, y, 30, 30);
            _lblNavRightNote1.frame = CGRectMake(x - 105 + 15, y - 10, 20, 20);
            _lblNavRightNote1.layer.cornerRadius = 20/2;
            _lblNavRightNote1.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote1];
            [_topPanelBar addSubview:_btNavRight1];
            
            _btNavRight2.frame = CGRectMake(x - 70, y, 30, 30);
            _lblNavRightNote2.frame = CGRectMake(x - 70 + 15, y - 10, 20, 20);
            _lblNavRightNote2.layer.cornerRadius = 20/2;
            _lblNavRightNote2.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote2];
            [_topPanelBar addSubview:_btNavRight2];
            
            _btNavRight3.frame = CGRectMake(x - 35, y, 30, 30);
            _lblNavRightNote3.frame = CGRectMake(x - 35 + 15, y - 10, 20, 20);
            _lblNavRightNote3.layer.cornerRadius = 20/2;
            _lblNavRightNote3.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote3];
            [_topPanelBar addSubview:_btNavRight3];
            
            _btNavRight4.frame = CGRectMake(x, y, 30, 30);
            _lblNavRightNote4.frame = CGRectMake(x + 15, y - 10, 20, 20);
            _lblNavRightNote4.layer.cornerRadius = 20/2;
            _lblNavRightNote4.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote4];
            [_topPanelBar addSubview:_btNavRight4];
            
            [_topPanelBar bringSubviewToFront:_lblNavRightNote1];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote2];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote3];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote4];
        }
            break;
        case right_With5Buttons:
        {
            _btNavRight1.frame = CGRectMake(x - 140, y, 30, 30);
            _lblNavRightNote1.frame = CGRectMake(x - 140 + 15, y - 10, 20, 20);
            _lblNavRightNote1.layer.cornerRadius = 20/2;
            _lblNavRightNote1.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote1];
            [_topPanelBar addSubview:_btNavRight1];
            
            _btNavRight2.frame = CGRectMake(x - 105, y, 30, 30);
            _lblNavRightNote2.frame = CGRectMake(x - 105 + 15, y - 10, 20, 20);
            _lblNavRightNote2.layer.cornerRadius = 20/2;
            _lblNavRightNote2.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote2];
            [_topPanelBar addSubview:_btNavRight2];
            
            _btNavRight3.frame = CGRectMake(x - 70, y, 30, 30);
            _lblNavRightNote3.frame = CGRectMake(x - 70 + 15, y - 10, 20, 20);
            _lblNavRightNote3.layer.cornerRadius = 20/2;
            _lblNavRightNote3.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote3];
            [_topPanelBar addSubview:_btNavRight3];
            
            _btNavRight4.frame = CGRectMake(x - 35, y, 30, 30);
            _lblNavRightNote4.frame = CGRectMake(x - 35 + 15, y - 10, 20, 20);
            _lblNavRightNote4.layer.cornerRadius = 20/2;
            _lblNavRightNote4.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote4];
            [_topPanelBar addSubview:_btNavRight4];
            
            _btNavRight5.frame = CGRectMake(x, y, 30, 30);
            _lblNavRightNote5.frame = CGRectMake(x + 15, y - 10, 20, 20);
            _lblNavRightNote5.layer.cornerRadius = 20/2;
            _lblNavRightNote5.clipsToBounds = YES;
            [_topPanelBar addSubview:_lblNavRightNote5];
            [_topPanelBar addSubview:_btNavRight5];
            
            [_topPanelBar bringSubviewToFront:_lblNavRightNote1];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote2];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote3];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote4];
            [_topPanelBar bringSubviewToFront:_lblNavRightNote5];
        }
            break;
            
        default:
            break;
    }
    
}

-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitleImage:(NSString *)imageName{
    [_topPanelBar removeFromSuperview];
    [self.view addSubview:_topPanelBar];
    
    [self showTopNavigayionWithAnimation:ani];
    [self createTopNavigation_WithLeftButtons:leftButtons andRightButtons:rightButtons];
    
    float titleX = 5;
    
    if (leftButtons == left_None) {
        titleX = 5;
    }else if ((leftButtons == left_WithBack) || (leftButtons == left_WithMenu)){
        titleX = 40;
    }else{
        titleX = 75;
    }
    
    float titleWid = self.view.frame.size.width - titleX - 5;
    [_imgNavTitle setHidden:NO];
    if (rightButtons == right_None) {
        titleWid = self.view.frame.size.width - titleX - 5;
    }else {
        if (rightButtons > 3) {
            titleWid = self.view.frame.size.width - titleX - (3 * 30) - ((3 + 1) * 5);
            [_imgNavTitle setHidden:YES];
        }else{
            titleWid = self.view.frame.size.width - titleX - (rightButtons * 30) - ((rightButtons + 1) * 5);
        }
    }
    
    float titleY = (iOS6_NavHeight - 30)/2;
    if (is_IOS7_or_Later) {
        titleY = 20 + ((iOS6_NavHeight -30)/2);
    }
    
    _imgNavTitle.frame = CGRectMake(titleX, titleY, titleWid, 30);
    [_imgNavTitle setImage:[UIImage imageNamed:imageName]];
    [_topPanelBar addSubview:_imgNavTitle];
    [_topPanelBar sendSubviewToBack:_imgNavTitle];
    
    //for test only
    _topPanelBar.backgroundColor = [UIColor lightGrayColor];
    [_btNavMenu setBackgroundColor:[UIColor greenColor]];
    [_btNavBack setBackgroundColor:[UIColor greenColor]];
    [_btNavRight1 setBackgroundColor:[UIColor whiteColor]];
    [_lblNavRightNote1 setBackgroundColor:[UIColor redColor]];
    [_lblNavRightNote1 setText:@"100"];
    [_btNavRight2 setBackgroundColor:[UIColor whiteColor]];
    [_lblNavRightNote2 setBackgroundColor:[UIColor greenColor]];
    [_lblNavRightNote2 setText:@"67"];
    [_btNavRight3 setBackgroundColor:[UIColor whiteColor]];
    [_lblNavRightNote3 setBackgroundColor:[UIColor redColor]];
    [_lblNavRightNote3 setText:@"57"];
    [_btNavRight4 setBackgroundColor:[UIColor whiteColor]];
    [_lblNavRightNote4 setBackgroundColor:[UIColor greenColor]];
    [_lblNavRightNote4 setText:@"New"];
    [_btNavRight5 setBackgroundColor:[UIColor whiteColor]];
    [_lblNavRightNote5 setBackgroundColor:[UIColor redColor]];
    [_lblNavRightNote5 setText:@"LAG"];
    [_lblNavTitle setBackgroundColor:[UIColor whiteColor]];
    //end test
}

-(void)showTopNavigationWithAnimation:(BOOL)ani withLeftButton:(NavigationLeftButton)leftButtons andRightButtons:(NavigationRightButton)rightButtons withTitle:(NSString *)title{
    [_topPanelBar removeFromSuperview];
    [self.view addSubview:_topPanelBar];
    
    [self showTopNavigayionWithAnimation:ani];
    [self createTopNavigation_WithLeftButtons:leftButtons andRightButtons:rightButtons];
    
    float titleX = 5;
    
    if (leftButtons == left_None) {
        titleX = 5;
    }else if ((leftButtons == left_WithBack) || (leftButtons == left_WithMenu)){
        titleX = 40;
    }else{
        titleX = 75;
    }
    
    float titleWid = self.view.frame.size.width - titleX - 5;
    
    if (rightButtons == right_None) {
        titleWid = self.view.frame.size.width - titleX - 5;
    }else {
        titleWid = self.view.frame.size.width - titleX - (rightButtons * 30) - ((rightButtons + 1) * 5);
    }
    
    float titleY = (iOS6_NavHeight - 30)/2;
    if (is_IOS7_or_Later) {
        titleY = 20 + ((iOS6_NavHeight -30)/2);
    }
    
    _lblNavTitle.frame = CGRectMake(titleX, titleY, titleWid, 30);
    [_lblNavTitle setText:title];
    [_topPanelBar addSubview:_lblNavTitle];
}

-(void)showTopNavigayionWithAnimation:(BOOL)ani{
    float y = iOS6_NavHeight;
    
    if (is_IOS7_or_Later) {
        y = iOS7_or_Later_NavHeight;
    }
    
    if (ani == YES) {
        _topPanelBar.frame = CGRectMake(0, -y, self.view.frame.size.width, y);
        
        [UIView animateWithDuration:0.2 animations:^{
            _topPanelBar.frame = CGRectMake(0, 0, self.view.frame.size.width, y);
        }];
    }else{
        _topPanelBar.frame = CGRectMake(0, 0, self.view.frame.size.width, y);
    }
}

-(void)hideTopNavigationWithAnimation:(BOOL)ani{
    float y = iOS6_NavHeight;
    
    if (is_IOS7_or_Later) {
        y = iOS7_or_Later_NavHeight;
    }
    
    if (_topPanelBar.frame.origin.y == 0) {
        if (ani == YES) {
            _topPanelBar.frame = CGRectMake(0, 0, self.view.frame.size.width, y);
            [UIView animateWithDuration:0.2 animations:^{
                _topPanelBar.frame = CGRectMake(0, -y, self.view.frame.size.width, 0);
            }];
        }else{
            _topPanelBar.frame = CGRectMake(0, -y, self.view.frame.size.width, 0);
        }
    }
}

#pragma mark - view setup
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createActiveView];
    [self createMainProcessView];
    [self createTopNavigationBarControls];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - others functions - can be override
-(void)tapNavBackButton{

}

-(void)tapNavMenuButton{

}

-(void)tapNavButton1{

}

-(void)tapNavButton2{
    
}

-(void)tapNavButton3{
    
}

-(void)tapNavButton4{
    
}

-(void)tapNavButton5{
    
}

@end
