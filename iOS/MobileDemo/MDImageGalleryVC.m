//
//  MDImageGalleryVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDImageGalleryVC.h"
#import "MDUIHelpers.h"
#import "NewRelic+Development.h"

@interface MDImageGalleryVC ()

@end

@implementation MDImageGalleryVC

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
    [NewRelic recordEvent:@"DemoView" withAttributes:@{@"name": @"Image Gallery"}];

    [MDUIHelpers stylizeButtonsInView:self.view];

}

- (void)viewDidAppear:(BOOL)animated
{
    for (MDImageLoader *loader in self.imageViews) {
        [loader setup];
    }

    [self performSelector:@selector(updateImageList) withObject:nil afterDelay:0.4];
}

- (NSURLRequest *)flickrRequest
{
    return [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.flickr.com/services/feeds/photos_public.gne"]];
}

- (void)updateImageList
{
    NR_TRACE_METHOD_START(NRTraceTypeNetwork);

    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self downloadImageListInBackground];
    });

    NSURLResponse *resp;
    NSError *err;
    [NSURLConnection sendSynchronousRequest:self.flickrRequest
                          returningResponse:&resp error:&err];

    sleep(2);
    [self downloadAnImage];

    NR_TRACE_METHOD_STOP;
}

- (void)downloadImageListInBackground
{
    NR_TRACE_METHOD_START(NRTraceTypeNetwork);
    [NSURLConnection sendAsynchronousRequest:self.flickrRequest
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
                           }];

    sleep(2);
    NR_TRACE_METHOD_STOP;
}

- (void)downloadAnImage
{
    for (NSUInteger i=0; i<self.imageViews.count; i++)
    {
        MDImageLoader *il = self.imageViews[i];
        if (! il.complete) {
            [il startWithCompletionHandler:^(MDImageLoader *loader, NSError *error) {
                [self performSelector:@selector(downloadAnImage) withObject:nil afterDelay:0];
            }];
            return;
        }
    }
}


- (IBAction)doneTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

+ (NSURL *)URLForTile:(NSUInteger)index
{
    NSArray *images = @[@"http://mama-beach.com/mama2/wp-content/uploads/2013/07/photodune-4088822-beauty-beach-and-limestone-rocks-l.jpg",
                        @"http://cdn.superbwallpapers.com/wallpapers/nature/mountain-forest-17935-2560x1600.jpg",
                        @"http://upload.wikimedia.org/wikipedia/commons/1/17/Pilot-Mountain-Szmurlo.jpg",
                        @"http://cdn.superbwallpapers.com/wallpapers/photography/coffee-6885-2560x1600.jpg",
                        @"http://insidefandb.com/wp-content/uploads/2012/10/Paris-Louvre-through-new-glass-dome-courtesy-Paris-Tourism-Office-slash-Photographers.jpg",
                        @"http://upload.wikimedia.org/wikipedia/commons/4/49/Hel_Strand_Beach_7.jpg",
                        @"http://www.wallpaperslot.com/data/media/384/Peck%20Farm%20Granary%20and%20Silo,%20Kane%20County,%20Illinois.jpg",
                        @"http://i4.mirror.co.uk/incoming/article659489.ece/alternates/s2197/Healthy%20fresh%20tomatoes",
                        @"http://www.vote29.com/newmyblog/wp-content/uploads/2014/02/mountain-lion-jr2012.jpg",
                        @"http://www.canuckabroad.com/places/wp-content/uploads/2013/10/San-Francisco-Wallpaper-12.jpg",
                        @"http://upload.wikimedia.org/wikipedia/commons/0/0c/San_Francisco_Ferry_Building_(cropped).jpg",
                        @"http://humanesocietyofcharlotte.org/wp-content/uploads/2013/02/bigstock-Welsh-Corgi-Dog-110298621.jpg"
                       ];

    if (index < images.count)
        return [NSURL URLWithString:images[index]];

    return nil;
}
@end
