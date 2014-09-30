//
//  MDActionTableDataSource.m
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDActionTableDataSource.h"

@interface MDActionTableDataSource()
@property (strong) NSArray *actionItems;
@end

@implementation MDActionTableDataSource

@synthesize actionItems;

- (id)init
{
    self = [super init];
    if (self)
    {
        self.actionItems = @[@[@"Things to see and do...", @""],
                             @[@"Image Gallery", @"MDImageGalleryVC"],
                             @[@"Login Flow", @"MDLoginFlowVC"],
                             @[@"Table View", @"MDTableViewVC"],
                             @[@"Share Photos", @"MDSharePhotosVC"]
                             ];
    }
    return self;
}

- (NSString *)labelForActionAtIndexPath:(NSIndexPath *)indexPath
{
    return self.actionItems[indexPath.row][0];
}

- (NSString *)classNameForActionAtIndexPath:(NSIndexPath *)indexPath
{
    return self.actionItems[indexPath.row][1];
}


- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.actionItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MDActionTableDataSource"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MDActionTableDataSource"];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor clearColor];
    }

    switch (indexPath.row % 2) {
        case 0: cell.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3]; break;
        case 1: cell.backgroundColor = [UIColor colorWithWhite:0.8 alpha:0.3]; break;
    }
    cell.textLabel.text = [self labelForActionAtIndexPath:indexPath];

    return cell;
}

@end
