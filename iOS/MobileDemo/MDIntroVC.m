//
//  MDViewController.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDIntroVC.h"
#import "MDHomeVC.h"
#import "MBProgressHUD.h"
#import "NRMADemoTools.h"

@interface MDIntroVC ()

@end


extern NSString *__NRMA__customAppVersionString;

@implementation MDIntroVC

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateAppInfo];

    [self parseDataSymbols];
}

- (void)parseDataSymbols
{
    NR_TRACE_METHOD_START(NRTraceTypeJson);

    [NSThread sleepForTimeInterval:0.15];

    int count = (rand() % 20) * 5 + 5;
    for (int i=0; i<count; i++) {
        [self updateDB];
    }

    NR_TRACE_METHOD_STOP;
}

- (void)updateDB
{
    NR_TRACE_METHOD_START(NRTraceTypeDatabase);

    float interval = 0.035;
    [NSThread sleepForTimeInterval:interval];

    NR_TRACE_METHOD_STOP;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeVersionTapped:(id)sender
{
    sranddev();
    int appMajor = rand() % 8 + 1;
    int appMinor = rand() % 80;
    NSString *appVersion = [NSString stringWithFormat:@"%d.%02d", appMajor, appMinor];
    [NRMADemoTools setApplicationVersion:appVersion];

    [[NSUserDefaults standardUserDefaults] setValue:appVersion forKey:@"CustomAppVersion"];

    [NRMADemoTools forceReconnect];

    if ([self isViewLoaded]) {
        [self updateAppInfo];
    }
}

- (void)updateAppInfo
{
    self.appInfo.text = [NSString stringWithFormat:@"Version\t%@\nOS\t%@\nModel\t%@\nCarrier\t%@\nUDID\t%@",
                         __NRMA__customAppVersionString,
                         [NewRelicInternalUtils osVersion],
                         [NewRelicInternalUtils deviceModel],
                         [NewRelicInternalUtils carrierName],
                         [NewRelicInternalUtils deviceId]];
}

- (IBAction)loginTapped:(id)sender
{
    NSString *interaction = NR_START_NAMED_INTERACTION(@"Process Login");

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hud.mode = MBProgressHUDModeAnnularDeterminate;
    hud.labelText = @"Loading";

    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_LOW, 0),
                   ^{
                        for (float i=0; i<=1; i+=0.01) {
                            dispatch_async(dispatch_get_main_queue(), ^{
                                hud.progress = i;
                            });

                            [self loginUpdate:(i >= 0.1 && i < 0.11) || (i >= 0.5 && i < 0.53)];
                        }


                        dispatch_async(dispatch_get_main_queue(), ^{
                            NR_INTERACTION_STOP(interaction);
                            [self loginComplete];
                        });
                   });
}

- (void)loginComplete
{
    [MBProgressHUD hideHUDForView:self.view animated:YES];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MDHomeVC *newVC = (MDHomeVC *)[storyboard instantiateViewControllerWithIdentifier:@"MDHomeVC"];

    [self presentViewController:newVC animated:YES completion:nil];
}

- (void)loginUpdate:(BOOL)doCall
{
    NR_TRACE_METHOD_START(NRTraceTypeDatabase);

    if (doCall) {
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://login.newrelic.com/login"]];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               }];
    }

    [NSThread sleepForTimeInterval:0.05];

    NR_TRACE_METHOD_STOP;
}

@end