//
//  ContactViewController.h
//  DefaultProject
//
//  Created by Vo Hoang on 10/8/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ContactViewDelegate <NSObject>

-(void)tapContactPhone:(id)sender;
-(void)tapContactEmail:(id)sender;

@end

@interface ContactViewController : UIViewController <ContactViewDelegate>

#define toolbarContactImageViewWidth 320.0
#define toolbarLabelFont ([UIFont fontWithName:@"Helvetica" size:14.0])
#define toolbarButtonFont ([UIFont fontWithName:@"Helvetica-Bold" size:15.0])

@property (strong,nonatomic) IBOutlet UILabel *lblPhone;
@property (strong,nonatomic) IBOutlet UIButton *btPhone;
@property (strong,nonatomic) IBOutlet UILabel *lblEmail;
@property (strong,nonatomic) IBOutlet UIButton *btEmail;
@property (strong,nonatomic) id <ContactViewDelegate> contactDelegate;

-(void)setContactsPhone:(NSString *)phoneNumber andEmail:(NSString *)emailString;

-(void)tapContactPhone:(id)sender;
-(void)tapContactEmail:(id)sender;

@end
