//
//  MDScrollListVC.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDScrollListVC.h"
#import "MDWordList.h"
#import "MDUIHelpers.h"
#import "NewRelic+Development.h"

@interface MDScrollListVC ()
@property (strong) MDScrollListDataSource *source;
@end

@implementation MDScrollListVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.source = [[MDScrollListDataSource alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [NewRelic recordEvent:@"DemoView" attributes:@{@"name": @"Scrolling Dictionary"}];

    self.tableView.dataSource = self.source;

    [MDUIHelpers stylizeButtonsInView:self.view];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)doneTapped:(id)sender
{
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end



@implementation MDScrollListDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[MDWordList sharedInstance] itemCount];
    }

    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"scrolllistcell"];
    if (! cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"scrolllistcell"];
    }

    cell.textLabel.text = [[MDWordList sharedInstance] itemNameForRow:indexPath.row];

    return cell;
}



@end
