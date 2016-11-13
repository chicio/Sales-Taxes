//
//  Product.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 11/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ProductType.h"
#import "ProductOrigin.h"

/*!
 A class used to describe a product.
 A product is composed of a name, a price, a type
 and an origin.
 */
@interface Product : NSObject

/// Product name. Unique for each product.
@property (readonly, nonatomic, strong) NSString *productName;
/// Product price.
@property (readonly, nonatomic, assign) float productPrice;
/// Product type.
@property (readonly, nonatomic, assign) ProductType productType;
/// Property origin.
@property (readonly, nonatomic, assign) ProductOrigin productOrigin;

/*!
 Constructor.
 
 @param aName new product name.
 @param aPrice new product price.
 @param aType new product type.
 @param aOrigin new product origin.
 
 @returns Product instance.
 */
- (instancetype)initWithName:(NSString *)aName andPrice:(float)aPrice andType:(ProductType)aType andOrigin:(ProductOrigin)aOrigin;

@end
