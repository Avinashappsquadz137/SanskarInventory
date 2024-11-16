//
//  datatablecell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 30/07/24.
//

import UIKit

class datatablecell: UITableViewCell {
    
    @IBOutlet weak var mainview: UIView!
    @IBOutlet weak var dateLbl: UILabel!
    @IBOutlet weak var locationlbl: UILabel!
    @IBOutlet weak var openbtn: UIButton!
    @IBOutlet weak var clientnamelbl: UILabel!
    @IBOutlet weak var contactpersonname: UILabel!
    
    
    var buttonAction: (() -> Void)?

       
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainview.layer.cornerRadius = 10
        dateLbl.textColor = UIColor.black
        locationlbl.textColor  = UIColor.black
      
    }

    @IBAction func openButtonTapped(_ sender: UIButton) {
        buttonAction?()
    }
    
}
