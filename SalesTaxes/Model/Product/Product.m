//
//  Product.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 11/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "Product.h"

@interface Product ()

/// Product name.
@property (readwrite, nonatomic, strong) NSString *productName;
/// Product price.
@property (readwrite, nonatomic, assign) float productPrice;
/// Product type.
@property (readwrite, nonatomic, assign) ProductType productType;
/// Property origin.
@property (readwrite, nonatomic, assign) ProductOrigin productOrigin;

@end

@implementation Product

- (instancetype)initWithName:(NSString *)aName andPrice:(float)aPrice andType:(ProductType)aType andOrigin:(ProductOrigin)aOrigin {
    
    self = [super init];
    
    if (self) {
        
        self.productName = aName;
        self.productPrice = aPrice;
        self.productType = aType;
        self.productOrigin = aOrigin;
    }
    
    return self;
}

@end
