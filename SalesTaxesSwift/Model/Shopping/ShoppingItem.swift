//
//  ShoppingItem.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation
/**
 A class used to describe an item of the shopping cart.
 It is composed of a product and a quantity value.
*/
class ShoppingItem {

    /// Product to be purchased.
    public private(set) var product:Product
    /// Quantity of product to be purchased.
    public private(set) var quantity:Int
    /// Tax Calculator delegate.
    private var taxCalculator:TaxCalculatorDelegate
    
    /*!
     Constructor.
     
     - parameter aProduct: the product associated with the shopping item.
     - parameter aQuantity: the quantity associated with the shopping item.
     - parameter aTaxCalculator: a tax calculator for the shopping item.
     
     - returns: ShoppingItem instance.
     */
    init(aProduct:Product, aQuantity:Int, aTaxCalculator:TaxCalculatorDelegate) {
        
        self.product = aProduct
        self.quantity = aQuantity
        self.taxCalculator = aTaxCalculator
    }
    
    /**
     Get cost of the shopping item.
     The price returned is equal to:
     
     cost = quantity * (product price + taxes)
     */
    func getCost() -> Float {
        
        let shoppingItemCost = (Float)(self.quantity) * self.product.productPrice + self.getTaxes()
        
        return shoppingItemCost
    }
    
    /**
     Get taxes of the shopping item.
     The amount of taxes returned is equal to:
     
     taxes = quantity * taxes
     */
    func getTaxes() -> Float {
        
        let taxes = (Float)(self.quantity) * self.taxCalculator.getTaxes(product: self.product)
        
        return taxes
    }
}
