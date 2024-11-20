//
//  ItemDetailsFillVC.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 20/11/24.
//

import UIKit

class ItemDetailsFillVC: BaseVC {
    
    var itemdetails = [Item]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
       
    }
    func setupUI() {
        tableView.register(UINib(nibName: "RequestDetailCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
    }

}
extension ItemDetailsFillVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemdetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? RequestDetailCell else {
            return UITableViewCell()}
        let detail = itemdetails[indexPath.row]
        cell.configureCell(itemName: detail.itemName, maxQuantity: "5", selectedQuantity: detail.quantity, rentPerItem: "", totalRent: "", gst: "5", isChecked: false)
        return cell
    }
    
}
