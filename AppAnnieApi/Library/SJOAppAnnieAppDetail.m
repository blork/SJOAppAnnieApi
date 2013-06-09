//
//  SJOAppAnnieAppDetail.m
//
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAppDetail.h"
#import "SJOAppAnnieApiClient.h"

@implementation SJOAppAnnieAppDetail

@synthesize appId;
@synthesize appName;
@synthesize currentVersion;
@synthesize descriptionText;
@synthesize icon;
@synthesize lastUpdates;
@synthesize platform;
@synthesize publisher;
@synthesize releaseDate;
@synthesize unpublished;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.appId forKey:@"appId"];
    [encoder encodeObject:self.appName forKey:@"appName"];
    [encoder encodeObject:self.currentVersion forKey:@"currentVersion"];
    [encoder encodeObject:self.descriptionText forKey:@"descriptionText"];
    [encoder encodeObject:self.icon forKey:@"icon"];
    [encoder encodeObject:self.lastUpdates forKey:@"lastUpdates"];
    [encoder encodeObject:self.platform forKey:@"platform"];
    [encoder encodeObject:self.publisher forKey:@"publisher"];
    [encoder encodeObject:self.releaseDate forKey:@"releaseDate"];
    [encoder encodeObject:[NSNumber numberWithBool:self.unpublished] forKey:@"unpublished"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.appId = [decoder decodeObjectForKey:@"appId"];
        self.appName = [decoder decodeObjectForKey:@"appName"];
        self.currentVersion = [decoder decodeObjectForKey:@"currentVersion"];
        self.descriptionText = [decoder decodeObjectForKey:@"descriptionText"];
        self.icon = [decoder decodeObjectForKey:@"icon"];
        self.lastUpdates = [decoder decodeObjectForKey:@"lastUpdates"];
        self.platform = [decoder decodeObjectForKey:@"platform"];
        self.publisher = [decoder decodeObjectForKey:@"publisher"];
        self.releaseDate = [decoder decodeObjectForKey:@"releaseDate"];
        self.unpublished = [(NSNumber *)[decoder decodeObjectForKey:@"unpublished"] boolValue];
    }
    return self;
}

+ (SJOAppAnnieAppDetail *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    SJOAppAnnieAppDetail *instance = [[SJOAppAnnieAppDetail alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;
    
}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {
    
    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    [self setValuesForKeysWithDictionary:aDictionary];
    
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
    if ([key isEqualToString:@"app_id"]) {
        [self setValue:value forKey:@"appId"];
    } else if ([key isEqualToString:@"app_name"]) {
        [self setValue:value forKey:@"appName"];
    } else if ([key isEqualToString:@"current_version"]) {
        [self setValue:value forKey:@"currentVersion"];
    } else if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else if ([key isEqualToString:@"last_updates"]) {
        [self setValue:value forKey:@"lastUpdates"];
    } else if ([key isEqualToString:@"release_date"]) {
        [self setValue:value forKey:@"releaseDate"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}


- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.appId) {
        [dictionary setObject:self.appId forKey:@"appId"];
    }
    
    if (self.appName) {
        [dictionary setObject:self.appName forKey:@"appName"];
    }
    
    if (self.currentVersion) {
        [dictionary setObject:self.currentVersion forKey:@"currentVersion"];
    }
    
    if (self.descriptionText) {
        [dictionary setObject:self.descriptionText forKey:@"descriptionText"];
    }
    
    if (self.icon) {
        [dictionary setObject:self.icon forKey:@"icon"];
    }
    
    if (self.lastUpdates) {
        [dictionary setObject:self.lastUpdates forKey:@"lastUpdates"];
    }
    
    if (self.platform) {
        [dictionary setObject:self.platform forKey:@"platform"];
    }
    
    if (self.publisher) {
        [dictionary setObject:self.publisher forKey:@"publisher"];
    }
    
    if (self.releaseDate) {
        [dictionary setObject:self.releaseDate forKey:@"releaseDate"];
    }
    
    [dictionary setObject:[NSNumber numberWithBool:self.unpublished] forKey:@"unpublished"];
    
    return dictionary;
    
}

-(NSString *)description
{
    return [[self dictionaryRepresentation] description];
}

+ (void) detailForApp:(NSString*) appId
              account: (NSNumber*) accountId
                block:(void (^)(SJOAppAnnieAppDetail *detail, NSError *error))block
{    
    NSString *path = [NSString stringWithFormat:@"/v1/accounts/%@/apps/%@/details", accountId, appId];
    
    [[SJOAppAnnieApiClient sharedClient] getPath:path
                                      parameters:nil
                                         success:^(AFHTTPRequestOperation *operation, NSDictionary* JSON) {
                                             SJOAppAnnieAppDetail* detail = [SJOAppAnnieAppDetail instanceFromDictionary:JSON[@"app"]];
                                             block(detail, nil);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             block(nil, error);
                                         }];
}


@end
