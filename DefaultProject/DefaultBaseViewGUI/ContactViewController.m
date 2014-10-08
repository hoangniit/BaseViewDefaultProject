//
//  ContactViewController.m
//  DefaultProject
//
//  Created by Vo Hoang on 10/8/14.
//  Copyright (c) 2014 Vo Hoang. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()

@end

@implementation ContactViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    //phone
    [_btPhone.titleLabel setFont:toolbarButtonFont];
    [_btPhone addTarget:self action:@selector(tapContactPhone) forControlEvents:UIControlEventTouchUpInside];
    
    //email
    [_btEmail.titleLabel setFont:toolbarButtonFont];
    [_btEmail addTarget:self action:@selector(tapContactEmail) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)setContactsPhone:(NSString *)phoneNumber andEmail:(NSString *)emailString{
    [_btPhone setTitle:phoneNumber forState:UIControlStateNormal];
    [_btEmail setTitle:emailString forState:UIControlStateNormal];
}

-(void)tapContactPhone{
    if (!_contactDelegate) {
        NSLog(@"Not delegate, will call: %@", _btPhone.titleLabel.text);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:_btPhone.titleLabel.text]]];
    }else{
        @try {
            [_contactDelegate tapContactPhone];
        }
        @catch (NSException *exception) {
            NSLog(@"Not delegate, will call: %@", [@"tel:" stringByAppendingString:_btPhone.titleLabel.text]);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"tel:" stringByAppendingString:_btPhone.titleLabel.text]]];
        }
    }
}

-(void)tapContactEmail{
    if (!_contactDelegate) {
        NSLog(@"Not delegate, will send email to: %@", _btEmail.titleLabel.text);
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:" stringByAppendingString:_btEmail.titleLabel.text]]];
    }else{
        @try {
            [_contactDelegate tapContactEmail];
        }
        @catch (NSException *exception) {
            NSLog(@"Not delegate, will send email to: %@", _btEmail.titleLabel.text);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[@"mailto:" stringByAppendingString:_btEmail.titleLabel.text]]];
        }
    }
}

@end
