//
//  TaxCalculatorDelegate.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/*!
 A protocol used to delegate the tax calculation.
 */
protocol TaxCalculatorDelegate: class {
    
    /**
     Get taxes rounded up for the product received as input.
     
     - parameter product: the product on which taxes will be calculated.
     
     - returns: taxes amount.
     */
    func getTaxes(product:Product) -> Float
}
