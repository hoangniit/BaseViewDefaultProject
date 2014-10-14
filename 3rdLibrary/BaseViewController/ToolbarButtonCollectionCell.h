//
//  ToolbarButtonCollectionCell.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/9/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ToolbarButtonCollectionCell : UICollectionViewCell

#define buttonCellFont ([UIFont fontWithName:@"Helvetica-Bold" size:10.0])

@property (strong,nonatomic) IBOutlet UIImageView *buttonImage;
@property (strong,nonatomic) IBOutlet UILabel *buttonTitle;

@end
