//
//  Receipt.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShoppingCart.h"

@interface Receipt : NSObject

/*!
 Generate receipt using the shopping cart received as parameter.
 
 @param shoppingCart the list item to be displayed.
 */
- (NSString *)generateReceipt:(ShoppingCart *)shoppingCart;

@end
