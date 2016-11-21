//
//  Receipt.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 21/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class used to describe a receipt.
 A receipt is generated from the shopping cart items.
 */
class Receipt {
    
    /// Current shopping cart.
    private var shoppingCart:ShoppingCart
    
    /**
     Constructor.
     
     - parameter aShoppingCart: shopping cart on which the receipt will be calculated.
     
     - returns: Receipt instance.
     */
    init(aShoppingCart:ShoppingCart) {
        
        self.shoppingCart = aShoppingCart
    }
    
    /**
     Generate receipt using the shopping cart received as parameter.
     
     - returns: receipt content.
     */
    func generateReceipt() -> String {
        
        var receipt:String = ""
        
        for shoppingItemName in self.shoppingCart.shoppingItemKeyOrder {
            
            if let shoppingItem = self.shoppingCart.shoppingItemList[shoppingItemName] {
            
                let shoppingItemRow:String = String(format: "%d %@ %.2f \n",
                                                    shoppingItem.quantity,
                                                    shoppingItem.product.productName,
                                                    shoppingItem.getCost())
                
                receipt.append(shoppingItemRow)
            }
        }
        
        let totalTaxesRow = String(format: "Sales Taxes %.2f \n", self.shoppingCart.getTotalTaxes())
        let totalRow = String(format: "Total: %.2f \n", self.shoppingCart.getTotal())
        
        receipt.append("\n")
        receipt.append(totalTaxesRow)
        receipt.append(totalRow)
        
        return receipt
    }
}
