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

#pragma mark - view setup
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createActiveView];
    [self createMainProcessView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
