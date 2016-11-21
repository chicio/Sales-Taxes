//
//  BasicTaxStrategy.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class that implements the basic tax algorithm.
 */
class BasicTaxStrategy: TaxCalculationStrategy {
    
    /**
     Calculate tax using a "basic sale tax" algorithm.
     
     - parameter product: product on which taxes will be calculated.
     
     - returns: the amount of taxes to be paid.
     */
    func calculateTax(product: Product) -> Float {
        
        //On books, food and medical product no basis taxis.
        if product.productType == .Book || product.productType == .Food || product.productType == .Medical {
            
            return 0.0;
        }
        
        //10% basis taxes.
        return product.productPrice * 0.1;
    }
}
