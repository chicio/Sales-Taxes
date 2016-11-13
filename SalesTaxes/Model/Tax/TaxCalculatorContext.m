//
//  TaxCalculator.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "TaxCalculatorContext.h"

@implementation TaxCalculatorContext

- (float)calculateTax:(Product *)product {
    
    float taxes = [self.taxCalculatorStrategy calculateTax:product];
    
    return taxes;
}

@end
