//
//  SJOAppAnnieAccount.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAccount : NSObject <NSCoding> {
    NSNumber *accountId;
    NSString *accountName;
    NSString *accountStatus;
    NSString *firstSalesDate;
    NSString *lastSalesDate;
    NSString *platform;
    NSString *publisherName;
}

@property (nonatomic, copy) NSNumber *accountId;
@property (nonatomic, copy) NSString *accountName;
@property (nonatomic, copy) NSString *accountStatus;
@property (nonatomic, copy) NSString *firstSalesDate;
@property (nonatomic, copy) NSString *lastSalesDate;
@property (nonatomic, copy) NSString *platform;
@property (nonatomic, copy) NSString *publisherName;

+ (SJOAppAnnieAccount *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;
- (NSDictionary *)dictionaryRepresentation;

+ (void) accounts:(NSNumber*) pageIndex
            block:(void (^)(NSArray *accounts, NSNumber* nextPageIndex, NSError *error))block;
@end
