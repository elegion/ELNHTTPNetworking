//
//  MTGHUser.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTGHUser.h"

@implementation MTGHUser

#pragma mark - MTLJSONSerializing

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    return @{@"avatarUrl" : @"avatar_url",
             @"login" : @"login"};
}

@end
