//
//  MTUserController.m
//  network
//
//  Created by Sergey Rakov on 05.01.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "MTSettings.h"
#import "MTUserController.h"

#import "MTGHUserRequest.h"
#import "MTGHUser.h"
#import "MTHTTPClient.h"

@interface MTUserController ()

@end

@implementation MTUserController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark - Logics

- (void)loadData
{
    [[MTHTTPClient sharedInstance] sendRequest:[MTGHUserRequest new] withCompletion:^(id responseObject, NSError *error, ELNAPIResponseContext *context) {
        NSLog(@"Response: %@", responseObject);
        NSLog(@"Error: %@", error);
    }];
}

@end
