//
//  Receipt.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 12/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "Receipt.h"

@implementation Receipt

- (NSString *)generateReceipt:(ShoppingCart *)shoppingCart {
    
    NSMutableString *receipt = [[NSMutableString alloc] initWithString:@"\n"];
        
    for (NSString* shoppingItemName in shoppingCart.shoppingItemKeyOrder) {
        
        ShoppingItem *shoppingItem = [shoppingCart.shoppingItemList objectForKey:shoppingItemName];
        
        NSString *shoppingItemRow = [NSString stringWithFormat:@"%d %@: %.2f \n",
                                     shoppingItem.quantity,
                                     shoppingItem.product.productName,
                                     [shoppingItem getCost]];
        
        [receipt appendString:shoppingItemRow];
    }
    
    NSString *totalTaxesRow = [NSString stringWithFormat:@"Sales Taxes: %.2f \n", [shoppingCart getTotalTaxes]];
    NSString *totalRow = [NSString stringWithFormat:@"Total: %.2f \n", [shoppingCart getTotal]];
    
    [receipt appendString:totalTaxesRow];
    [receipt appendString:totalRow];
    
    return receipt;
}

@end
