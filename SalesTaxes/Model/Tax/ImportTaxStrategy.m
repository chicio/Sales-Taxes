//
//  ImportTaxStrategy.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ImportTaxStrategy.h"

@implementation ImportTaxStrategy

- (float)calculateTax:(Product *)product {
    
    //Tax applied only on imported product.
    if (product.productOrigin != Imported) {
        
        return 0.0f;
    }
    
    //5% tax on imported product.
    return product.productPrice * 0.05f;
}

@end
