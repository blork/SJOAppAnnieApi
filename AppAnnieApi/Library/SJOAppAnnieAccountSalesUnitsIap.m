//
//  SJOAppAnnieAccountSalesUnitsIap.m
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccountSalesUnitsIap.h"

@implementation SJOAppAnnieAccountSalesUnitsIap

@synthesize promotions;
@synthesize refunds;
@synthesize sales;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.promotions forKey:@"promotions"];
    [encoder encodeObject:self.refunds forKey:@"refunds"];
    [encoder encodeObject:self.sales forKey:@"sales"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.promotions = [decoder decodeObjectForKey:@"promotions"];
        self.refunds = [decoder decodeObjectForKey:@"refunds"];
        self.sales = [decoder decodeObjectForKey:@"sales"];
    }
    return self;
}

+ (SJOAppAnnieAccountSalesUnitsIap *)instanceFromDictionary:(NSDictionary *)aDictionary {

    SJOAppAnnieAccountSalesUnitsIap *instance = [[SJOAppAnnieAccountSalesUnitsIap alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (NSDictionary *)dictionaryRepresentation {

    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];

    if (self.promotions) {
        [dictionary setObject:self.promotions forKey:@"promotions"];
    }

    if (self.refunds) {
        [dictionary setObject:self.refunds forKey:@"refunds"];
    }

    if (self.sales) {
        [dictionary setObject:self.sales forKey:@"sales"];
    }

    return dictionary;

}

@end
