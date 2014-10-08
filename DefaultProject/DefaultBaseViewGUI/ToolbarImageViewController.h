//
//  ToolbarImageViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/8/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ToolbarImageDelegate <NSObject>

-(void)tapToolbarImage:(id)sender;

@end

@interface ToolbarImageViewController : UIViewController

@property (weak,nonatomic) NSURL *imgLinksToUrl;

@property (strong,nonatomic) IBOutlet UIButton *btTapImage;
@property (strong,nonatomic) IBOutlet UIImageView *imgToolbar;

-(void)tapToolbarImage:(id)sender;

@end
