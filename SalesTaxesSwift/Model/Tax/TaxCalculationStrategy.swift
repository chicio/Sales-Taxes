//
//  TaxCalculationStrategy.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A protocol that all tax algorithm strategy classes must adopt.
 */
protocol TaxCalculationStrategy: class {
    
    /**
     Calculate tax using a specific algorithm.
     All implementation of this method will contain
     a specific algorithm for tax calculation.
     
     - parameter product: product on which taxes will be calculated.
     
     - returns: the amount of taxes to be paid.
     */
    func calculateTax(product:Product) -> Float
}
