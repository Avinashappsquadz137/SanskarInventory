//
//  ViewDesign.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 16/11/24.
//

import Foundation
import UIKit

@IBDesignable
class RoundedView: UIView {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
            self.layer.masksToBounds = true
        }
    }
}
