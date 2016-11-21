//
//  SalesTaxesSwiftTests.swift
//  SalesTaxesSwiftTests
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import XCTest

class SalesTaxesSwiftTests: XCTestCase {
    
    override func setUp() {
        
        super.setUp()
    }
    
    override func tearDown() {

        super.tearDown()
    }
    
    func testOutputOne() {
     
        let product1 = Product(aName:"book", aPrice:12.49, aType:.Book, aOrigin:.Local);
        let product2 = Product(aName:"music", aPrice:14.99, aType:.Other, aOrigin:.Local);
        let product3 = Product(aName:"chocolate", aPrice:0.85, aType:.Food, aOrigin:.Local);
        
        let taxCalculator = TaxCalculator()
        
        let item1 = ShoppingItem(aProduct: product1, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item2 = ShoppingItem(aProduct: product2, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item3 = ShoppingItem(aProduct: product3, aQuantity: 1, aTaxCalculator: taxCalculator)
        
        let shoppingCart = ShoppingCart()
        shoppingCart.add(aShoppingItem: item1)
        shoppingCart.add(aShoppingItem: item2)
        shoppingCart.add(aShoppingItem: item3)
        
        XCTAssertEqual(item1.getCost(), 12.49)
        XCTAssertEqual(item2.getCost(), 16.49)
        XCTAssertEqual(item3.getCost(), 0.85)
        
        XCTAssertEqual(shoppingCart.getTotalTaxes(), 1.5, "Shopping Cart total taxes calculation incorrect.")
        XCTAssertEqual(shoppingCart.getTotal(), 29.83, "Shopping Cart total calculation incorrect.")
    }
    
    func testOutputTwo() {
        
        let product1 = Product(aName:"imported box of chocolate", aPrice:10.00, aType:.Food, aOrigin:.Imported);
        let product2 = Product(aName:"imported bottle of perfume", aPrice:47.50, aType:.Other, aOrigin:.Imported);
        
        let taxCalculator = TaxCalculator()
        
        let item1 = ShoppingItem(aProduct: product1, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item2 = ShoppingItem(aProduct: product2, aQuantity: 1, aTaxCalculator: taxCalculator)
        
        let shoppingCart = ShoppingCart()
        shoppingCart.add(aShoppingItem: item1)
        shoppingCart.add(aShoppingItem: item2)
        
        XCTAssertEqual(item1.getCost(), 10.50);
        XCTAssertEqual(item2.getCost(), 54.65);
        
        ///Shopping cart output.
        XCTAssertEqual(shoppingCart.getTotalTaxes(), 7.65, "Shopping Cart total taxes calculation incorrect.");
        XCTAssertEqual(shoppingCart.getTotal(), 65.15, "Shopping Cart total calculation incorrect.");
    }
    
    func testOutputThree() {
        
        let product1 = Product(aName:"imported bottle of perfume", aPrice:27.99, aType:.Other, aOrigin:.Imported);
        let product2 = Product(aName:"bottle of perfume", aPrice:18.99, aType:.Other, aOrigin:.Local);
        let product3 = Product(aName:"packet of headachepills", aPrice:9.75, aType:.Medical, aOrigin:.Local);
        let product4 = Product(aName:"packet of headachepills", aPrice:11.25, aType:.Food, aOrigin:.Imported);

        let taxCalculator = TaxCalculator()

        let item1 = ShoppingItem(aProduct: product1, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item2 = ShoppingItem(aProduct: product2, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item3 = ShoppingItem(aProduct: product3, aQuantity: 1, aTaxCalculator: taxCalculator)
        let item4 = ShoppingItem(aProduct: product4, aQuantity: 1, aTaxCalculator: taxCalculator)

        let shoppingCart = ShoppingCart()
        shoppingCart.add(aShoppingItem: item1)
        shoppingCart.add(aShoppingItem: item2)
        shoppingCart.add(aShoppingItem: item3)
        shoppingCart.add(aShoppingItem: item4)

        XCTAssertEqual(item1.getCost(), 32.19);
        XCTAssertEqual(item2.getCost(), 20.89);
        XCTAssertEqual(item3.getCost(), 9.75);
        XCTAssertEqual(item4.getCost(), 11.85);
        
        ///Shopping cart output.
        XCTAssertEqual(shoppingCart.getTotalTaxes(), 6.7, "Shopping Cart total taxes calculation incorrect.");
        XCTAssertEqual(shoppingCart.getTotal(), 74.68, "Shopping Cart total calculation incorrect.");
    }
}
