//
//  TaxCalculator.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "TaxCalculatorDelegate.h"

/*!
 Tax Calculator class.
 A facade class used to calculate the taxes for a product.
 */
@interface TaxCalculator : NSObject <TaxCalculatorDelegate>

/*!
 Get taxes rounded up for the product received as input.
 
 @param product the product on which taxes will be calculated.
 */
- (float)getTaxes:(Product *)product;

@end
