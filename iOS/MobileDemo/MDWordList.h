//
//  MDItemList.h
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDWordList : NSObject

+ (MDWordList *)sharedInstance;

- (NSInteger) itemCount;
- (NSString *) itemNameForRow:(NSUInteger)row;

@end
