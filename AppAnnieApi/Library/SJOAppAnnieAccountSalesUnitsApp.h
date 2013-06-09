//
//  SJOAppAnnieAccountSalesUnitsApp.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAccountSalesUnitsApp : NSObject <NSCoding> {
    NSNumber *downloads;
    NSNumber *promotions;
    NSNumber *refunds;
    NSNumber *updates;
}

@property (nonatomic, copy) NSNumber *downloads;
@property (nonatomic, copy) NSNumber *promotions;
@property (nonatomic, copy) NSNumber *refunds;
@property (nonatomic, copy) NSNumber *updates;

+ (SJOAppAnnieAccountSalesUnitsApp *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
