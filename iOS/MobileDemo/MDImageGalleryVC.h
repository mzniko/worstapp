//
//  MDImageGalleryVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDImageGalleryVC : UIViewController
@property (nonatomic, strong) IBOutlet UIScrollView *imageScrollView;

- (IBAction)doneTapped:(id)sender;
@end
