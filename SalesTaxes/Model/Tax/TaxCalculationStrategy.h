//
//  TaxCalculationStrategy.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"

@protocol TaxCalculationStrategy <NSObject>

@required

/*!
 Calculate tax using a specific algorithm.
 All implementation of this method will contain 
 a specific algorithm for tax calculation.
 
 @param product product on which taxes will be calculated.
 
 @returns the amount of taxes to be paid.
 */
- (float)calculateTax:(Product *)product;

@end
