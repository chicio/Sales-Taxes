//
//  BasicTaxStrategy.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "BasicTaxStrategy.h"

@implementation BasicTaxStrategy

- (float)calculateTax:(Product *)product {
    
    //On books, food and medical product no basis taxis.
    if (product.productType == Book || product.productType == Food || product.productType == Medical) {
        
        return 0.0f;
    }
    
    //10% basis taxes.
    return product.productPrice * 0.1f;
}

@end
