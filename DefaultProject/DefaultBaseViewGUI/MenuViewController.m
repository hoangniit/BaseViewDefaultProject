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

#pragma mark - define
#define is_IOS7_or_Later ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 ? YES : NO)
#define is_IPhone5 (([[UIScreen mainScreen] bounds].size.height - 568) ? NO : YES)
#define is_IPhone6 (([[UIScreen mainScreen] bounds].size.height - 667) ? NO : YES)
#define is_IPhone6Plus (([[UIScreen mainScreen] bounds].size.height - 736) ? NO : YES)
#define is_IPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define is_IPhone (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define iOS6_NavHeight 44.0
#define iOS7_or_Later_NavHeight 64.0

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
