//
//  GHAccessConfirmationRequest.h
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import "ELNHTTPRequest.h"

@interface MTAccessConfirmationRequest : NSObject <ELNHTTPRequest>

@property (copy, nonatomic) NSString *temporaryCode;
@property (copy, nonatomic) NSString *clientState;

@end
