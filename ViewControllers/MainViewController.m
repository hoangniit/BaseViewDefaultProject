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
    [baseResource setNavigationMenuImageName:@"settings.png"];
    [baseResource setNavigationBackImageName:@"new.png"];
    [baseResource setNavigationButton1ImageName:@"search.png"];
    [baseResource setNavigationButton2ImageName:@"search.png"];
    [baseResource setNavigationButton3ImageName:@"save.png"];
    [baseResource setNavigationButton4ImageName:@"search.png"];
    [baseResource setNavigationButton5ImageName:@"search.png"];
//    [self showTopNavigationWithAnimation:YES withLeftButton:left_WithMenuBack andRightButtons:right_With5Buttons withTitleImage:@"test.jpg"];
    [self showTopNavigationWithAnimation:YES withLeftButton:left_WithBackMenu andRightButtons:right_With3Buttons withTitle:@"Người đi buôn lậu"];
    
    //setup toolbar
    //contact toolbar
//    [self showBottomToolbarWithAnimation:YES withToolbarType:Toolbar_type_contact];
//    [self setToolbarContactsPhone:@"0933036596" andEmail:@"hoangniitsoftware@gmail.com"];
    //image
//    [self showBottomToolbarWithAnimation:YES withToolbarType:Toolbar_type_image];
//    [self setToolbarImage:[UIImage imageNamed:@"test.jpg"] withContentMode:UIViewContentModeScaleAspectFit];
    //button
    [self showBottomToolbarWithAnimation:YES withToolbarType:Toolbar_type_button];
    NSArray *buttonImgArr = [NSArray arrayWithObjects:@"new.png",@"save.png",@"search.png",@"settings.png",@"user.png",@"world.png", nil];
    NSArray *buttonTitleArr = [NSArray arrayWithObjects:@"new",@"save",@"search",@"settings",@"user",@"world", nil];
    [self setToolbarNumberOfButtons:6 withButtonWidth:60 isScrollable:YES showTitle:YES titleColor:[UIColor whiteColor] withButtonImageArray:buttonImgArr andButtonTitleArray:buttonTitleArr];
    
//    [self setToolbarBackgroundColor:[UIColor redColor]];
//    [self setToolbarBackgroundImage:[UIImage imageNamed:@"test.jpg"] withContentMode:UIViewContentModeScaleToFill];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
//    [self hideTopNavigationWithAnimation:YES];
//    [self UpdateButton1NotificationLabel:@"ali"];
//    [self hideToolbarWithAnimation:YES];
}

//-(void)tapToolbarImage:(id)sender{
//    NSLog(@"detect delegate");
//}

//-(void)tapContactPhone:(id)sender{
//    if ([sender isKindOfClass:[UIButton class]]) {
//        NSLog(@"alibaba is kind of class button");
//    }else{
//        NSLog(@"Fuck bugs");
//    }
//}

//-(void)tapToolbarButtonAtIndex:(NSIndexPath *)indexPath{
//    if (indexPath.row == 1) {
//        NSLog(@"Delegate tap button at index 1");
//    }else if (indexPath.row == 3){
//        NSLog(@"Delegate tap button at index 3");
//    }else{
//        NSLog(@"Unknow");
//    }
//}

@end
