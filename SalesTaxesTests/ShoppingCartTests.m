//
//  ShoppingCartTests.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>

#import "ShoppingCart.h"
#import "ShoppingItem.h"
#import "Product.h"

@interface ShoppingCartTests : XCTestCase

@end

@implementation ShoppingCartTests

- (void)setUp {
    
    [super setUp];
}

- (void)tearDown {

    [super tearDown];
}

/*!
 Test add shopping item to cart.
 */
- (void)testAddShoppingItem {

    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");

    id mockShoppingItem = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItem product]).andReturn(mockProduct);
    
    ShoppingCart *cart = [[ShoppingCart alloc] init];
    [cart add:mockShoppingItem];
    
    XCTAssertEqual(cart.shoppingItemList.count, 1, @"Failed shopping cart add.");
    XCTAssertNotEqual([cart.shoppingItemList objectForKey:[mockProduct productName]], nil, @"Failed shopping cart add.");
}

/*!
 Test remove shopping item to cart.
 */
- (void)testRemoveShoppingItem {
    
    id mockProduct = OCMClassMock([Product class]);
    OCMStub([mockProduct productName]).andReturn(@"Test item");
    
    id mockShoppingItem = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItem product]).andReturn(mockProduct);
    
    ShoppingCart *cart = [[ShoppingCart alloc] init];
    [cart add:mockShoppingItem];
    [cart remove:[mockProduct productName]];
    
    XCTAssertEqual(cart.shoppingItemList.count, 0, @"Failed shopping cart add.");
    XCTAssertEqual([cart.shoppingItemList objectForKey:[mockProduct productName]], nil, @"Failed shopping cart add.");
}

/*!
 Test get total to cart: sum of all cost and taxes of all shopping items.
 */
- (void)testGetTotalForShoppingItems {
    
    id mockProductOne = OCMClassMock([Product class]);
    OCMStub([mockProductOne productName]).andReturn(@"Test item 1");
    
    id mockProductTwo = OCMClassMock([Product class]);
    OCMStub([mockProductTwo productName]).andReturn(@"Test item 2");
    
    id mockShoppingItemOne = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemOne getCost]).andReturn(50.0f);
    OCMStub([mockShoppingItemOne product]).andReturn(mockProductOne);

    id mockShoppingItemTwo = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemTwo getCost]).andReturn(50.0f);
    OCMStub([mockShoppingItemTwo product]).andReturn(mockProductTwo);
    
    ShoppingCart *cart = [[ShoppingCart alloc] init];
    [cart add:mockShoppingItemOne];
    [cart add:mockShoppingItemTwo];
    
    XCTAssertEqual([cart getTotal], 100.0f, @"Failed shopping cart total.");
}

/*!
 Test get total taxes for cart: sum of all taxes of all shopping items.
 */
- (void)testGetTotalTaxesForShoppingItems {
    
    id mockProductOne = OCMClassMock([Product class]);
    OCMStub([mockProductOne productName]).andReturn(@"Test item 1");
    
    id mockProductTwo = OCMClassMock([Product class]);
    OCMStub([mockProductTwo productName]).andReturn(@"Test item 2");
    
    id mockShoppingItemOne = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemOne getTaxes]).andReturn(10.0f);
    OCMStub([mockShoppingItemOne product]).andReturn(mockProductOne);
    
    id mockShoppingItemTwo = OCMClassMock([ShoppingItem class]);
    OCMStub([mockShoppingItemTwo getTaxes]).andReturn(10.0f);
    OCMStub([mockShoppingItemTwo product]).andReturn(mockProductTwo);
    
    ShoppingCart *cart = [[ShoppingCart alloc] init];
    [cart add:mockShoppingItemOne];
    [cart add:mockShoppingItemTwo];
    
    XCTAssertEqual([cart getTotalTaxes], 20.0f, @"Failed shopping cart total taxes.");
}

@end
