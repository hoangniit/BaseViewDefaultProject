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

@end
