//
//  BSInvoiceData.h
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSInvoiceData : NSObject

/**
 *  Call this method in order to create an instance of BSInvoiceData
 *
 *  @param invoiceData an NSDicationary that contains Invoice data
 *
 *  @return an instance of BSInvoiceData
 */
- (instancetype)initWithDictionary:(NSDictionary *)invoiceData;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *invoiceURL;


@end
