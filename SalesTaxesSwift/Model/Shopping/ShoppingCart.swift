//
//  ShoppingCart.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to describe a shopping cart.
 It is composed of a list of shopping item (ShoppingItem class).
 */
class ShoppingCart {

    /// Array of the key of shopping item ordered based on insertion (so we keep the same order in output).
    private(set) var shoppingItemKeyOrder:[String]
    /// Shopping items list. Use NSMutableDictionary to ensure uniqueness of the item (same as hash map in Java/C++).
    private(set) var shoppingItemList:[String:ShoppingItem]
    /// Total amount of cart (based on current items contained in it).
    private var totalCart:Float
    /// Total amount of taxes of cart (based on current items).
    private var totalTaxes:Float
    
    /**
     Constructor.
     
     - returns: a ShoppingCart instance.
     */
    init() {
        
        self.shoppingItemKeyOrder = [String]()
        self.shoppingItemList = [String:ShoppingItem]()
        self.totalCart = 0
        self.totalTaxes = 0
    }
    
    /**
     Add shopping item to shopping cart.
     
     - parameter shoppingItem: the shopping item to be added.
     */
    func add(aShoppingItem:ShoppingItem) -> Void {
        
        self.totalCart = self.totalCart + aShoppingItem.getCost()
        self.totalTaxes = self.totalTaxes + aShoppingItem.getTaxes()
        
        self.shoppingItemList[aShoppingItem.product.productName] = aShoppingItem
        self.shoppingItemKeyOrder.append(aShoppingItem.product.productName)
    }
    
    /**
     Remove shopping item using given name from the shopping cart.
     
     - parameter shoppingItemName: the shopping item name of the shopping item to be removed.
     */
    func remove(shoppingItemName:String) -> Void {
        
        if let shoppingItem = self.shoppingItemList[shoppingItemName],
           let shoppingItemNameIndex = self.shoppingItemKeyOrder.index(of: shoppingItemName) {
            
            self.totalCart = self.totalCart - shoppingItem.getCost()
            self.totalTaxes = self.totalTaxes - shoppingItem.getTaxes()
            
            self.shoppingItemList.removeValue(forKey: shoppingItemName)
            self.shoppingItemKeyOrder.remove(at: shoppingItemNameIndex)
        }
    }
    
    /**
     Get total price of the current shopping cart.
     
     - returns: total of the shopping cart.
     */
    func getTotal() -> Float {
        
        return self.totalCart
    }
    
    /**
     Get total taxes of the current shopping cart.
     
     - returns: total taxes of the shopping cart.
     */
    func getTotalTaxes() -> Float {
        
        return self.totalTaxes
    }
}
