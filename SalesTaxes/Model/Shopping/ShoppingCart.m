//
//  ShoppingCart.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ShoppingCart.h"

@interface ShoppingCart ()

/// Total of cart (based on current items).
@property (nonatomic, assign) float totalCart;
/// Total taxes of cart (based on current items).
@property (nonatomic, assign) float totalTaxes;
/// Array of the key of shopping item ordered based on insertion (so we keep the same order in output).
@property (readwrite, nonatomic, strong) NSMutableArray<NSString *> *shoppingItemKeyOrder;
/// Shopping items list. Use NSMutableDictionary to ensure uniqueness of the item (same as hash map in Java/C++).
@property (readwrite, nonatomic, strong) NSMutableDictionary<NSString*, ShoppingItem *> *shoppingItemList;

@end

@implementation ShoppingCart

- (instancetype)init {
    
    self = [super init];
    
    if (self) {
        
        self.shoppingItemKeyOrder = [NSMutableArray new];
        self.shoppingItemList = [NSMutableDictionary new];
    }
    
    return self;
}

- (void)add:(ShoppingItem *)shoppingItem {

    self.totalCart += [shoppingItem getCost];
    self.totalTaxes += [shoppingItem getTaxes];

    [self.shoppingItemList setObject:shoppingItem forKey:shoppingItem.product.productName];
    [self.shoppingItemKeyOrder addObject:shoppingItem.product.productName];
}

- (void)remove:(NSString *)shoppingItemName {
 
    ShoppingItem *shoppingItem = [self.shoppingItemList objectForKey:shoppingItemName];
    self.totalCart -= [shoppingItem getCost];
    self.totalTaxes -= [shoppingItem getTaxes];
    
    [self.shoppingItemList removeObjectForKey:shoppingItemName];
    [self.shoppingItemKeyOrder removeObject:shoppingItemName];
}

- (float)getTotal {
    
    return self.totalCart;
}

- (float)getTotalTaxes {
    
    return self.totalTaxes;
}

@end
