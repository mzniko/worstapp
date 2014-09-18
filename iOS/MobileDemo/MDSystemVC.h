//
//  MDSystemVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDSystemVC : UIViewController

@property (nonatomic, strong) IBOutlet UISwitch *oopsSwitch;

- (IBAction)doneTapped:(id)sender;

@end
