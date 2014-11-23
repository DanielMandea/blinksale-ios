//
//  BSBlinksaleAPI.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSBlinksaleAPI : NSObject

+ (instancetype)sharedInstance;

- (void)loginClientWithDomain:(NSString *)domain
                     username:(NSString *)username
                     password:(NSString *)password
                  withSuccess:(void (^)(id response))succesBlock
                    withError:(void (^)(NSError *error))errorBlock;

- (void)requestDataFromURL:(NSString *)URL
          requestedContent:(NSString *)requestedContent
               withSuccess:(void (^)(id response))succesBlock
                 withError:(void (^)(NSError *error))errorBlock;

@end
