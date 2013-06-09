//
//  SJOAppAnnieAccountSalesUnits.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@class SJOAppAnnieAccountSalesUnitsApp;
@class SJOAppAnnieAccountSalesUnitsIap;

@interface SJOAppAnnieAccountSalesUnits : NSObject <NSCoding> {
    SJOAppAnnieAccountSalesUnitsApp *app;
    SJOAppAnnieAccountSalesUnitsIap *iap;
}

@property (nonatomic, strong) SJOAppAnnieAccountSalesUnitsApp *app;
@property (nonatomic, strong) SJOAppAnnieAccountSalesUnitsIap *iap;

+ (SJOAppAnnieAccountSalesUnits *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

@end
