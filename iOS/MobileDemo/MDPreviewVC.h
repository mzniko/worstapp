//
//  MDPreviewVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/3/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDPreviewVC : UIViewController

@property (strong) NSString *targetName;

@property (nonatomic, strong) IBOutlet UITextView *contentView;

- (IBAction)continueTapped:(id)sender;
- (IBAction)cancelTapped:(id)sender;

- (id)initWithTarget:(NSString *)target;

@end
