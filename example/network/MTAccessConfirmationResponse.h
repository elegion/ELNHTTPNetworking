//
//  GHAccessConfirmationResponse.h
//  network
//
//  Created by Sergey Rakov on 11/01/16.
//  Copyright © 2016 e-Legion. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface MTAccessConfirmationResponse : MTLModel <MTLJSONSerializing>

@property (copy, nonatomic) NSString *accessToken;

@end
