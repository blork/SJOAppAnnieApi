//
//  SJOAppAnnieAccountSalesRevenueApp.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAccountSalesRevenueApp : NSObject <NSCoding> {
    NSString *downloads;
    NSString *promotions;
    NSString *refunds;
    NSString *updates;
}

@property (nonatomic, copy) NSString *downloads;
@property (nonatomic, copy) NSString *promotions;
@property (nonatomic, copy) NSString *refunds;
@property (nonatomic, copy) NSString *updates;

+ (SJOAppAnnieAccountSalesRevenueApp *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
