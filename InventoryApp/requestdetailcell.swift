//
//  requestdetailcell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 20/09/24.
//

import UIKit

class requestdetailcell: UITableViewCell {
    
    
    @IBOutlet weak var itemnamelabel:UILabel!
    @IBOutlet weak var itemquantitylabel:UILabel!
    @IBOutlet weak var itemselectquantitylabel:UILabel!
    @IBOutlet weak var itemscanbtn:UIButton!
    @IBOutlet weak var itemshowbtn:UIButton!
    @IBOutlet weak var backgview:UIView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgview.layer.cornerRadius = 10
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
