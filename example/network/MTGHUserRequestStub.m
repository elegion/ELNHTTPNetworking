//
//  MTGHUserRequestStub.m
//  network
//
//  Created by Sergey Rakov on 12.01.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTGHUserRequestStub.h"
#import "MTGHUser.h"

@implementation MTGHUserRequestStub

+ (BOOL)hasObjectForRequest:(id<ELNHTTPRequest>)request context:(id)context
{
    return YES;
}

- (id)objectForRequest:(id<ELNHTTPRequest>)request context:(id)context
{
    MTGHUser *user = [MTGHUser new];
    user.login = @"StubLogin";
    return user;
//    return @"cdwwdv";
}

- (NSTimeInterval)responseTimeForRequest:(id<ELNHTTPRequest>)request context:(id)context
{
    return 1;
}

@end
