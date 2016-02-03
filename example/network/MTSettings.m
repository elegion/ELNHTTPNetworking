//
//  MTSettings.m
//  network
//
//  Created by Sergey Rakov on 05.01.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <UICKeyChainStore.h>
#import "MTSettings.h"

static NSString *const MTGithubApiTokenKey = @"MTGithubApiTokenKey";

@implementation MTSettings

#pragma mark - Shared Instance

+ (instancetype)sharedInstance
{
    static id instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });
    return instance;
}

#pragma mark - Public

- (NSString *)githubApiToken
{
    return [[UICKeyChainStore keyChainStore] stringForKey:MTGithubApiTokenKey];
}

- (void)setGithubApiToken:(NSString *)githubApiToken
{
    [[UICKeyChainStore keyChainStore] setString:githubApiToken forKey:MTGithubApiTokenKey];
}

@end
