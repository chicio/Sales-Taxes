//
//  ProductType.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

/*!
 Product type enum.
 Available values: Book, Food, Medical and Other.
 */
typedef enum producttype {
    Book,
    Food,
    Medical,
    Other
} ProductType;

#define ProducTypeString(x) [[[NSArray alloc] initWithObjects: @"Book", @"Food", @"Medical", @"Other", nil] \
                            objectAtIndex:x];
