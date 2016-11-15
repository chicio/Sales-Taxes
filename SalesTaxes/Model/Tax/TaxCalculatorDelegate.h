//
//  TaxCalculatorProtocol.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 15/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Product.h"

/*!
 A protocol used to delegate the tax calculation.
 */
@protocol TaxCalculatorDelegate <NSObject>

@required

/*!
 Get taxes rounded up for the product received as input.
 
 @param product the product on which taxes will be calculated.
 */
- (float)getTaxes:(Product *)product;

@end
