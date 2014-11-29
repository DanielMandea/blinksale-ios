//
//  BSClientData.m
//  Blinksale-API
//
//  Created by Mandea Daniel on 23/11/14.
//  Copyright (c) 2014 Mandea Daniel. All rights reserved.
//

#import "BSClientData.h"
#import "BSInvoiceData.h"
#import "BSPeopleData.h"
#import "NSDictionary+CheckObjectClass.h"

@implementation BSClientData

- (instancetype)initWithDictionary:(NSDictionary *)clientData {
    if (self = [super init]) {
        _createdAt = [clientData dateForKey:@"created_at"];
        _name = [[clientData dictionaryForKey:@"name"] stringForKey:@"text"];
        _updatedAt = [clientData dateForKey:@"updated_at"];
        _clientURL = [clientData stringForKey:@"uri"];
    }
    return self;
}

- (void)updateClientWithData:(NSDictionary *)clientData {
    _firstAdderss = [[clientData dictionaryForKey:@"address1"] stringForKey:@"text"];
    _secondAddress = [[clientData dictionaryForKey:@"address2"] stringForKey:@"text"];
    _city = [[clientData dictionaryForKey:@"city"] stringForKey:@"text"];
    _country = [[clientData dictionaryForKey:@"country"] stringForKey:@"text"];
    _fax = [[clientData dictionaryForKey:@"fax"] stringForKey:@"text"];
    _invoices = [self getInvoicesFromData:[[clientData dictionaryForKey:@"invoices"] arrayForKey:@"invoice"]];
    if (!_invoices) {
        BSInvoiceData *invoice = [self getInvoiceFromData:[clientData dictionaryForKey:@"invoices"]];
        _invoices = @[invoice];
    }
    _people = [[BSPeopleData alloc] initWithDictionary:[clientData dictionaryForKey:@"people"]];
    _phone = [[clientData dictionaryForKey:@"phone"] stringForKey:@"text"];
    _state = [[clientData dictionaryForKey:@"state"] stringForKey:@"text"];
    _token = [[clientData dictionaryForKey:@"token"] stringForKey:@"text"];
}

- (NSArray *)getInvoicesFromData:(NSArray *)invoicesData {
    NSMutableArray *invoices = [[NSMutableArray alloc] init];
    for (NSDictionary *personData in invoicesData) {
        BSInvoiceData *invoice = [[BSInvoiceData alloc] initWithDictionary:personData];
        [invoices addObject:invoice];
    }
    return invoices;
}

- (BSInvoiceData *)getInvoiceFromData:(NSDictionary *)invoiceData {
    BSInvoiceData *invoice = [[BSInvoiceData alloc] initWithDictionary:[invoiceData dictionaryForKey:@"invoice"]];
    return invoice;
}

@end
