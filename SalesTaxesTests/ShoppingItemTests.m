//
//  ShoppingItem.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "ShoppingItem.h"
#import "TaxCalculator.h"
#import "Product.h"

@interface ShoppingItemTests : XCTestCase

@end

@implementation ShoppingItemTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Testing get taxes for shopping item with a single product unit.
 Shopping item taxes = quantity * product-taxes.
 */
- (void)testGetShoppingItemTaxesWithSingleItem {

    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");
    OCMStub([mockProduct productPrice]).andReturn(10.0f);
    OCMStub([mockProduct productType]).andReturn(Book);
    OCMStub([mockProduct productOrigin]).andReturn(Local);
    
    id mockTaxCalculator = OCMClassMock([TaxCalculator class]);
    OCMStub([mockTaxCalculator calculateTax:mockProduct]).andReturn(0.5f);
    
    ShoppingItem *shoppingItem = [[ShoppingItem alloc] initWithProduct:mockProduct
                                                           andQuantity:1
                                                      andTaxCalculator:mockTaxCalculator];
    
    XCTAssertEqual([shoppingItem getTaxes], 0.5f, @"Failed taxes calculation - single unit shopping item");
}

/*!
 Testing shopping item cost.
 Shopping item cost = quantity * (product-price + product-taxes).
 */
- (void)testGetShoppingItemCostWithSingleItem {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");
    OCMStub([mockProduct productPrice]).andReturn(10.0f);
    OCMStub([mockProduct productType]).andReturn(Book);
    OCMStub([mockProduct productOrigin]).andReturn(Local);
    
    id mockTaxCalculator = OCMClassMock([TaxCalculator class]);
    OCMStub([mockTaxCalculator calculateTax:mockProduct]).andReturn(0.50f);
    
    ShoppingItem *shoppingItem = [[ShoppingItem alloc] initWithProduct:mockProduct
                                                           andQuantity:1
                                                      andTaxCalculator:mockTaxCalculator];
    
    XCTAssertEqual([shoppingItem getCost], 10.50f, @"Failed cost calculation - single unit shopping item");
}

/*!
 Testing get taxes for shopping item with a multiple product unit.
 Shopping item taxes = quantity * product-taxes.
 */
- (void)testGetShoppingItemTaxesWithMutipleItem {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");
    OCMStub([mockProduct productPrice]).andReturn(5.0f);
    OCMStub([mockProduct productType]).andReturn(Book);
    OCMStub([mockProduct productOrigin]).andReturn(Local);
    
    id mockTaxCalculator = OCMClassMock([TaxCalculator class]);
    OCMStub([mockTaxCalculator calculateTax:mockProduct]).andReturn(0.50f);
    
    ShoppingItem *shoppingItem = [[ShoppingItem alloc] initWithProduct:mockProduct
                                                           andQuantity:4
                                                      andTaxCalculator:mockTaxCalculator];
    
    XCTAssertEqual([shoppingItem getTaxes], 2.0f, @"Failed taxes calculation - multiple units shopping item");
}

/*!
 Testing shopping item cost.
 Shopping item cost = quantity * (product-price + product-taxes).
 */
- (void)testGetShoppingItemCostWithMultipleItem {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");
    OCMStub([mockProduct productPrice]).andReturn(10.0f);
    OCMStub([mockProduct productType]).andReturn(Book);
    OCMStub([mockProduct productOrigin]).andReturn(Local);
    
    id mockTaxCalculator = OCMClassMock([TaxCalculator class]);
    OCMStub([mockTaxCalculator calculateTax:mockProduct]).andReturn(0.50f);
    
    ShoppingItem *shoppingItem = [[ShoppingItem alloc] initWithProduct:mockProduct
                                                           andQuantity:4
                                                      andTaxCalculator:mockTaxCalculator];
    
    XCTAssertEqual([shoppingItem getCost], 42.f, @"Failed cost calculation - multiple units shopping item");
}

@end
