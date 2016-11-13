//
//  BasicTaxStrategy.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "TaxCalculationStrategy.h"

/*!
 A class that implements the basic tax algorithm.
 */
@interface BasicTaxStrategy : NSObject <TaxCalculationStrategy>

/*!
 Calculate tax using a "basic sale tax" algorithm.
 
 @param product product on which taxes will be calculated.
 
 @returns the amount of taxes to be paid.
 */
- (float)calculateTax:(Product *)product;

@end
