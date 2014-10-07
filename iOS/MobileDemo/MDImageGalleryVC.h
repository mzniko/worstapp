//
//  MDImageGalleryVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MDImageLoader.h"


@interface MDImageGalleryVC : UIViewController
@property (nonatomic, strong) IBOutletCollection(MDImageLoader) NSArray *imageViews;
@property (nonatomic, strong) IBOutlet UIButton *doneButton;

- (IBAction)doneTapped:(id)sender;

+ (NSURL *)URLForTile:(NSUInteger)index;

@end
