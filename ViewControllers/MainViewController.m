//
//  MainViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/1/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated{
//    [self showProcess_WithTitle:@"Test process view"];
//    [self showTopNavigationWithAnimation:YES withLeftButton:left_WithBackMenu andRightButtons:right_With5Buttons withTitle:@"Alibaba"];
    [self showTopNavigationWithAnimation:YES withLeftButton:left_WithBackMenu andRightButtons:right_With2Buttons withTitleImage:@"test.jpg"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self hideTopNavigationWithAnimation:YES];
//    [self UpdateButton1NotificationLabel:@"ali"];
}

@end
