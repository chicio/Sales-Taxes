//
//  ShoppingItem.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ShoppingItem.h"
#import "TaxCalculatorDelegate.h"

@interface ShoppingItem ()

/// Product to be purchased.
@property (readwrite, nonatomic, strong) Product *product;
/// Quantity of product to be purchased.
@property (readwrite, nonatomic, assign) int quantity;
/// Tax Calculator for the shop item.
@property (nonatomic, strong) id<TaxCalculatorDelegate> taxCalculator;

@end

@implementation ShoppingItem

- (instancetype)initWithProduct:(Product *)aProduct andQuantity:(int)aQuantity andTaxCalculator:(id<TaxCalculatorDelegate>)aTaxCalculator {
    
    self = [super init];
    
    if (self) {
        
        self.product = aProduct;
        self.quantity = aQuantity;
        self.taxCalculator = aTaxCalculator;
    }
    
    return self;
}

- (float)getCost {
    
    float shoppingItemPrice = self.quantity * self.product.productPrice + [self getTaxes];
    
    return shoppingItemPrice;
}

- (float)getTaxes {
    
    float taxes = self.quantity * [self.taxCalculator getTaxes:self.product];

    return taxes;
}

@end
