//
//  MTAPIClientConfiguration.m
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <AFNetworking.h>
#import "MTHTTPClientConfiguration.h"
#import "ELNDefaultHTTPStubManager.h"

@implementation MTHTTPClientConfiguration

- (NSString *)baseURL
{
    return @"https://api.github.com";
}

- (AFHTTPRequestSerializer *)requestSerializer
{
    AFHTTPRequestSerializer *requestSerializer = [AFHTTPRequestSerializer serializer];
    requestSerializer.HTTPMethodsEncodingParametersInURI = [NSSet setWithObjects:@"GET", @"POST", nil];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    return requestSerializer;
}

//// uncomment to execute requests on background queue
//- (dispatch_queue_t)completionQueue
//{
//    return dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
//}

//// uncomment to enable stubs
//- (id<ELNHTTPStubManager>)stubManager
//{
//    return [ELNDefaultHTTPStubManager new];
//}

@end
