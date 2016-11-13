//
//  ReceiptViewController.m
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 13/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

#import "ReceiptViewController.h"

@interface ReceiptViewController ()

/// Receipt content label.
@property (weak, nonatomic) IBOutlet UILabel *receiptContentLabel;

@end

@implementation ReceiptViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    //Create receipt.
    self.receiptContentLabel.text = [self.receipt generateReceipt];
}

@end
