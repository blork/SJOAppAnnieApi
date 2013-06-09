//
//  SJOAppAnnieAccountSales.m
//
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccountSales.h"

#import "SJOAppAnnieAccountSalesRevenue.h"
#import "SJOAppAnnieAccountSalesUnits.h"

#import "SJOAppAnnieApiClient.h"

@interface SJOAppAnnieAccountSales()

+ (NSString*)breakdownTypeToString:(SJOAppAnnieBreakdownType)type;
+ (NSDateFormatter*) dateFormatter;

@end

@implementation SJOAppAnnieAccountSales

@synthesize app;
@synthesize country;
@synthesize date;
@synthesize revenue;
@synthesize units;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.app forKey:@"app"];
    [encoder encodeObject:self.country forKey:@"country"];
    [encoder encodeObject:self.date forKey:@"date"];
    [encoder encodeObject:self.revenue forKey:@"revenue"];
    [encoder encodeObject:self.units forKey:@"units"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.app = [decoder decodeObjectForKey:@"app"];
        self.country = [decoder decodeObjectForKey:@"country"];
        self.date = [decoder decodeObjectForKey:@"date"];
        self.revenue = [decoder decodeObjectForKey:@"revenue"];
        self.units = [decoder decodeObjectForKey:@"units"];
    }
    return self;
}

+ (SJOAppAnnieAccountSales *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    SJOAppAnnieAccountSales *instance = [[SJOAppAnnieAccountSales alloc] init];
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
    
    if ([key isEqualToString:@"revenue"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.revenue = [SJOAppAnnieAccountSalesRevenue instanceFromDictionary:value];
        }
        
    } else if ([key isEqualToString:@"units"]) {
        
        if ([value isKindOfClass:[NSDictionary class]]) {
            self.units = [SJOAppAnnieAccountSalesUnits instanceFromDictionary:value];
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
    
    if (self.country) {
        [dictionary setObject:self.country forKey:@"country"];
    }
    
    if (self.date) {
        [dictionary setObject:self.date forKey:@"date"];
    }
    
    if (self.revenue) {
        [dictionary setObject:self.revenue forKey:@"revenue"];
    }
    
    if (self.units) {
        [dictionary setObject:self.units forKey:@"units"];
    }
    
    return dictionary;
    
}

-(NSString *)description
{
    return [[self dictionaryRepresentation] description];
}

+ (NSString*)breakdownTypeToString:(SJOAppAnnieBreakdownType)type {
    NSString *result = nil;
    
    switch(type) {
        case SJOAppAnnieBreakdownAppDefault:
            result = nil;
            break;
        case SJOAppAnnieBreakdownApp:
            result = @"application";
            break;
        case SJOAppAnnieBreakdownCountry:
            result = @"country";
            break;
        case SJOAppAnnieBreakdownDate:
            result = @"date";
            break;
        case SJOAppAnnieBreakdownAppDate:
            result = @"application+date";
            break;
        case SJOAppAnnieBreakdownAppCountry:
            result = @"application+country";
            break;
        case SJOAppAnnieBreakdownAppCountryDate:
            result = @"application+country+date";
            break;
        default:
            [NSException raise:NSGenericException format:@"Unexpected BreakdownType."];
    }
    
    return result;
}

+ (NSDateFormatter*) dateFormatter
{
    static dispatch_once_t onceMark;
    static NSDateFormatter *formatter = nil;
    dispatch_once(&onceMark, ^{
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd"];
    });
    return formatter;
}

+ (void) salesForAccount: (NSNumber*) accountId
               breakdown: (SJOAppAnnieBreakdownType) breakdownType
               startDate: (NSDate*) startDate
                 endDate: (NSDate*) endDate
                currency: (NSString*) currency
               countries: (NSArray*) countries
               pageIndex:(NSNumber*) pageIndex
                   block:(void (^)(NSArray *sales, NSError *error))block
{

    NSMutableDictionary *mutableParameters = [@{} mutableCopy];
    
    if (breakdownType) {
        [mutableParameters setObject:[SJOAppAnnieAccountSales breakdownTypeToString:breakdownType] forKey:@"break_down"];
    }
    
    if (startDate) {
        [mutableParameters setObject:[[SJOAppAnnieAccountSales dateFormatter] stringFromDate:startDate] forKey:@"start_date"];
    }
    
    if (endDate) {
        [mutableParameters setObject:[[SJOAppAnnieAccountSales dateFormatter] stringFromDate:endDate] forKey:@"end_date"];
    }
    
    if (currency) {
        [mutableParameters setObject:currency forKey:@"currency"];
    }
    
    if (countries) {
        NSString *countriesString = [countries componentsJoinedByString:@"+"];
        [mutableParameters setObject:countriesString forKey:@"countries"];
    }
    
    if (pageIndex) {
        [mutableParameters setObject:pageIndex forKey:@"page_index"];
    }
    
    
    NSDictionary *parameters = [NSDictionary dictionaryWithDictionary:mutableParameters];
    
    NSString *path = [NSString stringWithFormat:@"/v1/accounts/%@/sales", accountId];
    
    [[SJOAppAnnieApiClient sharedClient] getPath:path
                                      parameters:parameters
                                         success:^(AFHTTPRequestOperation *operation, NSDictionary* JSON) {
                                             NSMutableArray* mutableSales = [@[] mutableCopy];
                                             for (NSDictionary* salesDict in JSON[@"sales_list"]) {
                                                 [mutableSales addObject:[SJOAppAnnieAccountSales instanceFromDictionary:salesDict]];
                                             }
                                             
                                             block([NSArray arrayWithArray:mutableSales], nil);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             block(@[], error);
                                         }];
}

@end
