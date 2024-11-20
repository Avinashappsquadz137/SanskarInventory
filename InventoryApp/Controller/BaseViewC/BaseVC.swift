//
//  BaseVC.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 16/11/24.
//

import UIKit

class BaseVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
