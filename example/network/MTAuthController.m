//
//  MTAuthController.m
//  network
//
//  Created by Sergey Rakov on 05.01.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <NSURL+QueryDictionary.h>
#import "MTAuthController.h"
#import "MTSettings.h"
#import "MTHTTPClient.h"
#import "MTAccessConfirmationRequest.h"
#import "MTAccessConfirmationResponse.h"

static NSString * const kMTGithubOAuthURL = @"https://github.com/login/oauth/authorize";
static NSString * const kMTGithubRedirectUrl = @"https://github.com/";
static NSString * const kMTGithubClientId = @"061be8459ab721539733";
static NSString * const kMTGithubClientState = @"MTGithubClientState";

@interface MTAuthController () <UIWebViewDelegate>

@property (readwrite, nonatomic) UIWebView *view;

@end

@implementation MTAuthController

@dynamic view;

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString:kMTGithubOAuthURL];
    url = [url uq_URLByAppendingQueryDictionary:@{@"client_id" : kMTGithubClientId,
                                                  @"state" : kMTGithubClientState}];
    
    [self.view loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark - Web View

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    if ([[request.URL uq_URLByRemovingQuery].absoluteString isEqualToString:kMTGithubRedirectUrl]) {
        [self sendConfirmationRequestWithTemporaryCode:request.URL.uq_queryDictionary[@"code"]];
        return NO;
    }
    return YES;
}

#pragma mark - Logics

- (void)sendConfirmationRequestWithTemporaryCode:(NSString *)code
{
    MTAccessConfirmationRequest *request = [MTAccessConfirmationRequest new];
    request.temporaryCode = code;
    request.clientState = kMTGithubClientState;

    __weak typeof(self) weakSelf = self;
    NSDate *date = [NSDate date];
    __unused NSURLSessionTask *task = [[MTHTTPClient sharedInstance] sendRequest:request withCompletion:^(MTAccessConfirmationResponse *responseObject, NSError *error, ELNAPIResponseContext *context) {
        NSLog(@"Time: %@", @([[NSDate date] timeIntervalSinceDate:date]));
        NSLog(@"Response: %@", responseObject);
        NSLog(@"Error: %@", error);
        NSLog(@"Context: %@", context);
        
        NSString *accessToken = responseObject.accessToken;
        if (accessToken.length > 0) {
            [MTSettings sharedInstance].githubApiToken = accessToken;
            [MTHTTPClient sharedInstance].GHAPIToken = accessToken;
            [weakSelf performSegueWithIdentifier:@"showUser" sender:nil];
        }
    }];

//    // request cancellation
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [task cancel];
//    });
}

@end
