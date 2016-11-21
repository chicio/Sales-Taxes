//
//  Receipt.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShoppingCart.h"

/*!
 A class used to describe a receipt.
 A receipt is generated from the shopping cart items.
 */
@interface Receipt : NSObject

/*!
 Constructor.
 
 @param aShoppingCart shopping cart on which the receipt will be calculated.
 
 @returns Receipt instance.
 */
- (instancetype)initWithShoppingCart:(ShoppingCart *)aShoppingCart;

/*!
 Generate receipt using the shopping cart received as parameter.
 
 @returns receipt content.
 */
- (NSString *)generateReceipt;

@end
