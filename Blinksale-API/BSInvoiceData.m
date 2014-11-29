//
//  BSInvoiceData.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 29/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSInvoiceData.h"
#import "NSDictionary+CheckObjectClass.h"

@implementation BSInvoiceData

- (instancetype)initWithDictionary:(NSDictionary *)invoiceData {
    if (self = [super init]) {
        _title = [invoiceData stringForKey:@"text"];
        _invoiceURL = [invoiceData stringForKey:@"uri"];
    }
    return self;
}

@end
