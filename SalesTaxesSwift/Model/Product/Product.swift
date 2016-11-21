//
//  Product.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

class Product {
    
    /// The name of the product.
    public private(set) var productName:String
    /// Product price.
    public private(set) var productPrice:Float
    /// Product type.
    public private(set) var productType:ProductType
    /// Property origin.
    public private(set) var productOrigin:ProductOrigin
    
    /*!
     Constructor.
     
     @param aName new product name.
     @param aPrice new product price.
     @param aType new product type.
     @param aOrigin new product origin.
     
     @returns Product instance.
     */
    init(aName:String, aPrice:Float, aType:ProductType, aOrigin:ProductOrigin) {
        
        self.productName = aName
        self.productPrice = aPrice
        self.productType = aType
        self.productOrigin = aOrigin
    }
}
