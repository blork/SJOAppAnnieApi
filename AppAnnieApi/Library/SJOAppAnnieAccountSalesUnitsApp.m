//
//  SJOAppAnnieAccountSalesUnitsApp.m
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccountSalesUnitsApp.h"

@implementation SJOAppAnnieAccountSalesUnitsApp

@synthesize downloads;
@synthesize promotions;
@synthesize refunds;
@synthesize updates;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.downloads forKey:@"downloads"];
    [encoder encodeObject:self.promotions forKey:@"promotions"];
    [encoder encodeObject:self.refunds forKey:@"refunds"];
    [encoder encodeObject:self.updates forKey:@"updates"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.downloads = [decoder decodeObjectForKey:@"downloads"];
        self.promotions = [decoder decodeObjectForKey:@"promotions"];
        self.refunds = [decoder decodeObjectForKey:@"refunds"];
        self.updates = [decoder decodeObjectForKey:@"updates"];
    }
    return self;
}

+ (SJOAppAnnieAccountSalesUnitsApp *)instanceFromDictionary:(NSDictionary *)aDictionary {

    SJOAppAnnieAccountSalesUnitsApp *instance = [[SJOAppAnnieAccountSalesUnitsApp alloc] init];
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

    if (self.downloads) {
        [dictionary setObject:self.downloads forKey:@"downloads"];
    }

    if (self.promotions) {
        [dictionary setObject:self.promotions forKey:@"promotions"];
    }

    if (self.refunds) {
        [dictionary setObject:self.refunds forKey:@"refunds"];
    }

    if (self.updates) {
        [dictionary setObject:self.updates forKey:@"updates"];
    }

    return dictionary;

}

@end
