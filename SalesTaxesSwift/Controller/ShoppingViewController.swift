//
//  ViewController.swift
//  SalesTaxesSwift
//
//  Created by Fabrizio Duroni on 20/11/2016.
//  Copyright © 2016 Fabrizio Duroni. All rights reserved.
//

import UIKit

class ShoppingViewController: UITableViewController {
    
    /// Product list that could be selected.
    private var productList:[Product] = [Product]()
    /// Shopping cart.
    private var shoppingCart:ShoppingCart = ShoppingCart()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //Static load (demo...)
        self.productList.append(Product(aName:"book", aPrice:12.49, aType:.Book, aOrigin:.Local))
        self.productList.append(Product(aName:"music", aPrice:14.99, aType:.Other, aOrigin:.Local))
        self.productList.append(Product(aName:"chocolate", aPrice:0.85, aType:.Food, aOrigin:.Local))
        self.productList.append(Product(aName:"imported box of chocolate", aPrice:10.00, aType:.Food, aOrigin:.Imported))
        self.productList.append(Product(aName:"imported perfume chanel", aPrice:47.50, aType:.Other, aOrigin:.Imported))
        self.productList.append(Product(aName:"imported perfume armani", aPrice:27.99, aType:.Other, aOrigin:.Imported))
        self.productList.append(Product(aName:"bottle of perfume", aPrice:18.99, aType:.Other, aOrigin:.Local))
        self.productList.append(Product(aName:"packet of headachepills", aPrice:9.75, aType:.Medical, aOrigin:.Local))
        self.productList.append(Product(aName:"box of imported chocolates", aPrice:11.25, aType:.Food, aOrigin:.Imported))
    }
    
    //MARK: UITableView delegate
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.productList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:ShoppingCell = tableView.dequeueReusableCell(withIdentifier:"ShoppingCell", for:indexPath) as! ShoppingCell
        
        let product:Product = self.productList[indexPath.row]
        
        cell.productName.text = product.productName
        cell.productType.text = product.productType.rawValue
        cell.productOrigin.text = product.productOrigin.rawValue
        cell.productPrice.text = String(format:"%.2f", product.productPrice)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell:UITableViewCell = tableView.cellForRow(at: indexPath)!
        
        let product:Product = self.productList[indexPath.row]
        
        if cell.accessoryType == .checkmark {
            
            //Remove product from shopping cart.
            self.shoppingCart.remove(shoppingItemName: product.productName)
            
            cell.accessoryType = .none
        } else {
            
            //Add product to shopping cart.
            //Use UIAlertController to get the quantity for the product selected.
            let quantityAlertController = UIAlertController(title: "Quantity",
                                                            message: "Insert quantity",
                                                            preferredStyle: .alert)
            
            quantityAlertController.addTextField(configurationHandler:{ (textField) in
                
                textField.placeholder = "Quantity"
                textField.text = "1"
            })
            
            quantityAlertController.addAction(UIAlertAction(title:"OK",
                                                            style:UIAlertActionStyle.default,
                                                            handler:{ (action) in
                                                                
                    if let quantityField = quantityAlertController.textFields?[0] {
                                                                    
                        var quantity:Int = Int(quantityField.text!)!
                                                                    
                        if quantity == 0 {
                                                                        
                            quantity = 1
                        }
                                                                    
                        let item = ShoppingItem(aProduct: product, aQuantity:quantity, aTaxCalculator: TaxCalculator())
                        self.shoppingCart.add(aShoppingItem: item)
                    }
                })
            )
            
            self.present(quantityAlertController, animated: true, completion: nil)
            
            cell.accessoryType = .checkmark
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 75.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ReceiptSegue" {
            
            let receiptController:ReceiptViewController = segue.destination as! ReceiptViewController
            receiptController.receipt = Receipt(aShoppingCart: self.shoppingCart)
        }
    }
    
    override func didReceiveMemoryWarning() {
        
        super.didReceiveMemoryWarning()
    }
}
