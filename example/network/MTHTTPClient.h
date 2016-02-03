//
//  MTHTTPClient.h
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "ELNHTTPNetworking.h"

@interface MTHTTPClient : ELNHTTPClient

+ (instancetype)sharedInstance;

@property (copy, nonatomic) NSString *GHAPIToken;

@end
