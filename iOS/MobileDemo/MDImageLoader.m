//
//  MDImageLoader.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDImageLoader.h"
#import "MDImageGalleryVC.h"

@interface MDImageLoader ()
@property (strong) UIActivityIndicatorView *indicatorView;
@end

@implementation MDImageLoader

@synthesize sourceURL = _sourceURL;
@synthesize complete = _complete;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self->_complete = NO;

    }
    return self;
}

- (void)setup
{
    NSLog(@"working with item %d", (int)self.tag);

    self->_sourceURL = [MDImageGalleryVC URLForTile:(NSUInteger)self.tag];

    if (! self.indicatorView) {
        self.indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        self.indicatorView.frame = self.bounds;
        [self addSubview:self.indicatorView];
        self.indicatorView.hidden = NO;
        [self.indicatorView startAnimating];
    }

    self.contentMode = UIViewContentModeScaleAspectFill;
    self.clipsToBounds = YES;

    self.image = nil;
    self.decodedImage = nil;
    self->_complete = NO;

}

- (void)startWithCompletionHandler:(void (^)(MDImageLoader *loader, NSError *error))handler;
{

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NR_TRACE_METHOD_START(NRTraceTypeNetwork);

        NSURLRequest *request = [NSURLRequest requestWithURL:self.sourceURL];
        NSURLResponse *response = nil;
        NSError *error = nil;

        NSData *imageData = [NSURLConnection sendSynchronousRequest:request
                                                  returningResponse:&response
                                                              error:&error];

        if (error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                self->_complete = YES;
                
                [self.indicatorView removeFromSuperview];
                self.indicatorView = nil;

                NSLog(@"Error downloading %@\n%@", self.sourceURL.absoluteString, error.description);
                handler(self, error);
            });
        }
        else {
            if ([self parseImage:imageData]) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self->_complete = YES;
                    
                    [self.indicatorView removeFromSuperview];
                    self.indicatorView = nil;
                    [self displayImage];
                    
                    handler(self, nil);
                });
            }
            else {
                dispatch_async(dispatch_get_main_queue(), ^{
                    self->_complete = YES;
                    
                    [self.indicatorView removeFromSuperview];
                    self.indicatorView = nil;

                    NSLog(@"Error downloading %@\n%@", self.sourceURL.absoluteString, response.description);

                    handler(self, [NSError errorWithDomain:@"InvalidImage"
                                                      code:1
                                                  userInfo:@{@"URL": self.sourceURL.absoluteString,
                                                             @"HTTPResponse": response.description}]);
                });
            }
        }

        NR_TRACE_METHOD_STOP;
    });
}

- (void)displayImage
{
    NR_TRACE_METHOD_START(NRTraceTypeImages);

    self.image = [MDImageLoader imageWithImage:self.decodedImage scaledToSize:self.bounds.size];

    NR_TRACE_METHOD_STOP;
}
- (BOOL)parseImage:(NSData *)data
{
    NR_TRACE_METHOD_START(NRTraceTypeImages);

    self.decodedImage = [UIImage imageWithData:data];
    return (self.decodedImage != nil && self.decodedImage.size.width > 0);

    NR_TRACE_METHOD_STOP;
}

+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
