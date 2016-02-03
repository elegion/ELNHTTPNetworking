//
//  MTGHUserRequest.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTGHUser.h"
#import "MTGHUserRequest.h"

@implementation MTGHUserRequest

#pragma mark - ELNHTTPRequest

- (NSString *)HTTPMethod
{
    return @"GET";
}

- (NSString *)path
{
    return @"user";
}

- (Class)responseClass
{
    return [MTGHUser class];
}

@end
