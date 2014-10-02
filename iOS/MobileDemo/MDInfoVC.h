//
//  MDInfoVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/1/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDInfoVC : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) IBOutlet UITextView *appInfo;
@property (nonatomic, strong) IBOutlet UIControl *backgroundView;
@property (nonatomic, strong) IBOutlet UISegmentedControl *environmentSelector;
@property (nonatomic, strong) IBOutlet UITextField *appTokenField;
@property (assign) BOOL needsRestart;

- (IBAction)changeVersionTapped:(id)sender;
- (IBAction)doneTapped:(id)sender;
- (IBAction)environmentSelectionChanged:(id)sender;
- (IBAction)appTokenChanged:(id)sender;
- (IBAction)appTokenKeyPress:(id)sender;
- (IBAction)dismissKeyboard:(id)sender;

@end
