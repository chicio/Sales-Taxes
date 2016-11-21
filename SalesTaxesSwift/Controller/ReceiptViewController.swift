//
//  ReceiptViewController.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 21/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ReceiptViewController: UIViewController {
    
    /// Receipt content label.
    @IBOutlet weak var receiptContentLabel: UILabel!
    /// Receipt object model.
    var receipt:Receipt?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.receiptContentLabel.text = self.receipt?.generateReceipt()
    }

    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
}
