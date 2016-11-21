//
//  TaxCalculator.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

class TaxCalculator: TaxCalculatorDelegate {
    
    /**
     Get taxes rounded up for the product received as input.
     
     - parameter product: the product on which taxes will be calculated.
     
     - returns: taxes amount.
     */
    func getTaxes(product: Product) -> Float {
        
        var taxes:Float = 0.0
        
        var taxCalculatorContext = TaxCalculatorContext(aTaxStrategy: BasicTaxStrategy())
        taxes = taxCalculatorContext.calculateTax(product: product)
        
        taxCalculatorContext = TaxCalculatorContext(aTaxStrategy: ImportTaxStrategy())
        taxes = taxes + taxCalculatorContext.calculateTax(product: product)
        
        return self.roundUp(taxes: taxes)
    }
    
    /**
     Round up amount of taxes.
     
     - parameter taxes: taxes import to be rounded up.
     
     - returns: taxes rounded up.
     */
    private func roundUp(taxes:Float) -> Float {
        
        return (ceil(taxes * 20.0) / 20.0)
    }
}
