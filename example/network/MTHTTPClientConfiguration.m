//
//  MTAPIClientConfiguration.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTHTTPClientConfiguration.h"
#import "ELNDefaultHTTPStubManager.h"

@implementation MTHTTPClientConfiguration

- (NSString *)baseURL
{
    return @"https://api.github.com";
}

//// uncomment to enable stubs
//- (id<ELNHTTPStubManager>)stubManager
//{
//    return [ELNDefaultHTTPStubManager new];
//}

@end
