//
//  SalesTaxesTests.m
//  SalesTaxesTests
//
//  Created by Fabrizio Duroni on 11/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "Product.h"
#import "ShoppingItem.h"
#import "ShoppingCart.h"

@interface SalesTaxesTests : XCTestCase

@end

@implementation SalesTaxesTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {
    
    [super tearDown];
}

- (void)testOutputOne {

    Product *product1 = [[Product alloc] initWithName:@"book" andPrice:12.49f andType:Book andOrigin:Local];
    Product *product2 = [[Product alloc] initWithName:@"music" andPrice:14.99f andType:Other andOrigin:Local];
    Product *product3 = [[Product alloc] initWithName:@"chocolate" andPrice:0.85f andType:Food andOrigin:Local];
    
    TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];
    
    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item3 = [[ShoppingItem alloc] initWithProduct:product3 andQuantity:1 andTaxCalculator:taxCalculator];
    
    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
    [shoppingCart add:item1];
    [shoppingCart add:item2];
    [shoppingCart add:item3];
    
    ///Product.
    XCTAssertEqual([item1 getCost], 12.49f);
    XCTAssertEqual([item2 getCost], 16.49f);
    XCTAssertEqual([item3 getCost], 0.85f);
    
    ///Shopping cart output.
    XCTAssertEqual([shoppingCart getTotalTaxes], 1.5f, @"Shopping Cart total taxes calculation incorrect.");
    XCTAssertEqual([shoppingCart getTotal], 29.83f, @"Shopping Cart total calculation incorrect.");
}

- (void)testOutputTwo {
 
    Product *product1 = [[Product alloc] initWithName:@"imported box of chocolate" andPrice:10.00f andType:Food andOrigin:Imported];
    Product *product2 = [[Product alloc] initWithName:@"imported bottle of perfume" andPrice:47.50f andType:Other andOrigin:Imported];
    
    TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];
    
    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1 andTaxCalculator:taxCalculator];
    
    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
    [shoppingCart add:item1];
    [shoppingCart add:item2];
    
    ///Product.
    XCTAssertEqual([item1 getCost], 10.50f);
    XCTAssertEqual([item2 getCost], 54.65f);

    ///Shopping cart output.
    XCTAssertEqual([shoppingCart getTotalTaxes], 7.65f, @"Shopping Cart total taxes calculation incorrect.");
    XCTAssertEqual([shoppingCart getTotal], 65.15f, @"Shopping Cart total calculation incorrect.");
}

- (void)testOutputThree {
    
    Product *product1 = [[Product alloc] initWithName:@"imported bottle of perfume" andPrice:27.99f andType:Other andOrigin:Imported];
    Product *product2 = [[Product alloc] initWithName:@"bottle of perfume" andPrice:18.99f andType:Other andOrigin:Local];
    Product *product3 = [[Product alloc] initWithName:@"packet of headachepills" andPrice:9.75f andType:Medical andOrigin:Local];
    Product *product4 = [[Product alloc] initWithName:@"box of imported chocolates" andPrice:11.25f andType:Food andOrigin:Imported];
    
    TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];

    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item3 = [[ShoppingItem alloc] initWithProduct:product3 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item4 = [[ShoppingItem alloc] initWithProduct:product4 andQuantity:1 andTaxCalculator:taxCalculator];
    
    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
    [shoppingCart add:item1];
    [shoppingCart add:item2];
    [shoppingCart add:item3];
    [shoppingCart add:item4];
    
    ///Product.
    XCTAssertEqual([item1 getCost], 32.19f);
    XCTAssertEqual([item2 getCost], 20.89f);
    XCTAssertEqual([item3 getCost], 9.75f);
    XCTAssertEqual([item4 getCost], 11.85f);
    
    ///Shopping cart output.
    XCTAssertEqual([shoppingCart getTotalTaxes], 6.7f, @"Shopping Cart total taxes calculation incorrect.");
    XCTAssertEqual([shoppingCart getTotal], 74.68f, @"Shopping Cart total calculation incorrect.");
}

@end
