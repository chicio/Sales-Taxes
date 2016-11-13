//
//  Origin.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#ifndef Origin_h
#define Origin_h

typedef enum productorigin {
    Local,
    Imported
} ProductOrigin;

#endif /* Origin_h */

#define ProductOriginString(x) [[[NSArray alloc] initWithObjects: @"Local", @"Imported", nil] objectAtIndex:x];
