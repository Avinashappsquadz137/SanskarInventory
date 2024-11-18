//
//  RequestDetailCell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/11/24.
//

import UIKit

class RequestDetailCell: UITableViewCell {
    
    @IBOutlet weak var lblItemName: UILabel!
    @IBOutlet weak var lblMaxQuality: UILabel!
    @IBOutlet weak var lblSelectedQuantity: UILabel!
    @IBOutlet weak var lblTotalRent: UILabel!
    @IBOutlet weak var txtfieldRentPerItem: UITextField!
    @IBOutlet weak var lblGST: UILabel!
    @IBOutlet weak var imgcheckUncheck: UIImageView!
    @IBOutlet weak var btnShowScannedItem: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func configureCell(itemName: String,maxQuantity: String,selectedQuantity: String,rentPerItem: String,totalRent: String,gst: String,isChecked: Bool) {
        lblItemName.text = itemName
        lblMaxQuality.text = "Max Quantity: \(maxQuantity)"
        lblSelectedQuantity.text = "Selected Quantity: \(selectedQuantity)"
        lblTotalRent.text = "Total Rent: \(totalRent)"
        lblGST.text = "Include GST: \(gst)%"
        btnShowScannedItem.setTitle("SHOW SCANNED ITEMS", for: .normal)
        txtfieldRentPerItem.text = "\(rentPerItem)"
        
        // Configure image
       // imgcheckUncheck.image = isChecked ? UIImage(named: "checked_icon") : UIImage(named: "unchecked_icon")
    }
    
    @IBAction func btnActionShowScannedItem(_ sender: Any) {
        
        
    }
    
}
