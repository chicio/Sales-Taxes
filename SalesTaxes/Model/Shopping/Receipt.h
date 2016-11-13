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
 Constructor.
 
 @param aShoppingCart shopping cart on which the receipt will be calculated.
 
 @returns Receipt instance.
 */
- (instancetype)initWithShoppingCart:(ShoppingCart *)aShoppingCart;

/*!
 Generate receipt using the shopping cart received as parameter.
 */
- (NSString *)generateReceipt;

@end
