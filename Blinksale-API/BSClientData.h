//
//  BSClientData.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BSPeopleData;

@interface BSClientData : NSObject

/**
 *  Call this method in order to create an instance of BSClientData
 *
 *  @param clientData an NSDicationary that contains Client data
 *
 *  @return an instance of BSClientData
 */
- (instancetype)initWithDictionary:(NSDictionary *)clientData;

/**
 *  Call this method in order to update client with data eg. CLient Details
 *
 *  @param cleintData
 */
- (void)updateClientWithData:(NSDictionary *)clientData;
/**
 *  Initial Client Data
 */
@property (nonatomic, strong) NSDate *createdAt;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSDate *updatedAt;
@property (nonatomic, strong) NSString *clientURL;
/**
 *  Client Details
 */
@property (nonatomic, strong) NSString *firstAdderss;
@property (nonatomic, strong) NSString *secondAddress;
@property (nonatomic, strong) NSString *city;
@property (nonatomic, strong) NSString *country;
@property (nonatomic, strong) NSString *fax;
@property (nonatomic, strong) NSArray *invoices;
@property (nonatomic, strong) BSPeopleData *people;
@property (nonatomic, strong) NSString *phone;
@property (nonatomic, strong) NSString *state;
@property (nonatomic, strong) NSString *zipCode;
@property (nonatomic, strong) NSString *token;


@end
