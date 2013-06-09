//
//  SJOAppAnnieAccountSales.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJOAppAnnieAccountSalesRevenue;
@class SJOAppAnnieAccountSalesUnits;

typedef enum {
    SJOAppAnnieBreakdownAppDefault,
    SJOAppAnnieBreakdownApp,
    SJOAppAnnieBreakdownCountry,
    SJOAppAnnieBreakdownDate,
    SJOAppAnnieBreakdownAppDate,
    SJOAppAnnieBreakdownAppCountry,
    SJOAppAnnieBreakdownAppCountryDate
} SJOAppAnnieBreakdownType;


@interface SJOAppAnnieAccountSales : NSObject <NSCoding> {
    NSString *app;
    NSString *country;
    NSString *date;
    SJOAppAnnieAccountSalesRevenue *revenue;
    SJOAppAnnieAccountSalesUnits *units;
}

@property (nonatomic, copy) NSString *app;
@property (nonatomic, copy) NSString *country;
@property (nonatomic, copy) NSString *date;
@property (nonatomic, strong) SJOAppAnnieAccountSalesRevenue *revenue;
@property (nonatomic, strong) SJOAppAnnieAccountSalesUnits *units;

+ (SJOAppAnnieAccountSales *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

+ (void) salesForAccount: (NSNumber*) accountId
               breakdown: (SJOAppAnnieBreakdownType) breakdownType
               startDate: (NSDate*) startDate
                 endDate: (NSDate*) endDate
                currency: (NSString*) currency
               countries: (NSArray*) countries
               pageIndex:(NSNumber*) pageIndex
                   block:(void (^)(NSArray *sales, NSError *error))block;

@end
