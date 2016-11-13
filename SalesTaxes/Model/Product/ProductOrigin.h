//
//  ProductOrigin.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

/*!
 Product origin enum.
 Available values: Local and Imported.
 */
typedef enum productorigin {
    Local,
    Imported
} ProductOrigin;

#define ProductOriginString(x) [[[NSArray alloc] initWithObjects: @"Local", @"Imported", nil] objectAtIndex:x];
