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

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIButton *refreshButton;

@end

@implementation MTUserController

#pragma mark - Life Cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadData];
}

#pragma mark - Logics

- (IBAction)loadData
{
    [[MTHTTPClient sharedInstance] sendRequest:[MTGHUserRequest new] withCompletion:^(MTGHUser *responseObject, NSError *error, ELNAPIResponseContext *context) {

        self.nameLabel.text = responseObject.login;
        
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:responseObject.avatarUrl]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.imageView.image = image;
            });
        });
    }];
}

@end
