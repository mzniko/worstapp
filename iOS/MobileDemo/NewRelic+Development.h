//
//  NewRelic+Development.h
//
//  Copyright (c) 2014 New Relic. All rights reserved.
//

#import <NewRelicAgent/NewRelic.h>


@interface NewRelic(Development)
/*
 Starts the agent and has it report to the given collector url for development purposes.
 */
+ (void) startWithApplicationToken:(NSString*)appToken
               andCollectorAddress:(NSString*)url
          andCrashCollectorAddress:(NSString *)crashCollectorUrl
                           withSSL:(BOOL)useSSL;
// + (BOOL) harvestNow;
// triggers a harvest immidediately. Used for testing.
// returns YES if it's able to execute a harvest request
// returns NO if it's not in the correct harvest state and cannot execute a harvest
+ (BOOL) harvestNow;


+ (void)startAnalyticsReportingWithInsertKey:(NSString *)insertKey
                        andCollectorHostname:(NSString *)insightsCollectorHostname
                                andAccountId:(NSInteger)accountId;


/*********************************/
/**      Custom Attributes      **/
/*********************************/

#pragma mark - figure out a better name that describes what sort of attribute this is?
+ (BOOL)setAttribute:(NSString *)name value:(NSObject *)value;
+ (BOOL)setAttribute:(NSString *)name value:(NSObject *)value persistent:(BOOL)retainAcrossSessions;

+ (BOOL)incrementAttribute:(NSString *)name value:(NSNumber *)value;
+ (BOOL)incrementAttribute:(NSString *)name value:(NSNumber *)value persistent:(BOOL)retainAcrossSessions;

+ (BOOL)removeAttribute:(NSString *)name;

/*************************************/
/**      Well Known Attributes      **/
/*************************************/
+ (BOOL)setUsername:(NSString *)name;
+ (BOOL)setUserEmail:(NSString *)email;
+ (BOOL)setUserId:(NSString *)identifier;
+ (BOOL)setCampaignIdentifier:(NSString *)campaignId;
+ (BOOL)recordPurchase:(NSString *)sku quantity:(NSNumber *)quantity totalPrice:(NSNumber *)revenue;


/*********************************/
/**      Analytics Events       **/
/*********************************/

+ (BOOL)recordEvent:(NSString *)name
     withAttributes:(NSDictionary *)attributes;



@end

