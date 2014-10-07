//
//  MDScrollListVC.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MDScrollListDataSource : NSObject <UITableViewDataSource>

@end

@interface MDScrollListVC : UIViewController

@property (nonatomic, strong) IBOutlet UITableView *tableView;

- (IBAction)doneTapped:(id)sender;


@end
