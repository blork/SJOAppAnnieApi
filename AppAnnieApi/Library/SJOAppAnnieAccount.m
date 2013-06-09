//
//  SJOAppAnnieAccount.m
//
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "SJOAppAnnieAccount.h"
#import "SJOAppAnnieApiClient.h"

@implementation SJOAppAnnieAccount

@synthesize accountId;
@synthesize accountName;
@synthesize accountStatus;
@synthesize firstSalesDate;
@synthesize lastSalesDate;
@synthesize platform;
@synthesize publisherName;

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.accountId forKey:@"accountId"];
    [encoder encodeObject:self.accountName forKey:@"accountName"];
    [encoder encodeObject:self.accountStatus forKey:@"accountStatus"];
    [encoder encodeObject:self.firstSalesDate forKey:@"firstSalesDate"];
    [encoder encodeObject:self.lastSalesDate forKey:@"lastSalesDate"];
    [encoder encodeObject:self.platform forKey:@"platform"];
    [encoder encodeObject:self.publisherName forKey:@"publisherName"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if ((self = [super init])) {
        self.accountId = [decoder decodeObjectForKey:@"accountId"];
        self.accountName = [decoder decodeObjectForKey:@"accountName"];
        self.accountStatus = [decoder decodeObjectForKey:@"accountStatus"];
        self.firstSalesDate = [decoder decodeObjectForKey:@"firstSalesDate"];
        self.lastSalesDate = [decoder decodeObjectForKey:@"lastSalesDate"];
        self.platform = [decoder decodeObjectForKey:@"platform"];
        self.publisherName = [decoder decodeObjectForKey:@"publisherName"];
    }
    return self;
}

+ (SJOAppAnnieAccount *)instanceFromDictionary:(NSDictionary *)aDictionary {
    
    SJOAppAnnieAccount *instance = [[SJOAppAnnieAccount alloc] init];
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
    
    if ([key isEqualToString:@"account_id"]) {
        [self setValue:value forKey:@"accountId"];
    } else if ([key isEqualToString:@"account_name"]) {
        [self setValue:value forKey:@"accountName"];
    } else if ([key isEqualToString:@"account_status"]) {
        [self setValue:value forKey:@"accountStatus"];
    } else if ([key isEqualToString:@"first_sales_date"]) {
        [self setValue:value forKey:@"firstSalesDate"];
    } else if ([key isEqualToString:@"last_sales_date"]) {
        [self setValue:value forKey:@"lastSalesDate"];
    } else if ([key isEqualToString:@"publisher_name"]) {
        [self setValue:value forKey:@"publisherName"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }
    
}

- (NSDictionary *)dictionaryRepresentation {
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    if (self.accountId) {
        [dictionary setObject:self.accountId forKey:@"accountId"];
    }
    
    if (self.accountName) {
        [dictionary setObject:self.accountName forKey:@"accountName"];
    }
    
    if (self.accountStatus) {
        [dictionary setObject:self.accountStatus forKey:@"accountStatus"];
    }
    
    if (self.firstSalesDate) {
        [dictionary setObject:self.firstSalesDate forKey:@"firstSalesDate"];
    }
    
    if (self.lastSalesDate) {
        [dictionary setObject:self.lastSalesDate forKey:@"lastSalesDate"];
    }
    
    if (self.platform) {
        [dictionary setObject:self.platform forKey:@"platform"];
    }
    
    if (self.publisherName) {
        [dictionary setObject:self.publisherName forKey:@"publisherName"];
    }
    
    return dictionary;
    
}

-(NSString *)description
{
    return [[self dictionaryRepresentation] description];
}

+ (void) accounts:(NSNumber*) pageIndex
                         block:(void (^)(NSArray *accounts, NSNumber* nextPageIndex, NSError *error))block
{
    NSDictionary *parameters = @{@"page_index": pageIndex};
    
    [[SJOAppAnnieApiClient sharedClient] getPath:@"/v1/accounts"
                                      parameters:parameters
                                         success:^(AFHTTPRequestOperation *operation, NSDictionary* JSON) {
                                             NSMutableArray* mutableAccounts = [@[] mutableCopy];
                                             for (NSDictionary* accountDict in JSON[@"account_list"]) {
                                                 [mutableAccounts addObject:[SJOAppAnnieAccount instanceFromDictionary:accountDict]];
                                             }
                                             
                                             NSNumber* nextPage = JSON[@"next_page"];
                                             
                                             block([NSArray arrayWithArray:mutableAccounts], nextPage, nil);
                                         }
                                         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                             block(@[], nil, error);
                                         }];
}



@end
