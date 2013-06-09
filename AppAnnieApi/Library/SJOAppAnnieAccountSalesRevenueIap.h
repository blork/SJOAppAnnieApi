//
//  SJOAppAnnieAccountSalesRevenueIap.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAccountSalesRevenueIap : NSObject <NSCoding> {
    NSString *promotions;
    NSString *refunds;
    NSString *sales;
}

@property (nonatomic, copy) NSString *promotions;
@property (nonatomic, copy) NSString *refunds;
@property (nonatomic, copy) NSString *sales;

+ (SJOAppAnnieAccountSalesRevenueIap *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
