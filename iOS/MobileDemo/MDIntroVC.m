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
#import "MDDemoListDataSource.h"
#import "MDPreviewVC.h"
#import "MDUIHelpers.h"
#import "MDSettings.h"

@interface MDIntroVC ()
@property (strong) MDDemoListDataSource *actionDataSource;
@end


extern NSString *__NRMA__customAppVersionString;

@implementation MDIntroVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (! self.actionDataSource) {
        self.actionDataSource = [[MDDemoListDataSource alloc] init];
    }

	// Do any additional setup after loading the view, typically from a nib.
    self.actionTableView.dataSource = self.actionDataSource;
    self.actionTableView.delegate = self;

    self.actionTableView.backgroundView.backgroundColor = [UIColor colorWithWhite:0.7 alpha:0.3];
    
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setTextColor:[UIColor darkGrayColor]];
    [[UILabel appearanceWhenContainedIn:[UITableViewHeaderFooterView class], nil] setShadowColor:[UIColor blackColor]];

    [self parseDataSymbols];

    [MDUIHelpers stylizeButtonsInView:self.view];

}

- (void)viewWillAppear:(BOOL)animated
{
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


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *className = [self.actionDataSource classNameForActionAtIndexPath:indexPath];

    if (className.length > 0) {
        if (NSClassFromString(className)) {
        [self presentViewController:[[MDPreviewVC alloc] initWithTarget:className]
                           animated:YES
                         completion:nil];
        }
        else {
            [[[UIAlertView alloc] initWithTitle:@"Coming soon"
                                        message:@"This feature is imminent, hang tight..."
                                       delegate:nil
                              cancelButtonTitle:@"<< ☹ >>"
                              otherButtonTitles:nil] show];
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

                            [self loginUpdate:i];
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

- (void)loginUpdate:(float)progress
{
    static NSString *appDataHeaderKey = @"X-NewRelic-App-Data";
    static NSString *CATHeader = nil;
    static NRTimer *reqTimer = nil;
    
    NSURL *loginUrl = [NSURL URLWithString:@"https://staging-api.newrelic.com/api/ios/v1/accounts/default.json"];
    
    NR_TRACE_METHOD_START(NRTraceTypeDatabase);

    // Api::Ios::V1::ApplicationsController#summary
    if (progress >= 0.1 && progress < 0.11) {
        NSURLRequest *request = [NSURLRequest requestWithURL:loginUrl];
        reqTimer = [[NRTimer alloc] init];
        [NSURLConnection sendAsynchronousRequest:request
                                           queue:[NSOperationQueue mainQueue]
                               completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                                   if ([response isKindOfClass:[NSHTTPURLResponse class]]) {
                                       NSHTTPURLResponse * hr = (NSHTTPURLResponse *)response;
                                       CATHeader = hr.allHeaderFields[appDataHeaderKey];
                                   }
                               }];
    }
    if (progress >= 0.8 && progress < 0.83) {
        [reqTimer stopTimer];
        NSInteger statusCode = 200;
        NSString *responseBody = @"{................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................................}";
        switch (rand()%15) {
            case 0: statusCode = 401;
                responseBody = [NSString stringWithFormat:@"{error: 'authentication for %@ failed due to bad credentials'}", [MDSettings email]];
                break;
            case 1: statusCode = 403;
                responseBody = [NSString stringWithFormat:@"{error: 'access to account default deined for user %@'}", [MDSettings userId]];
                break;
            case 2: statusCode = 404;
                responseBody = [NSString stringWithFormat:@"{error: 'resource not found'}"];
                break;
            case 3: statusCode = 501;
                responseBody = [NSString stringWithFormat:@"{error: 'unable to process entity request for account default'}"];
                break;
            case 4: statusCode = 503;
                responseBody = [NSString stringWithFormat:@"{error: 'account default service unavailable'}"];
                break;
            case 5:
                statusCode = 0;
                [NewRelic noticeNetworkFailureForURL:loginUrl
                                          httpMethod:@"GET"
                                           withTimer:reqTimer
                                      andFailureCode:NSURLErrorDNSLookupFailed];
                break;
            case 6:
                statusCode = 0;
                [NewRelic noticeNetworkFailureForURL:loginUrl
                                          httpMethod:@"GET"
                                           withTimer:reqTimer
                                      andFailureCode:NSURLErrorServerCertificateHasUnknownRoot];
                break;
        }
        
        if (statusCode > 0) {
            NSData *respData = [responseBody dataUsingEncoding:NSUTF8StringEncoding];
            
            [NewRelic noticeNetworkRequestForURL:loginUrl
                                      httpMethod:@"GET"
                                       withTimer:reqTimer
                                 responseHeaders:(CATHeader) ? @{appDataHeaderKey: CATHeader} : @{}
                                      statusCode:statusCode
                                       bytesSent:0
                                   bytesReceived:respData.length
                                    responseData:respData
                                       andParams:nil];
        }
    }

    [NSThread sleepForTimeInterval:0.05];

    NR_TRACE_METHOD_STOP;
}

@end
