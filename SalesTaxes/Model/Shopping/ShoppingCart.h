//
//  ShoppingCart.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ShoppingItem.h"

@interface ShoppingCart : NSObject

/// Array of the key of shopping item ordered based on insertion (so we keep the same order in output).
@property (readonly, nonatomic, strong) NSMutableArray<NSString *> *shoppingItemKeyOrder;
/// Shopping items list. Use NSMutableDictionary to ensure uniqueness of the item (same as hash map in Java/C++).
@property (readonly, nonatomic, strong) NSMutableDictionary<NSString *, ShoppingItem *> *shoppingItemList;

/*!
 Add shopping item to shopping cart.
 
 @param shoppingItem the shopping item to be added.
 */
- (void)add:(ShoppingItem *)shoppingItem;

/*!
 Remove shopping item using given name.
 
 @param shoppingItemName the shopping item name of the shopping item to be removed.
 */
- (void)remove:(NSString *)shoppingItemName;

/*!
 */

/*!
 Get total price of the current shopping cart.
 
 @returns total of the shopping cart.
 */
- (float)getTotal;

/*!
 Get total taxes of the current shopping cart.
 
 @returns total taxes of the shopping cart.
 */
- (float)getTotalTaxes;

@end
