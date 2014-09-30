//
//  MDActionTableDataSource.h
//  MobileDemo
//
//  Created by Jonathan Karon on 9/30/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDActionTableDataSource : NSObject <UITableViewDataSource>

- (NSString *)labelForActionAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)classNameForActionAtIndexPath:(NSIndexPath *)indexPath;

@end
