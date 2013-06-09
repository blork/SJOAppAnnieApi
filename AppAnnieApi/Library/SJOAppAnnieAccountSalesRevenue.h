//
//  SJOAppAnnieAccountSalesRevenue.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJOAppAnnieAccountSalesRevenueApp;
@class SJOAppAnnieAccountSalesRevenueIap;

@interface SJOAppAnnieAccountSalesRevenue : NSObject <NSCoding> {
    NSString *ad;
    SJOAppAnnieAccountSalesRevenueApp *app;
    SJOAppAnnieAccountSalesRevenueIap *iap;
}

@property (nonatomic, copy) NSString *ad;
@property (nonatomic, strong) SJOAppAnnieAccountSalesRevenueApp *app;
@property (nonatomic, strong) SJOAppAnnieAccountSalesRevenueIap *iap;

+ (SJOAppAnnieAccountSalesRevenue *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
