//
//  MTSettings.h
//  network
//
//  Created by Sergey Rakov on 05.01.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MTSettings : NSObject

+ (instancetype)sharedInstance;

@property (readwrite, nonatomic) NSString *githubApiToken;

@end
