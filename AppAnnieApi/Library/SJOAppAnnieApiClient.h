//
//  SJOAppAnnieApiClient.h
//  AppAnnieApi
//
//  Created by Sam Oakley on 09/06/2013.
//  Copyright (c) 2013 Sam Oakley. All rights reserved.
//

#import "AFHTTPClient.h"

@interface SJOAppAnnieApiClient : AFHTTPClient

+ (SJOAppAnnieApiClient *)sharedClient;
- (void)setUsername:(NSString *)username andPassword:(NSString *)password;

@end
