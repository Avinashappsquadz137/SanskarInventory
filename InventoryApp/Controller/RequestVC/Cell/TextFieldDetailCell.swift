//
//  TextFieldDetailCell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 20/11/24.
//

import UIKit

class TextFieldDetailCell: UITableViewCell {
    
    @IBOutlet weak var topTextFieldPlaceHolder: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

       
    }
    
}
