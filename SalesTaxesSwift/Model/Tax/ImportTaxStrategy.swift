//
//  ImportTaxStrategy.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import Foundation

/**
 A class that implements the import tax algorithm.
 */
class ImportTaxStrategy: TaxCalculationStrategy {
    
    /**
     Calculate tax using a "import tax" algorithm.
     
     - parameter product: product on which taxes will be calculated.
     
     - returns: the amount of taxes to be paid.
     */
    func calculateTax(product: Product) -> Float {
        
        //On books, food and medical product no basis taxis.
        if product.productOrigin != .Imported  {
            
            return 0.0;
        }
        
        //5% tax on imported product.
        return product.productPrice * 0.05;
    }
}
