//
//  ShoppingItem.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"
#import "TaxCalculator.h"

/*!
 A class used to describe an item of the shopping cart.
 It is composed of a product and a quantity value. 
 */
@interface ShoppingItem : NSObject

/// Product to be purchased.
@property (readonly, nonatomic, strong) Product *product;
/// Quantity of product to be purchased.
@property (readonly, nonatomic, assign) int quantity;

/*!
 Constructor.
 
 @param aProduct the product associated with the shopping item.
 @param aQuantity the quantity associated with the shopping item.
 @param aTaxCalculator a tax calculator for the shopping item.
 
 @return ShoppingItem instance.
 */
- (instancetype)initWithProduct:(Product *)aProduct andQuantity:(int)aQuantity andTaxCalculator:(TaxCalculator *)aTaxCalculator;

/*!
Get cost of the shopping item.
The price returned is equal to:
 
 cost = quantity * (product price + taxes)
 */
- (float)getCost;

/*!
 Get taxes of the shopping item.
 The amount of taxes returned is equal to:
 
 taxes = quantity * taxes
 */
- (float)getTaxes;

@end
