//
//  SJOAppAnnieApiClient.m
//  AppAnnieApi
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "SJOAppAnnieApiClient.h"
#import "AFJSONRequestOperation.h"

static NSString * const kSJOAppAnnieApiBaseURLString = @"https://api.appannie.com/";

@implementation SJOAppAnnieApiClient

+ (SJOAppAnnieApiClient *)sharedClient {
    static SJOAppAnnieApiClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[SJOAppAnnieApiClient alloc] initWithBaseURL:[NSURL URLWithString:kSJOAppAnnieApiBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}

- (void)setUsername:(NSString *)username andPassword:(NSString *)password;
{
    [self clearAuthorizationHeader];
    [self setAuthorizationHeaderWithUsername:username password:password];
}

@end
