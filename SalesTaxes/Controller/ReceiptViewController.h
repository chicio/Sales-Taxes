//
//  ReceiptViewController.h
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Receipt.h"

@interface ReceiptViewController : UIViewController

/// Receipt object model.
@property (nonatomic, strong) Receipt *receipt;

@end
