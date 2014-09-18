//
//  MDViewController.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDIntroVC : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *screenLabel;

- (IBAction)changeVersionTapped:(id)sender;

- (IBAction)loginTapped:(id)sender;
@end
