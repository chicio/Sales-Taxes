//
//  Type .h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#ifndef Type__h
#define Type__h

typedef enum producttype {
    Book,
    Food,
    Medical,
    Other
} ProductType;

#endif /* Type__h */

#define ProducTypeString(x) [[[NSArray alloc] initWithObjects: @"Book", @"Food", @"Medical", @"Other", nil] \
                            objectAtIndex:x];
