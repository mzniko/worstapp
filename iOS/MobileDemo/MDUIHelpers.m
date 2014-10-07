//
//  MDUIHelpers.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/7/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDUIHelpers.h"

@implementation MDUIHelpers

+ (void)stylizeButtonsInView:(UIView *)view
{
    if ([view isKindOfClass:[UIButton class]]) {
        view.backgroundColor = [UIColor colorWithRed:0.439 green:0.796 blue:0.824 alpha:1];

        if (((UIButton *)view).currentBackgroundImage != nil) {
            // don't mess w/ custom images
        }
        else if (view.bounds.size.width == view.bounds.size.height) {
            // bigger curves on square buttons
            [view.layer setCornerRadius:view.bounds.size.width/2];
        }
        else {
            [view.layer setCornerRadius:8.0f];
        }

        // border
        [view.layer setBorderColor:[UIColor darkGrayColor].CGColor];
        [view.layer setBorderWidth:1.5f];

        // drop shadow
//        [view.layer setShadowColor:[UIColor blackColor].CGColor];
//        [view.layer setShadowOpacity:0.8];
//        [view.layer setShadowRadius:3.0];
//        [view.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    }

    for (UIView *child in view.subviews) {
        [MDUIHelpers stylizeButtonsInView:child];
    }
}

@end
