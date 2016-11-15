//
//  TaxCalculator.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "TaxCalculator.h"
#import "TaxCalculatorContext.h"
#import "BasicTaxStrategy.h"
#import "ImportTaxStrategy.h"

#define roundUp(x) (ceil(x * 20.0f) / 20.0f)

@interface TaxCalculator ()

/// Tax Calculator Context.

@property (nonatomic, strong) TaxCalculatorContext *taxCalculatorContext;

@end

@implementation TaxCalculator

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.taxCalculatorContext = [[TaxCalculatorContext alloc] init];
    }
    
    return self;
}

- (float)getTaxes:(Product *)product {

    float taxes = 0.0f;
    
    self.taxCalculatorContext.taxCalculatorStrategy = [[BasicTaxStrategy alloc] init];
    taxes = [self.taxCalculatorContext calculateTax:product];
    
    self.taxCalculatorContext.taxCalculatorStrategy = [[ImportTaxStrategy alloc] init];
    taxes += [self.taxCalculatorContext calculateTax:product];
    
    return roundUp(taxes);
}

@end
