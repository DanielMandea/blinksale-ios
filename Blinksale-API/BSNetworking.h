//
//  BSNetworking.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 22/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AFHTTPRequestOperation;

typedef enum {
    BSNetworkingRequestMethodGET,
    BSNetworkingRequestMethodPOST,
    BSNetworkingRequestMethodDOWNLOAD,
    BSNetworkingRequestMethodUPLOAD
}BSNetworkingRequestMethod;

@interface BSNetworking : NSObject


+ (void)requestDataFromURL:(NSString *)requestURL
         withRequestMethod:(BSNetworkingRequestMethod)requestMethod
             andParameters:(NSDictionary *)parameters
               withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))succesBlock
                   orError:(void (^)(NSError *error))errorBlock;


@end
