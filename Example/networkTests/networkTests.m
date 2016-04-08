//
//  networkTests.m
//  networkTests
//
//  Created by Sergey Rakov on 08.04.16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <ELNHTTPNetworking.h>
#import <AFNetworking.h>

@interface networkTests : XCTestCase

@end

@implementation networkTests

- (void)setUp
{
    [super setUp];

    
}

- (void)tearDown
{

    
    [super tearDown];
}

- (void)testExample
{
    XCTAssertTrue([[ELNHTTPClient new].sessionManager isKindOfClass:[AFHTTPSessionManager class]]);
}

@end
