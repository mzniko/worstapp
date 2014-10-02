//
//  MDInfoVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/1/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDInfoVC.h"
#import "MDSettings.h"
#import "NRMADemoTools.h"

extern NSString *__NRMA__customAppVersionString;

@interface MDInfoVC ()

@end

@implementation MDInfoVC

- (IBAction)doneTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    self.appTokenField.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self updateAppInfo];
    self.needsRestart = NO;
}

- (void)viewWillDisappear:(BOOL)animated
{
    [MDSettings applySettings];

    if (self.needsRestart) {
        [[[UIAlertView alloc] initWithTitle:@"Restart!"
                                   message:@"To ensure these changes take full effect:\nClose the app, force quit it, and re-launch."
                                  delegate:nil
                         cancelButtonTitle:@"KTHX"
                         otherButtonTitles:nil] show];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)changeVersionTapped:(id)sender
{
    [MDSettings incrementAppVersion];

    [self updateAppInfo];
}

- (IBAction)environmentSelectionChanged:(id)sender
{
    [MDSettings setUseProductionCollector:self.environmentSelector.selectedSegmentIndex == 0];
    [self updateAppInfo];
    self.needsRestart = YES;
}
- (IBAction)appTokenChanged:(id)sender
{
    NSString *newToken = self.appTokenField.text;
    if (newToken.length == 42 && [newToken hasPrefix:@"AA"]) {
        [MDSettings setAppToken:newToken];
        [self updateAppInfo];
        self.needsRestart = YES;
    }
}
- (IBAction)appTokenKeyPress:(id)sender
{
    NSLog(@"%@", [sender description]);
}
-(IBAction)dismissKeyboard:(id)sender
{
    [self.view endEditing:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];

    return NO;
}

- (void)updateAppInfo
{
    self.appInfo.text = [NSString stringWithFormat:@"Version\t%@\nOS\t\t%@\nModel\t%@\nCarrier\t%@\nUDID\t%@",
                         __NRMA__customAppVersionString,
                         [NewRelicInternalUtils osVersion],
                         [NewRelicInternalUtils deviceModel],
                         [NewRelicInternalUtils carrierName],
                         [NewRelicInternalUtils deviceId]];

    // collector selection
    [self.environmentSelector setSelectedSegmentIndex:([MDSettings useProductionCollector]) ? 0 : 1];
    
    self.appTokenField.text = [MDSettings appToken];

}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
