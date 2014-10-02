//
//  MDImageGalleryVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDImageGalleryVC.h"

@interface MDImageGalleryVC ()

@end

@implementation MDImageGalleryVC
@synthesize imageScrollView;

- (id)init {
    return [self initWithNibName:@"MDImageGalleryView" bundle:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (void) viewDidLoad
{
    CGFloat width = self.imageScrollView.frame.size.width / 2;

    [self.imageScrollView setContentSize:CGSizeMake(self.imageScrollView.frame.size.width, width * 6)];
}

- (IBAction)doneTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}
@end
