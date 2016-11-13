//
//  Receipt.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "Receipt.h"

@interface Receipt ()

/// Current shopping cart.
@property (nonatomic, strong) ShoppingCart *shoppingCart;

@end

@implementation Receipt

- (instancetype)initWithShoppingCart:(ShoppingCart *)aShoppingCart {
    
    self = [super init];
    
    if (self) {
        
        self.shoppingCart = aShoppingCart;
    }
    
    return self;
}

- (NSString *)generateReceipt{
    
    NSMutableString *receipt = [[NSMutableString alloc] initWithString:@"\n"];
        
    for (NSString* shoppingItemName in self.shoppingCart.shoppingItemKeyOrder) {
        
        ShoppingItem *shoppingItem = [self.shoppingCart.shoppingItemList objectForKey:shoppingItemName];
        
        NSString *shoppingItemRow = [NSString stringWithFormat:@"%d %@: %.2f \n",
                                     shoppingItem.quantity,
                                     shoppingItem.product.productName,
                                     [shoppingItem getCost]];
        
        [receipt appendString:shoppingItemRow];
    }
    
    NSString *totalTaxesRow = [NSString stringWithFormat:@"Sales Taxes: %.2f \n", [self.shoppingCart getTotalTaxes]];
    NSString *totalRow = [NSString stringWithFormat:@"Total: %.2f \n", [self.shoppingCart getTotal]];
    
    [receipt appendString:@"\n"];
    [receipt appendString:totalTaxesRow];
    [receipt appendString:totalRow];
    
    return receipt;
}

@end
