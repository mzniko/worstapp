//
//  MDHomeViewController.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDHomeVC.h"

@implementation MDHomeVC

- (void)viewDidAppear:(BOOL)animated
{
}

- (IBAction)doneTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)screenTapped:(id)sender
{
    NSString *interaction = NR_START_NAMED_INTERACTION(@"Handle Screen");

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://news.bbc.co.uk/"]];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                           }];

    [NSThread sleepForTimeInterval:1.3];
    NR_INTERACTION_STOP(interaction);

    NSString *s = @"hoohahMimauAppium:";

    s = @"PC_LOAD_LETTER:";
    [NSString performSelector:NSSelectorFromString(s)];
}

@end
