//
//  TaxCalculator.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"

/*!
 Tax Calculator class.
 A facade class used to calculate the taxes for a product.
 */
@interface TaxCalculator : NSObject

/*!
 Calculate tax for a product.
 
 @returns amount of taxes for the product.
 */
- (float)calculateTax:(Product *)product;

@end
