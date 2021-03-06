//
//  MDSystemVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/5/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDSystemVC.h"
#import "MDUIHelpers.h"

@implementation MDSystemVC

- (void)viewDidLoad
{
    [MDUIHelpers stylizeButtonsInView:self.view];
}


- (IBAction)doneTapped:(id)sender
{
    NR_START_NAMED_INTERACTION(@"Dismiss MDSystemVC");

    switch (rand()%5) {
        case 0: [self handleAction1]; break;
        case 1: [self handleAction2]; break;
        case 2: [self handleAction3]; break;
        case 3: [self handleAction4]; break;
        case 4: [self handleAction5]; break;
    }
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}



- (void)handleAction1
{
    NR_TRACE_METHOD_START(NRTraceTypeViewLoading);
    [NSThread sleepForTimeInterval:0.3];
    if (self.oopsSwitch.on) {
        NSString *exception = self.randomException;
        [[NSException exceptionWithName:exception reason:@"lp on fire" userInfo:nil] raise];
    }
    NR_TRACE_METHOD_STOP;
}

- (void)handleAction2
{
    NR_TRACE_METHOD_START(NRTraceTypeViewLoading);
    [NSThread sleepForTimeInterval:0.3];
    if (self.oopsSwitch.on) {
        NSString *exception = self.randomException;
        [[NSException exceptionWithName:exception reason:@"The devil is in the details" userInfo:nil] raise];
    }
    NR_TRACE_METHOD_STOP;
}
- (void)handleAction3
{
    NR_TRACE_METHOD_START(NRTraceTypeViewLoading);
    [NSThread sleepForTimeInterval:0.3];
    if (self.oopsSwitch.on) {
        NSString *exception = self.randomException;
        [[NSException exceptionWithName:exception reason:@"It can only be attributed to human error" userInfo:nil] raise];
    }
    NR_TRACE_METHOD_STOP;
}
- (void)handleAction4
{
    NR_TRACE_METHOD_START(NRTraceTypeViewLoading);
    [NSThread sleepForTimeInterval:0.3];
    if (self.oopsSwitch.on) {
        NSString *exception = self.randomException;
        [[NSException exceptionWithName:exception reason:@"I don't wish to know that" userInfo:nil] raise];
    }
    NR_TRACE_METHOD_STOP;
}
- (void)handleAction5
{
    NR_TRACE_METHOD_START(NRTraceTypeViewLoading);
    [NSThread sleepForTimeInterval:0.3];
    if (self.oopsSwitch.on) {
        NSString *exception = self.randomException;
        [[NSException exceptionWithName:exception reason:@"It's only your word against mine" userInfo:nil] raise];
    }
    NR_TRACE_METHOD_STOP;
}


- (NSString *)randomException
{
    switch (rand()%5) {
        case 0: return @"PCLoadLetterException";
        case 1: return @"HorribleKeyException";
        case 2: return @"MisplacedEndeavourException";
        case 3: return @"RuntimeHiccoughException";
        case 4: return @"ExceptionalException";
    }

    return @"UnknownKeyException";
}

@end
