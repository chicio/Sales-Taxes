//
//  ShoppingCell.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingCell : UITableViewCell

/// Product name.
@property (weak, nonatomic) IBOutlet UILabel *productName;
/// Product origin.
@property (weak, nonatomic) IBOutlet UILabel *productOrigin;
/// Product type.
@property (weak, nonatomic) IBOutlet UILabel *productType;
/// Product price.
@property (weak, nonatomic) IBOutlet UILabel *productPrice;

@end
