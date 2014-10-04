//
//  MDCrashGameVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/3/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDCrashGameVC : UIViewController

@property (nonatomic, strong) IBOutlet UILabel *counter;
@property (nonatomic, strong) IBOutletCollection(UIButton) NSArray *buttonSet;

- (IBAction)buttonTapped:(id)sender;
- (IBAction)doneTapped:(id)sender;

@end
