//
//  MDCrashGameVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/3/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDCrashGameVC.h"
#import "MDUIHelpers.h"
#import "NewRelic+Development.h"

@interface MDCrashGameVC () {
    NSInteger lastTappedNumber;
    NSTimeInterval gameStartedAt;
    BOOL running;
    NSTimeInterval gameSpeed;
}

@property (strong) NSTimer *timer;
@end

@implementation MDCrashGameVC

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

    [NewRelic recordEvent:@"DemoView" attributes:@{@"name": @"Crashing Game"}];

    // Do any additional setup after loading the view from its nib.

    [MDUIHelpers stylizeButtonsInView:self.view];

}

- (void)viewDidAppear:(BOOL)animated
{
    running = YES;
    lastTappedNumber = 0;
    gameStartedAt = [NSDate timeIntervalSinceReferenceDate];
    gameSpeed = 1.0;

    for (NSUInteger i=0; i < self.buttonSet.count; i++) {
        ((UIButton *)self.buttonSet[i]).hidden = NO;
    }

    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateGame) userInfo:nil repeats:YES];

    [self moveButtons];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self.timer invalidate];
    self.timer = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateGame
{
    NSTimeInterval t = [NSDate timeIntervalSinceReferenceDate] - gameStartedAt;

    self.counter.text = [NSString stringWithFormat:@"%d points | %2.0lf seconds", (int)lastTappedNumber, t];
}

- (void)moveButtons
{
    if (! running) return;

    [UIView animateWithDuration:gameSpeed
                          delay:0
                        options:(UIViewAnimationCurveEaseInOut|UIViewAnimationOptionAllowUserInteraction)
                     animations:^{
                         NSUInteger count = self.buttonSet.count;
                         NSUInteger offset = rand() % count;

                         CGPoint *centers = malloc(count * sizeof(CGPoint));

                         for (NSUInteger i=0; i < count; i++) {
                             centers[i] = ((UIButton *)self.buttonSet[(i+offset)%count]).center;
                         }

                         for (NSUInteger i=0; i < count; i++) {
                             ((UIButton *)self.buttonSet[i]).center = centers[i];
                         }
                     }
                     completion:^(BOOL finished){
                         if (running) {
                             [self performSelector:@selector(moveButtons) withObject:nil afterDelay:gameSpeed];
                         }
                     }];
}

- (IBAction)buttonTapped:(id)sender
{
    if ([sender isKindOfClass:[UIButton class]]) {
        UIButton *b = sender;
        NSInteger i = [b.titleLabel.text integerValue];
        if (i == lastTappedNumber + 1) {
            [self handleTappedNumber:i];
            b.hidden = YES;
            
            [NewRelic recordEvent:@"GamePlay" attributes:@{@"tappedNumber": [NSNumber numberWithLong:i],
                                                           @"gameTime": [NSNumber numberWithDouble:[NSDate timeIntervalSinceReferenceDate] - gameStartedAt],
                                                           @"point": @1,
                                                           @"lastTappedNumber": [NSNumber numberWithLong:lastTappedNumber]
                                                           }];
        }
        else {
            // TODO complain...
            gameSpeed = gameSpeed * 0.9;
            [NewRelic recordEvent:@"GamePlay" attributes:@{@"tappedNumber": [NSNumber numberWithLong:i],
                                                           @"gameTime": [NSNumber numberWithDouble:[NSDate timeIntervalSinceReferenceDate] - gameStartedAt],
                                                           @"point": @0,
                                                           @"lastTappedNumber": [NSNumber numberWithLong:lastTappedNumber]
                                                           }];
        }
    }
}

- (IBAction)doneTapped:(id)sender
{
    running = NO;
    [self.timer invalidate];
    self.timer = nil;

    [NewRelic recordEvent:@"GamePlay" attributes:@{@"gaveUp": @1,
                                                   @"gameTime": [NSNumber numberWithDouble:[NSDate timeIntervalSinceReferenceDate] - gameStartedAt],
                                                   @"lastTappedNumber": [NSNumber numberWithLong:lastTappedNumber]
                                                   }];

    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


- (void)handleTappedNumber:(NSInteger)i
{
    lastTappedNumber = i;

    if (i == 8) {
        [[NSException exceptionWithName:@"IllegalArgumentException" reason:[NSString stringWithFormat:@"Resource not found loading audio for buttonCode %d", (int)i] userInfo:nil] raise];
    }
}

@end
