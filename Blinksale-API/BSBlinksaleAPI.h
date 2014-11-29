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

/**
 *  Use this method as the first request when starting the application
 *  This request saves the username and password for later requests and returns the dashbord
 *
 *  @param domain      company domain
 *  @param username    email address of the user eg. someuser@gmail.com
 *  @param password    user password
 *  @param succesBlock returns an dictionary with the requested data
 *  @param errorBlock  returns some error
 */
- (void)loginClientWithDomain:(NSString *)domain
                     username:(NSString *)username
                     password:(NSString *)password
                  withSuccess:(void (^)(id response))succesBlock
                    withError:(void (^)(NSError *error))errorBlock;

/**
 *  Use this method when performing get requests
 *
 *  @param URL                if there is an URL already provided use this methiod
 *  @param requestedContent   use this parameter when there is no URL
 *  @param succesBlock
 *  @param errorBlock
 */
- (void)getDataFromURL:(NSString *)URL requestedContent:(NSString *)requestedContent
                                            withSuccess:(void (^)(id response))succesBlock
                                              withError:(void (^)(NSError *error))errorBlock;
/**
 *  Unse this method in order to perform post requests
 *
 *  @param URL                if there is an URL already provided use this methiod
 *  @param requestParameters  use this parameter when there is no URL
 *  @param requestedContent
 *  @param succesBlock
 *  @param errorBlock        
 */
- (void)postDataToURL:(NSString *)URL requestParameters:(NSDictionary *)requestParameters
                                       requestedContent:(NSString *)requestedContent
                                            withSuccess:(void (^)(id response))succesBlock
                                              withError:(void (^)(NSError *error))errorBlock;

@end
