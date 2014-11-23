//
//  BSClientsDataSource.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSClientsDataSource : NSObject

/**
 *  Init the the data source with an URL
 *
 *  @param requestURL the url for needed content
 *
 *  @return an instance of BSClientsDataSource
 */
- (instancetype)initWithRequestURL:(NSString *)requestURL;

/**
 *  Init with the name of the content we need eg. clients, invoices
 *
 *  @param content the name of the content needed
 *
 *  @return an instance of BSClientsDataSource
 */
- (instancetype)initWithRequestedContent:(NSString *)content;

/**
 *  call method in order to reload datasource data
 *
 *  @param completion completes with success or not
 */
- (void)loadDataSourceWithCompletionHandeler:(void(^)(BOOL success))completionHandeler;

/**
 *  This array contains objects of BSCompanyData type
 */
@property (nonatomic, strong) NSArray *dataSource;


@end
