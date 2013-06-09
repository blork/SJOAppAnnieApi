//
//  SJOAppAnnieAccountSalesUnitsIap.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAccountSalesUnitsIap : NSObject <NSCoding> {
    NSNumber *promotions;
    NSNumber *refunds;
    NSNumber *sales;
}

@property (nonatomic, copy) NSNumber *promotions;
@property (nonatomic, copy) NSNumber *refunds;
@property (nonatomic, copy) NSNumber *sales;

+ (SJOAppAnnieAccountSalesUnitsIap *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
