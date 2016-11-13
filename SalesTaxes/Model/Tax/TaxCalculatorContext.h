//
//  TaxCalculator.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "TaxCalculationStrategy.h"
#import "Product.h"

@interface TaxCalculatorContext : NSObject

/// Current tax calculator strategy.
@property (nonatomic, strong) id<TaxCalculationStrategy> taxCalculatorStrategy;

/*!
 Calculate tax using current strategy.
 
 @param product on which taxes will be calculated.
 
 @returns the amount of taxes to be paid.
 */
- (float)calculateTax:(Product *)product;

@end
