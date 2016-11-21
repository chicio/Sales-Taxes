//
//  TaxCalculatorContext.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

class TaxCalculatorContext {

    /// Current tax calculator strategy.
    private var taxCalculatorStrategy: TaxCalculationStrategy
    
    /**
     Constructor.
     
     - parameter aTaxStrategy: strategy to be used.
     
     - returns: a TaxCalculatorStrategy instance.
     */
    init(aTaxStrategy: TaxCalculationStrategy) {
        
        self.taxCalculatorStrategy = aTaxStrategy
    }
    
    /**
     Calculate tax using current strategy.
     
     - parameter product: on which taxes will be calculated.
     
     - returns: the amount of taxes to be paid.
     */
    func calculateTax(product:Product) -> Float {
        
        let taxes:Float = self.taxCalculatorStrategy.calculateTax(product: product)
        
        return taxes
    }
}
