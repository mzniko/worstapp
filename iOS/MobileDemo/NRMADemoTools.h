//
//  NRMADemoTools.h
//  NewRelicAgent
//
//  Created by Jonathan Karon on 9/4/14.
//  Copyright (c) 2014 New Relic. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <objc/runtime.h>

typedef enum {
	NotReachable = 0,
	ReachableViaWiFi,
	ReachableViaWWAN
} NRMANetworkStatus;


@interface NewRelicInternalUtils : NSObject
+ (BOOL) isWebViewThread;
+ (NSString*) carrierName;
+ (NRMANetworkStatus) networkStatus;
+ (NSString *)deviceModel;
+ (NSString *)agentVersion;
+ (NSString *)deviceId;
@end

@interface NRMAAgentConfiguration : NSObject
+ (void)setApplicationVersion:(NSString *)versionString;
@end

@interface NRMAHarvester : NSObject
- (void) clearStoredHarvesterConfiguration;
- (void) transition:(int)state;
- (void) execute;
@end

@interface NRMAHarvestController : NSObject

+ (NRMAHarvestController*) harvestController;
- (NRMAHarvester *)harvester;
@end

void* NRMASwapImplementations(Class c, SEL selector, IMP newImplementation);
void NRMASwapOrReplaceClassMethod(Class c, SEL originalSelector, SEL newSelector);
void* NRMAReplaceInstanceMethod(Class class, SEL selector, IMP newImplementation);
void* NRMAReplaceClassMethod(Class class, SEL selector, IMP newImplementation);
void NRMASwapOrReplaceInstanceMethod(Class c, SEL originalSelector, SEL newSelector);
BOOL NRMASwizzleOrAddMethod(id self, SEL origSelector, SEL newSelector, IMP theImplementation);



@interface NRMADemoTools : NSObject

+ (void)setApplicationVersion:(NSString *)version;
+ (IMP)setCarrierName:(NSString *)carrier;
+ (IMP)setNetworkStatus:(NRMANetworkStatus)status;
+ (IMP)setDeviceModel:(NSString *)model;
+ (IMP)setAgentVersion:(NSString *)version;
+ (IMP)setDeviceId:(NSString *)uuid;

+ (void)forceReconnect;

+ (void)unsetCarrierName:(IMP)originalImp;
+ (void)unsetNetworkStatus:(IMP)originalImp;
+ (void)unsetDeviceModel:(IMP)originalImp;
+ (void)unsetAgentVersion:(IMP)originalImp;
+ (void)unsetDeviceId:(IMP)originalImp;

@end
