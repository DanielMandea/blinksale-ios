//
//  BSClientsDataSource.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientsDataSource.h"
#import "BSBlinksaleAPI.h"
#import "NSDictionary+CheckObjectClass.h"
#import "BSClientData.h"

@interface BSClientsDataSource ()

@property (nonatomic, strong) NSString *contentName;
@property (nonatomic, strong) NSString *requestURL;

@end

@implementation BSClientsDataSource

- (instancetype)init {
    if (self = [super init]) {
        _dataSource = [[NSArray alloc] init];
    }
    return self;
}

- (instancetype)initWithRequestedContent:(NSString *)content {
    if (self = [super init]) {
        _dataSource = [[NSArray alloc] init];
        _contentName = content;
    }
    return self;
}

- (instancetype)initWithRequestURL:(NSString *)requestURL {
    if (self = [super init]) {
        _dataSource = [[NSArray alloc] init];
        _requestURL = requestURL;
    }
    return self;
}

- (void)loadDataSourceWithCompletionHandeler:(void (^)(BOOL))completionHandeler {
    [[BSBlinksaleAPI sharedInstance] requestDataFromURL:self.requestURL requestedContent:self.contentName withSuccess:^(id response) {
        [self parseResponse:response];
        completionHandeler(YES);
    } withError:^(NSError *error) {
        
    }];
}

- (void)parseResponse:(id)response {
    if ([response isKindOfClass:[NSError class]]) {
        
        
    } else if ([response isKindOfClass:[NSDictionary class]]) {
        NSDictionary *currentResponse = response;
        if ([currentResponse dictionaryForKey:@"clients"].allKeys.count) {
            NSArray *allClients = [[currentResponse dictionaryForKey:@"clients"] arrayForKey:@"client"];
            NSMutableArray *returnClients = [[NSMutableArray alloc] init];
            for (NSDictionary *clientData  in allClients) {
                BSClientData *client = [[BSClientData alloc] initWithDictionary:clientData];
                [returnClients addObject:client];
            }
            [self setDataSource:returnClients];
        }
    }
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
}

@end
