//
//  MDViewController.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDIntroVC : UIViewController <UITableViewDelegate>

@property (nonatomic, strong) IBOutlet UILabel *screenLabel;
@property (nonatomic, strong) IBOutlet UITextView *appInfo;
@property (nonatomic, strong) IBOutlet UITableView *actionTableView;

- (IBAction)changeVersionTapped:(id)sender;

- (IBAction)loginTapped:(id)sender;
@end
