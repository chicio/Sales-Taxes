//
//  ViewController.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 11/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ViewController.h"

#import "Product.h"
#import "ShoppingItem.h"
#import "ShoppingCart.h"
#import "Receipt.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    Product *product1 = [[Product alloc] initWithName:@"book" andPrice:12.49f andType:Book andOrigin:Local];
//    Product *product2 = [[Product alloc] initWithName:@"music" andPrice:14.99f andType:Other andOrigin:Local];
//    Product *product3 = [[Product alloc] initWithName:@"chocolate" andPrice:0.85f andType:Food andOrigin:Local];
//    
//    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1];
//    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1];
//    ShoppingItem *item3 = [[ShoppingItem alloc] initWithProduct:product3 andQuantity:1];
//    
//    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
//    [shoppingCart add:item1];
//    [shoppingCart add:item2];
//    [shoppingCart add:item3];
//    
//    Receipt *receipt = [[Receipt alloc] init];
//    NSLog(@"\n\n\n\n\n");
//    NSLog(@"%@", [receipt generateReceipt:shoppingCart]);
    
    TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];

    Product *product1 = [[Product alloc] initWithName:@"imported box of chocolate"  andPrice:10.00f andType:Food   andOrigin:Imported];
    Product *product2 = [[Product alloc] initWithName:@"imported bottle of perfume" andPrice:47.50f andType:Other   andOrigin:Imported];
    
    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1 andTaxCalculator:taxCalculator];
    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1 andTaxCalculator:taxCalculator];
    
    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
    [shoppingCart add:item1];
    [shoppingCart add:item2];
    
    Receipt *receipt = [[Receipt alloc] init];
    NSLog(@"\n\n\n\n\n");
    NSLog(@"%@", [receipt generateReceipt:shoppingCart]);
    
//    Product *product1 = [[Product alloc] initWithName:@"imported bottle of perfume" andPrice:27.99f andType:Other   andOrigin:Imported];
//    Product *product2 = [[Product alloc] initWithName:@"bottle of perfume"          andPrice:18.99f andType:Other   andOrigin:Local];
//    Product *product3 = [[Product alloc] initWithName:@"packet of headachepills"    andPrice:9.75f  andType:Medical andOrigin:Local];
//    Product *product4 = [[Product alloc] initWithName:@"box of imported chocolates" andPrice:11.25f andType:Food    andOrigin:Imported];
//    
//    ShoppingItem *item1 = [[ShoppingItem alloc] initWithProduct:product1 andQuantity:1];
//    ShoppingItem *item2 = [[ShoppingItem alloc] initWithProduct:product2 andQuantity:1];
//    ShoppingItem *item3 = [[ShoppingItem alloc] initWithProduct:product3 andQuantity:1];
//    ShoppingItem *item4 = [[ShoppingItem alloc] initWithProduct:product4 andQuantity:1];
//    
//    ShoppingCart *shoppingCart = [[ShoppingCart alloc] init];
//    [shoppingCart add:item1];
//    [shoppingCart add:item2];
//    [shoppingCart add:item3];
//    [shoppingCart add:item4];
//    
//    Receipt *receipt = [[Receipt alloc] init];
//    NSLog(@"\n\n\n\n\n");
//    NSLog(@"%@", [receipt generateReceipt:shoppingCart]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
