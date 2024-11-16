//
//  requestdatacell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/09/24.
//

import UIKit


protocol RequestDataCellDelegate: AnyObject {
    func didTapOpenButton(at index: Int)
}


class requestdatacell: UITableViewCell {
    
    @IBOutlet weak var clientnamelbl:UILabel!
    @IBOutlet weak var contactpersonlbl:UILabel!
    @IBOutlet weak var locationlbl:UILabel!
    @IBOutlet weak var datelbl:UILabel!
    @IBOutlet weak var mainview:UIView!
    @IBOutlet weak var openbtn:UIButton!
    
    
    weak var delegate: RequestDataCellDelegate?
        var sectionIndex: Int?
    

    override func awakeFromNib() {
        super.awakeFromNib()
        self.mainview.layer.cornerRadius = 10
        openbtn.addTarget(self, action: #selector(openButtonTapped), for: .touchUpInside)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @objc func openButtonTapped() {
            if let index = sectionIndex {
                delegate?.didTapOpenButton(at: index)
            }
        }
    
}
