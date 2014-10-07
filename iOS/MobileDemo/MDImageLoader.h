//
//  MDImageLoader.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDImageLoader : UIImageView

@property (strong, readonly) NSURL *sourceURL;
@property (assign, readonly) BOOL complete;
@property (strong) UIImage *decodedImage;

- (void)startWithCompletionHandler:(void (^)(MDImageLoader *loader, NSError *error))handler;
- (void)setup;

@end
