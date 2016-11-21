//
//  ShoppingCell.swift
//  SalesTaxes
//
//  Created by Fabrizio Duroni on 21/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ShoppingCell: UITableViewCell {

    /// Product name.
    @IBOutlet weak var productName: UILabel!
    /// Product origin.
    @IBOutlet weak var productOrigin: UILabel!
    /// Product type.
    @IBOutlet weak var productType: UILabel!
    /// Product price.
    @IBOutlet weak var productPrice: UILabel!    
    
    override func awakeFromNib() {

        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)
    }
}
