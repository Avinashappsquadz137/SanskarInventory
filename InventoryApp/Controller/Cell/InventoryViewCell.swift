//
//  InventoryViewCell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 16/11/24.
//

import UIKit

class InventoryViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imgIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func configureCell(with name: String, image: UIImage?) {
        lblName?.text = name
        imgIcon?.image = image
    }
}
