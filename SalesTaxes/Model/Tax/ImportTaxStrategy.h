//
//  ImportTaxStrategy.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "TaxCalculationStrategy.h"

/*!
 A class that implements the import tax algorithm.
 */
@interface ImportTaxStrategy : NSObject <TaxCalculationStrategy>

/*!
 Calculate tax using a "import tax" algorithm.
 
 @param product product on which taxes will be calculated.
 
 @returns the amount of taxes to be paid.
 */
- (float)calculateTax:(Product *)product;

@end
