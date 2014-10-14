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
    
    [baseResource setNavigationMenuImageName:@"settings.png"];
    [baseResource setNavigationBackImageName:@"new.png"];
    [baseResource setNavigationButton1ImageName:@"search.png"];
    [baseResource setNavigationButton2ImageName:@"search.png"];
    [baseResource setNavigationButton3ImageName:@"save.png"];
    [baseResource setNavigationButton4ImageName:@"search.png"];
    [baseResource setNavigationButton5ImageName:@"search.png"];
}

-(void)viewWillAppear:(BOOL)animated{
//    [baseResource setNavigationMenuImageName:@"settings.png"];
//    [baseResource setNavigationBackImageName:@"new.png"];
//    [baseResource setNavigationButton1ImageName:@"search.png"];
//    [baseResource setNavigationButton2ImageName:@"search.png"];
//    [baseResource setNavigationButton3ImageName:@"save.png"];
//    [baseResource setNavigationButton4ImageName:@"search.png"];
//    [baseResource setNavigationButton5ImageName:@"search.png"];
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
    NSArray *buttonImgArr = [NSArray arrayWithObjects:@"new.png",@"save.png",@"search.png",@"settings.png",@"user.png",@"test.jpg", nil];
    NSArray *buttonTitleArr = [NSArray arrayWithObjects:@"new",@"save",@"search",@"settings",@"user",@"world", nil];
    [self setToolbarNumberOfButtons:6 withButtonWidth:60 isScrollable:YES showTitle:YES titleColor:[UIColor whiteColor] withButtonImageArray:buttonImgArr andButtonTitleArray:buttonTitleArr];
    
    [self.slideMenu setTopMenuType:topMenuTypeImageTitleDesciption];
    [self.slideMenu menuTop_setImage:[UIImage imageNamed:@"save.png"]];
    [self.slideMenu menuTop_setTitle:@"Buông thần"];
    [self.slideMenu menuTop_SetTitleFontColor:[UIColor blueColor]];
    [self.slideMenu menuTop_setDescription:@"Bán thánh"];
    [self.slideMenu menuTop_setSearchButtonImage:[UIImage imageNamed:@"search.png"]];
    
    [self.slideMenu setBottomMenuType:bottomMenuType3Buttons];
    BottomButtonTitles *bottomSlideTitle = [[BottomButtonTitles alloc] init];
    bottomSlideTitle.button1Title = @"Buôn thần";
    bottomSlideTitle.button2Title = @"Bán thánh";
    bottomSlideTitle.button3Title = @"Oánh CA";
    [self.slideMenu menuBottom_setBottomButtonTitles:bottomSlideTitle];
    [self.slideMenu menuBottom_setButtonFontColor:[UIColor blueColor]];
    
    
    BottomButtonImages *bottomSlideImage = [[BottomButtonImages alloc] init];
    bottomSlideImage.button1Image = [UIImage imageNamed:@"new.png"];
    bottomSlideImage.button2Image = [UIImage imageNamed:@"search.png"];
    bottomSlideImage.button3Image = [UIImage imageNamed:@"settings.png"];
    [self.slideMenu menuBottom_setBottomButtonImages:bottomSlideImage];
    
    [self.slideMenu setBottomMenuBackgroundColor:[UIColor lightGrayColor]];
    
    
    [self.slideMenu showMenuTopPanel:YES];
    [self.slideMenu showMenuBottomPanel:YES];
    
    self.slideMenu.slideMenuDelegate = self;
//    [self setToolbarBackgroundColor:[UIColor redColor]];
//    [self setToolbarBackgroundImage:[UIImage imageNamed:@"test.jpg"] withContentMode:UIViewContentModeScaleToFill];
    
//    [self showProcess_WithTitle:@"Bây giờ chú muốn hốt ai ?"];
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

-(NSInteger)slideMenuNumberOfSectionsInMenu{
    return 2;
}

-(NSInteger)slideMenuNumberOfItemsInMenuSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 6;
            break;
            
        default:
            return 11;
            break;
    }
}

-(UITableViewCell *)slideMenuItemAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MenuCellItem"];
    [cell.textLabel setText:[NSString stringWithFormat:@"Cell Index: %ld",(long)indexPath.row]];
    return cell;
}

@end
