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
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification object:[UIDevice currentDevice]];
}

- (void) orientationChanged:(NSNotification *)note
{
    [self collectionView:_buttonCollectionView layout:_buttonCollectionView.collectionViewLayout insetForSectionAtIndex:0];
    dispatch_async(dispatch_get_main_queue(), ^{
        [_buttonCollectionView reloadData];
    });
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
    [cell.buttonImage setBackgroundColor:[UIColor clearColor]];
    [cell.buttonImage setImage:nil];
    if ((!_buttonImageArray) || ([_buttonImageArray count]==0)) {
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
        [cell.buttonTitle setTextColor:_buttonTitleColor];
        if ((!_buttonTitleArray) || ([_buttonTitleArray count]==0)) {
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

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(_buttonWidth, _buttonCollectionView.frame.size.height);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    // return UIEdgeInsetsMake(0,8,0,8);  // top, left, bottom, right
    float edgeWid = ([UIScreen mainScreen].bounds.size.width - (_numberOfbutton * _buttonWidth))/2;
    if (edgeWid < 5) {
        edgeWid = 5;
    }
    
    return UIEdgeInsetsMake(0, edgeWid,0,edgeWid);  // top, left, bottom, right
}

-(void)tapToolbarButtonAtIndex:(NSIndexPath *)indexPath{
    if (!_toolbarButtonDelegate) {
        NSLog(@"Default tap button at index: %ld", (long)indexPath.row);
    }else{
        @try {
            [_toolbarButtonDelegate tapToolbarButtonAtIndex:indexPath];
        }
        @catch (NSException *exception) {
            NSLog(@"Default tap button at index: %ld", (long)indexPath.row);
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
