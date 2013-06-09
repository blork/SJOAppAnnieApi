//
//  SJOAppAnnieAppDetail.h
//  
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SJOAppAnnieAppDetail : NSObject <NSCoding> {
    NSString *appId;
    NSString *appName;
    NSString *currentVersion;
    NSString *descriptionText;
    NSString *icon;
    NSString *lastUpdates;
    NSString *platform;
    NSString *publisher;
    NSString *releaseDate;
    BOOL unpublished;
}

@property (nonatomic, copy) NSString *appId;
@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *currentVersion;
@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *icon;
@property (nonatomic, copy) NSString *lastUpdates;
@property (nonatomic, copy) NSString *platform;
@property (nonatomic, copy) NSString *publisher;
@property (nonatomic, copy) NSString *releaseDate;
@property (nonatomic, assign) BOOL unpublished;

+ (SJOAppAnnieAppDetail *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

- (NSDictionary *)dictionaryRepresentation;

+ (void) detailForApp:(NSString*) appId
              account: (NSNumber*) accountId
                block:(void (^)(SJOAppAnnieAppDetail *detail, NSError *error))block;

@end
