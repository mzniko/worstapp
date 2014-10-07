//
//  MDItemList.m
//  MobileDemo
//
//  Created by Jonathan Karon on 10/6/14.
//  Copyright (c) 2014 newrelic. All rights reserved.
//

#import "MDWordList.h"

@interface MDWordList()

@end

@implementation MDWordList

+ (MDWordList *)sharedInstance
{
    static MDWordList *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[MDWordList alloc] init];
    });
    return instance;
}


- (NSArray *)items
{
    NR_TRACE_METHOD_START(NRTraceTypeDatabase);

    NSError *error = nil;
    NSArray *loaded = [[NSString stringWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"words" ofType:@"txt"]
                                                 encoding:NSASCIIStringEncoding
                                                    error:&error] componentsSeparatedByString:@"\n"];

    NR_TRACE_METHOD_STOP;

    if (loaded) {
        return loaded;
    }

    NRLOG_ERROR(@"Failed to load words list.\n%@", error.description);
    return @[];
}

- (NSInteger) itemCount
{
    NR_TRACE_METHOD_START(NRTraceTypeNone);
    NSUInteger count = self.items.count;
    NR_TRACE_METHOD_STOP;
    return count;
}

- (NSString *) itemNameForRow:(NSUInteger)row
{
    NR_TRACE_METHOD_START(NRTraceTypeNone);
    NSString *itemName = self.items[row];
    NR_TRACE_METHOD_STOP;
    return itemName;
}


@end
