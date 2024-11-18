//
//  ChallanViewCell.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/11/24.
//

import UIKit

class ChallanViewCell: UITableViewCell {
    
    @IBOutlet weak var lblClientName: UILabel!
    @IBOutlet weak var lblContactPerson: UILabel!
    @IBOutlet weak var lblVanue: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var btnOpen: UIButton!
    
    
    var buttonAction: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configure(with detail: InventoryDetail) {
        lblClientName.attributedText = formattedText(label: "CLIENT NAME", value: detail.clientName ?? "")
        lblContactPerson.attributedText = formattedText(label: "CONTACT PERSON", value: detail.contactPerson ?? "")
        lblVanue.attributedText = formattedText(label: "VANUE", value: detail.toLocation ?? "")
        lblDate.attributedText = formattedText(label: "SHOW DATE", value: detail.showDate ?? "")
        btnOpen.setTitle("OPEN DETAILS", for: .normal)
    }

    
    func configures(with detail: InventoryDetail) {
        lblClientName.attributedText = formattedText(label: "CLIENT NAME", value: detail.clientName ?? "")
        lblContactPerson.attributedText = formattedText(label: "CONTACT PERSON", value: detail.contactPerson ?? "")
        lblVanue.attributedText = formattedText(label: "VANUE", value: detail.toLocation ?? "")
        lblDate.attributedText = formattedText(label: "SHOW DATE", value: detail.showDate ?? "")
        btnOpen.setTitle("OPEN PDF", for: .normal)
    }
    private func formattedText(label: String, value: String) -> NSAttributedString {
        let attributedString = NSMutableAttributedString()

        // Bold Label
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.boldSystemFont(ofSize: 14),
            .foregroundColor: UIColor.black
        ]
        let labelText = NSAttributedString(string: "\(label): ", attributes: labelAttributes)
        attributedString.append(labelText)

        // Regular Value
        let valueAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.systemFont(ofSize: 15),
            .foregroundColor: UIColor.darkGray
        ]
        let valueText = NSAttributedString(string: value, attributes: valueAttributes)
        attributedString.append(valueText)

        return attributedString
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    @IBAction func btnActions(_ sender: UIButton) {
        buttonAction?()
    }
    
    
}


/*
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

 */
