//
//  ShoppingCartViewController.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 11/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ShoppingViewController.h"
#import "ReceiptViewController.h"
#import "ShoppingCell.h"
#import "Product.h"
#import "ShoppingItem.h"
#import "ShoppingCart.h"
#import "Receipt.h"

@interface ShoppingViewController ()

/// Product list that could be selected.
@property (nonatomic, strong) NSArray<Product *> *productList;
/// Shopping cart.
@property (nonatomic, strong) ShoppingCart *shoppingCart;

@end

@implementation ShoppingViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    //Static produc list (demo...).
    self.productList = @[
            [[Product alloc] initWithName:@"book" andPrice:12.49f andType:Book andOrigin:Local],
            [[Product alloc] initWithName:@"music" andPrice:14.99f andType:Other andOrigin:Local],
            [[Product alloc] initWithName:@"chocolate" andPrice:0.85f andType:Food andOrigin:Local],
            [[Product alloc] initWithName:@"imported box of chocolate"  andPrice:10.00f andType:Food andOrigin:Imported],
            [[Product alloc] initWithName:@"imported perfume chanel" andPrice:47.50f andType:Other andOrigin:Imported],
            [[Product alloc] initWithName:@"imported perfume armani" andPrice:27.99f andType:Other andOrigin:Imported],
            [[Product alloc] initWithName:@"bottle of perfume" andPrice:18.99f andType:Other andOrigin:Local],
            [[Product alloc] initWithName:@"packet of headache pills" andPrice:9.75f  andType:Medical andOrigin:Local],
            [[Product alloc] initWithName:@"box of imported chocolates" andPrice:11.25f andType:Food andOrigin:Imported]
    ];
    
    //Start shopping cart.
    self.shoppingCart = [[ShoppingCart alloc] init];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.productList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ShoppingCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShoppingCell" forIndexPath:indexPath];
    
    Product *product = [self.productList objectAtIndex:indexPath.row];
    
    //Setup cell with product data.
    cell.productName.text = product.productName;
    cell.productType.text = ProducTypeString(product.productType);
    cell.productOrigin.text = ProductOriginString(product.productOrigin);
    cell.productPrice.text = [NSString stringWithFormat:@"%.2f", product.productPrice];
    
    return cell;
}

#pragma mark UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];

    Product *product = [self.productList objectAtIndex:indexPath.row];

    if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {

        //Remove product from shopping cart.
        [self.shoppingCart remove:[product productName]];

        cell.accessoryType = UITableViewCellAccessoryNone;
    } else {
        
        //Add product to shopping cart.
        //Use UIAlertController to get the quantity for the product selected.
        UIAlertController * quantityAlertController = [UIAlertController alertControllerWithTitle:@"Quantity"
                                                                                          message:@"Insert quantity"
                                                                                   preferredStyle:UIAlertControllerStyleAlert];
        
        [quantityAlertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
            
            textField.placeholder = @"Quantity";
            textField.text = @"1";
        }];
        
        [quantityAlertController addAction:[UIAlertAction actionWithTitle:@"OK"
                                                                    style:UIAlertActionStyleDefault
                                                                  handler:^(UIAlertAction *action) {
                                                                      
            NSArray * textfields = quantityAlertController.textFields;
            UITextField *quantityField = textfields[0];
            int quantity = [quantityField.text intValue];
                                                                      
            //If quantity is not valid insert default = 1.
            if (quantity == 0) {
                
                quantity = 1;
            }
                                                                      
            //Add product with quantity as shopping item to the shopping cart.
            TaxCalculator *taxCalculator = [[TaxCalculator alloc] init];
            ShoppingItem *item = [[ShoppingItem alloc] initWithProduct:product
                                                           andQuantity:quantity
                                                      andTaxCalculator:taxCalculator];
                                                      
            [self.shoppingCart add:item];
                                                              
        }]];
        
        [self presentViewController:quantityAlertController animated:YES completion:nil];
        
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
 
    return 75.f;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"ReceiptSegue"]) {
        
        ReceiptViewController *receiptController = (ReceiptViewController *)segue.destinationViewController;
        receiptController.receipt = [[Receipt alloc] initWithShoppingCart:self.shoppingCart];
    }
}

- (void)didReceiveMemoryWarning {

    [super didReceiveMemoryWarning];
}

@end
