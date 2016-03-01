//
//  MTHTTPClient.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <AFNetworking.h>
#import "ELNHTTPRequest.h"
#import "MTHTTPClient.h"
#import "MTSettings.h"
#import "MTHTTPClientConfiguration.h"

@implementation MTHTTPClient

#pragma mark - Shared Instance

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] initWithConfiguration:[MTHTTPClientConfiguration new]];
    });
    return instance;
}

#pragma mark - Public

- (void)setGHAPIToken:(NSString *)GHAPIToken
{
    _GHAPIToken = [GHAPIToken copy];
    [self.sessionManager.requestSerializer setValue:[NSString stringWithFormat:@"token %@", GHAPIToken] forHTTPHeaderField:@"Authorization"];
}

@end
