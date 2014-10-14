//
//  ToolbarImageViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/8/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "ToolbarImageViewController.h"

@interface ToolbarImageViewController ()

@end

@implementation ToolbarImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_btTapImage addTarget:self action:@selector(tapToolbarImage:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)tapToolbarImage:(id)sender{
    if (!_toolbarImageDelegate) {
        NSLog(@"Tap toolbar Image, no delegate");
    }else{
        @try {
            //default function here
            [_toolbarImageDelegate tapToolbarImage:sender];
        }
        @catch (NSException *exception) {
            NSLog(@"Tap toolbar image, no delegate");
        }
    }
}

@end
