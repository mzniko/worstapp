//
//  NRMADemoTools.m
//  NewRelicAgent
//
//  Created by Jonathan Karon on 9/4/14.
//  Copyright (c) 2014 New Relic. All rights reserved.
//

#import "NRMADemoTools.h"

NSString *__NRMA_FAKE_OS = @"1.0";
NSString *__NRMA_FAKE_OS_imp() {
    return [__NRMA_FAKE_OS copy];
}
NSString *__NRMA_FAKE_MODEL = @"iPhone1,1";
NSString *__NRMA_FAKE_MODEL_imp() {
    return [__NRMA_FAKE_MODEL copy];
}


@implementation NRMADemoTools

+ (void)setApplicationVersion:(NSString *)version
{
    [NRMAAgentConfiguration setApplicationVersion:version];
}
+ (void)setCollectorHost:(NSString *)host
{
    [[NewRelicAgentInternal sharedInstance] agentConfiguration].collectorHost = host;
}
+ (void)setApplicationToken:(NSString *)token
{
    [[NewRelicAgentInternal sharedInstance] agentConfiguration].applicationToken = token;
}

+ (IMP)setCarrierName:(NSString *)carrier
{
    __block NSString *value = [carrier copy];

    return (IMP) NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(carrierName),
                           imp_implementationWithBlock(^{ return value; }));
}

+ (IMP)setNetworkStatus:(NRMANetworkStatus)status
{
    return (IMP) NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(networkStatus),
                           imp_implementationWithBlock(^{ return status; }));
}

+ (IMP)setDeviceModel:(NSString *)model
{
    __NRMA_FAKE_MODEL = [model copy];

    return (IMP) NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(deviceModel),
                           (IMP)__NRMA_FAKE_MODEL_imp);

}

+ (IMP)setAgentVersion:(NSString *)version
{
    __block NSString *value = [version copy];

    return (IMP) NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(agentVersion),
                           imp_implementationWithBlock(^{ return value; }));

}

+ (IMP)setDeviceId:(NSString *)uuid
{
    __block NSString *value = [uuid copy];

    return (IMP) NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(deviceId),
                           imp_implementationWithBlock(^{ return value; }));

}

+ (IMP)setOsVersion:(NSString *)version
{
    __NRMA_FAKE_OS = [version copy];

    return (IMP) NRMAReplaceInstanceMethod([UIDevice class], @selector(systemVersion), (IMP)__NRMA_FAKE_OS_imp);
}



+ (void)unsetCarrierName:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(carrierName),
                           originalImp);
}

+ (void)unsetNetworkStatus:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(networkStatus),
                           originalImp);
}

+ (void)unsetDeviceModel:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(deviceModel),
                           originalImp);

}

+ (void)unsetAgentVersion:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(agentVersion),
                           originalImp);

}

+ (void)unsetDeviceId:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(deviceId),
                           originalImp);
    
}

+ (void)unsetOsVersion:(IMP)originalImp
{
    NRMAReplaceClassMethod([NewRelicInternalUtils class],
                           @selector(osVersion),
                           originalImp);

}

+ (void)forceReconnect
{
    [[NRMAHarvestController harvestController].harvester clearStoredHarvesterConfiguration];
    [[NRMAHarvestController harvestController].harvester transition:2];
    [[NRMAHarvestController harvestController].harvester execute];
}

@end
