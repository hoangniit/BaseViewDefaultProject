//
//  ToolbarButtonViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToolbarButtonCollectionCell.h"

@protocol ButtonToolbarDelegate <NSObject>

-(void)tapToolbarButtonAtIndex:(NSIndexPath *)indexPath;

@end

@interface ToolbarButtonViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDelegate>

@property (strong,nonatomic) IBOutlet UICollectionView *buttonCollectionView;

@property (strong,nonatomic) id <ButtonToolbarDelegate> toolbarButtonDelegate;
@property (strong,nonatomic) NSArray *buttonTitleArray;
@property (strong,nonatomic) NSArray *buttonImageArray;
@property (nonatomic) BOOL isShowText;
@property (nonatomic) float buttonWidth;
@property (nonatomic) NSInteger numberOfbutton;
@property (nonatomic) BOOL isScrollable;

-(void)tapToolbarButtonAtIndex:(NSIndexPath *)indexPath;

-(void)updateScrollable;

@end
