//
//  SJOAppAnnieAccountSalesRevenue.m
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccountSalesRevenue.h"

#import "SJOAppAnnieAccountSalesRevenueApp.h"
#import "SJOAppAnnieAccountSalesRevenueIap.h"

@implementation SJOAppAnnieAccountSalesRevenue

@synthesize ad;
@synthesize app;
@synthesize iap;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.ad forKey:@"ad"];
    [encoder encodeObject:self.app forKey:@"app"];
    [encoder encodeObject:self.iap forKey:@"iap"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.ad = [decoder decodeObjectForKey:@"ad"];
        self.app = [decoder decodeObjectForKey:@"app"];
        self.iap = [decoder decodeObjectForKey:@"iap"];
    }
    return self;
}

+ (SJOAppAnnieAccountSalesRevenue *)instanceFromDictionary:(NSDictionary *)aDictionary {

    SJOAppAnnieAccountSalesRevenue *instance = [[SJOAppAnnieAccountSalesRevenue alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"app"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.app = [SJOAppAnnieAccountSalesRevenueApp instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"iap"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.iap = [SJOAppAnnieAccountSalesRevenueIap instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.ad) {
        [dictionary setObject:self.ad forKey:@"ad"];
    }

    if (self.app) {
        [dictionary setObject:self.app forKey:@"app"];
    }

    if (self.iap) {
        [dictionary setObject:self.iap forKey:@"iap"];
    }

    return dictionary;

}

@end
