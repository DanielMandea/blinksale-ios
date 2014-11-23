//
//  BSNetworking.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 22/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSNetworking.h"
#import <AFNetworking.h>
#import <JNKeychain.h>

@implementation BSNetworking


+ (void)requestDataFromURL:(NSString *)requestURL
         withRequestMethod:(BSNetworkingRequestMethod)requestMethod
             andParameters:(NSDictionary *)parameters
               withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))succesBlock
                   orError:(void (^)(NSError *error))errorBlock {
    // perform request with needed request method
    switch (requestMethod) {
        case BSNetworkingRequestMethodGET: {
            [[self class] requestDataUsingServiceTypeGETFromUrl:requestURL
                                                 withParameters:parameters
                                                    withSuccess:^(AFHTTPRequestOperation *operation, id response) {
                                                        succesBlock(operation, response);
                                                    } withError:^(NSError *error) {
                                                        errorBlock(error);
                                                    }
             ];
        }
            break;
        case BSNetworkingRequestMethodPOST: {
            [[self class] requestDataUsingServiceTypePOSTFromUrl:requestURL
                                                  withParameters:parameters
                                                     withSuccess:^(AFHTTPRequestOperation *operation,id response) {
                                                         succesBlock(operation, response);
                                                     } withError:^(NSError *error) {
                                                         errorBlock(error);
                                                     }
             ];
        }
            break;
        case BSNetworkingRequestMethodDOWNLOAD:
            // TODO used when downloading
            break;
        default:
            // TODO if there is any default case
            break;
    }
}


#pragma mark - Service Method GET

+ (void)requestDataUsingServiceTypeGETFromUrl:(NSString *)urlString
                               withParameters:(NSDictionary *)parameters
                                  withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))succesBlock
                                    withError:(void (^)(NSError *error))errorBlock {
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/vnd.blinksale+xml" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/vnd.blinksale+xml" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer
     setAuthorizationHeaderFieldWithUsername:[JNKeychain loadValueForKey:(__bridge id)kSecAttrAccount]
                                    password:[JNKeychain loadValueForKey:(__bridge id)kSecValueData]];
    // Make sure to set the responseSerializer correctly
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager GET:urlString
      parameters:nil
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             succesBlock(operation, responseObject);
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
         }
         failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             errorBlock(errorBlock);
             [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
         }
     ];
}

#pragma mark - Service Method POST

+ (void)requestDataUsingServiceTypePOSTFromUrl:(NSString *)urlString
                                withParameters:(NSDictionary *)parameters
                                   withSuccess:(void (^)(AFHTTPRequestOperation *operation, id response))succesBlock
                                     withError:(void (^)(NSError *error))errorBlock {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"application/vnd.blinksale+xml" forHTTPHeaderField:@"Accept"];
    [manager.requestSerializer setValue:@"application/vnd.blinksale+xml" forHTTPHeaderField:@"Content-Type"];
    [manager.requestSerializer
     setAuthorizationHeaderFieldWithUsername:[JNKeychain loadValueForKey:(__bridge id)kSecAttrAccount]
                                    password:[JNKeychain loadValueForKey:(__bridge id)kSecValueData]];
    // Make sure to set the responseSerializer correctly
    manager.responseSerializer = [AFXMLParserResponseSerializer serializer];
    [manager POST:urlString
       parameters:parameters
          success:^(AFHTTPRequestOperation *operation, id responseObject) {
              succesBlock(operation, responseObject);
              [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
          }
          failure:^(AFHTTPRequestOperation *operation, NSError *error) {
              errorBlock(error);
              [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
          }
     ];
}



@end
