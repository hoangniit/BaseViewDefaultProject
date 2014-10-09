//
//  ToolbarButtonViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "ToolbarButtonViewController.h"

@interface ToolbarButtonViewController ()

@end

@implementation ToolbarButtonViewController

#define toolbarButtonCellIden @"ToolbarButtonCellIdentifer"

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [_buttonCollectionView  registerNib:[UINib nibWithNibName:@"ToolbarButtonCollectionCell" bundle:nil] forCellWithReuseIdentifier:toolbarButtonCellIden];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return _numberOfbutton;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIndentifer = toolbarButtonCellIden;
    ToolbarButtonCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIndentifer forIndexPath:indexPath];
    
    if ((!_buttonImageArray) || ([_buttonImageArray count])) {
        [cell.buttonImage setBackgroundColor:[UIColor blueColor]];
        cell.buttonImage.layer.cornerRadius = cell.buttonImage.frame.size.height/2;
    }else{
        @try {
            [cell.buttonImage setImage:[UIImage imageNamed:[_buttonImageArray objectAtIndex:indexPath.row]]];
        }
        @catch (NSException *exception) {
            [cell.buttonImage setBackgroundColor:[UIColor blueColor]];
            cell.buttonImage.layer.cornerRadius = cell.buttonImage.frame.size.height/2;
        }
    }
    
    if (_isShowText == YES) {
        cell.buttonTitle.hidden = NO;
        if ((!_buttonTitleArray) || ([_buttonTitleArray count])) {
            [cell.buttonTitle setText:[@"Index" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)indexPath.row]]];
        }else{
            @try {
                [cell.buttonTitle setText:[_buttonTitleArray objectAtIndex:indexPath.row]];
            }
            @catch (NSException *exception) {
                [cell.buttonTitle setText:[@"Index" stringByAppendingString:[NSString stringWithFormat:@"%ld", (long)indexPath.row]]];
            }
        }
    }else {
        cell.buttonTitle.hidden = YES;
    }
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self tapToolbarButtonAtIndex:indexPath];
}

-(void)tapToolbarButtonAtIndex:(NSIndexPath *)indexPath{
    if (!_toolbarButtonDelegate) {
        NSLog(@"Tap button at index: %ld", (long)indexPath.row);
    }else{
        @try {
            [_toolbarButtonDelegate tapToolbarButtonAtIndex:indexPath];
        }
        @catch (NSException *exception) {
            NSLog(@"Tap button at index: %ld", (long)indexPath.row);
        }
    }
}

-(void)updateScrollable{
    if (_isScrollable) {
        _buttonCollectionView.contentSize = CGSizeMake((_buttonWidth * _numberOfbutton), _buttonCollectionView.frame.size.height);
    }else{
        _buttonCollectionView.contentSize = CGSizeMake(_buttonCollectionView.frame.size.width, _buttonCollectionView.frame.size.height);
    }
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, _buttonCollectionView.frame.size.height);
}

@end
