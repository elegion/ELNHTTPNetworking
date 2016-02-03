//
//  GHAccessConfirmationRequest.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTAccessConfirmationRequest.h"
#import "MTAccessConfirmationResponse.h"

static NSString * const kMTGithubOAuthConfirmationURL = @"https://github.com/login/oauth";

static NSString * const kMTGithubClientId = @"061be8459ab721539733";
static NSString * const kMTGithubClientSecret = @"7dea9dd64c0cec21351bbc3e2be7abfe05d7899c";

@implementation MTAccessConfirmationRequest

- (NSString *)HTTPMethod
{
    return @"POST";
}

- (NSString *)path
{
    return @"access_token";
}

- (NSDictionary *)parameters
{
    return @{@"code" : self.temporaryCode,
             @"client_id" : kMTGithubClientId,
             @"client_secret" : kMTGithubClientSecret,
             @"state" : self.clientState};
}

- (Class)responseClass
{
    return [MTAccessConfirmationResponse class];
}

- (NSString *)baseURL
{
    return kMTGithubOAuthConfirmationURL;
}

@end
