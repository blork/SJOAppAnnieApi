//
//  SJOAppAnnieAccountSalesUnits.m
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccountSalesUnits.h"

#import "SJOAppAnnieAccountSalesUnitsApp.h"
#import "SJOAppAnnieAccountSalesUnitsIap.h"

@implementation SJOAppAnnieAccountSalesUnits

@synthesize app;
@synthesize iap;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.app forKey:@"app"];
    [encoder encodeObject:self.iap forKey:@"iap"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.app = [decoder decodeObjectForKey:@"app"];
        self.iap = [decoder decodeObjectForKey:@"iap"];
    }
    return self;
}

+ (SJOAppAnnieAccountSalesUnits *)instanceFromDictionary:(NSDictionary *)aDictionary {

    SJOAppAnnieAccountSalesUnits *instance = [[SJOAppAnnieAccountSalesUnits alloc] init];
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
            self.app = [SJOAppAnnieAccountSalesUnitsApp instanceFromDictionary:value];
        }

    } else if ([key isEqualToString:@"iap"]) {

        if ([value isKindOfClass:[NSDictionary class]]) {
            self.iap = [SJOAppAnnieAccountSalesUnitsIap instanceFromDictionary:value];
        }

    } else {
        [super setValue:value forKey:key];
    }

}


- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.app) {
        [dictionary setObject:self.app forKey:@"app"];
    }

    if (self.iap) {
        [dictionary setObject:self.iap forKey:@"iap"];
    }

    return dictionary;

}

@end
