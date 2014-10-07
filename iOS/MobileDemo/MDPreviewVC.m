//
//  MDPreviewVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/3/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDPreviewVC.h"
#import "MDUIHelpers.h"

@interface MDPreviewVC ()

@end

@implementation MDPreviewVC

- (id)initWithTarget:(NSString *)target
{
    self = [self initWithNibName:@"MDPreviewVC" bundle:nil];
    if (self) {
        self.targetName = target;
    }
    return self;
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
    // Do any additional setup after loading the view from its nib.

    NSString *filename = [[NSBundle mainBundle] pathForResource:self.targetName ofType:@"txt"];

    NSError *err = nil;
    NSString *content = [NSString stringWithContentsOfFile:filename encoding:NSUTF8StringEncoding error:&err];
    if (err) {
        [[NSException exceptionWithName:@"FileNotFound"
                                 reason:[NSString stringWithFormat:@"Cannot load file %@", filename]
                               userInfo:nil] raise];
    }

    self.contentView.text = content;

    [MDUIHelpers stylizeButtonsInView:self.view];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)continueTapped:(id)sender
{
    UIViewController *vc = [[NSClassFromString(self.targetName) alloc] init];
    if (vc) {
        [self presentViewController:vc animated:YES completion:nil];
    }
    else {
        [[NSException exceptionWithName:@"ClassNotFound"
                                 reason:[NSString stringWithFormat:@"Cannot instantiate class %@", self.targetName]
                               userInfo:nil] raise];

    }
}

- (IBAction)cancelTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
