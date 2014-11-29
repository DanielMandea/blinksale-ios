//
//  BSBlinksaleAPI.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSBlinksaleAPI.h"
#import "BSNetworking.h"
#import <JNKeychain.h>
#import <XMLReader.h>

static NSString *const kDomain = @"blinksale.com";

@interface BSBlinksaleAPI ()

@property (nonatomic, strong) NSString *host;

@end

@implementation BSBlinksaleAPI

+ (instancetype)sharedInstance {
    static BSBlinksaleAPI *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self setHost:[JNKeychain loadValueForKey:(__bridge id)kSecAttrLabel]];
    }
    return self;
}

- (void)setHost:(NSString *)host {
    _host = [NSString stringWithFormat:@"https://%@.%@", host, kDomain];
}

#pragma mark - Login

- (void)loginClientWithDomain:(NSString *)domain
                     username:(NSString *)username
                     password:(NSString *)password
                  withSuccess:(void (^)(id))succesBlock
                    withError:(void (^)(NSError *))errorBlock {
    [self setHost:domain];
    [BSNetworking requestDataFromURL:self.host withRequestMethod:BSNetworkingRequestMethodGET andParameters:nil withSuccess:^(AFHTTPRequestOperation *operation, id response) {
        [self saveUserName:username password:password subDomain:domain];
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:response
                                                     options:XMLReaderOptionsProcessNamespaces
                                                       error:&error];
        succesBlock(dict);
    } orError:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void)saveUserName:(NSString *)username password:(NSString *)password subDomain:(NSString *)subDomain {
    [JNKeychain saveValue:username forKey:(__bridge id)kSecAttrAccount];
    [JNKeychain saveValue:password forKey:(__bridge id)kSecValueData];
    [JNKeychain saveValue:subDomain forKey:(__bridge id)kSecAttrLabel];
}

#pragma mark - Request Data

- (void)postDataToURL:(NSString *)URL requestParameters:(NSDictionary *)requestParameters
                                       requestedContent:(NSString *)requestedContent
                                            withSuccess:(void (^)(id))succesBlock
                                              withError:(void (^)(NSError *))errorBlock {
    
    if (!URL.length) {
        URL = [NSString stringWithFormat:@"%@/%@", self.host, requestedContent];
    }
    [BSNetworking requestDataFromURL:URL withRequestMethod:BSNetworkingRequestMethodPOST andParameters:requestParameters withSuccess:^(AFHTTPRequestOperation *operation, id response) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:response
                                                     options:XMLReaderOptionsProcessNamespaces
                                                       error:&error];
        succesBlock(dict);
    } orError:^(NSError *error) {
        errorBlock(error);
    }];
}

- (void)getDataFromURL:(NSString *)URL
          requestedContent:(NSString *)requestedContent
               withSuccess:(void (^)(id))succesBlock
                 withError:(void (^)(NSError *))errorBlock {
    
    if (!URL.length) {
        URL = [NSString stringWithFormat:@"%@/%@", self.host, requestedContent];
    }
    [BSNetworking requestDataFromURL:URL withRequestMethod:BSNetworkingRequestMethodGET andParameters:nil withSuccess:^(AFHTTPRequestOperation *operation, id response) {
        NSError *error = nil;
        NSDictionary *dict = [XMLReader dictionaryForXMLData:response
                                                     options:XMLReaderOptionsProcessNamespaces
                                                       error:&error];
        succesBlock(dict);
    } orError:^(NSError *error) {
        errorBlock(error);
    }];
}

#pragma mark - Custom Resuests

// TODO

@end
