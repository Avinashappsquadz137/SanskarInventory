//
//  Requestdetailvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/09/24.
//

import UIKit

class Requestdetailvc: BaseVC {
    
    @IBOutlet weak var tabledetail:UITableView!
    
    var itemdetails = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        tabledetail.register(UINib(nibName: "RequestDetailCell", bundle: nil), forCellReuseIdentifier: "cell")
        tabledetail.delegate = self
        tabledetail.dataSource = self
    }
   
}

extension Requestdetailvc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemdetails.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RequestDetailCell
        let datum = itemdetails[indexPath.section]
 
        let item = itemdetails[indexPath.row]
           
           cell.configureCell(
               itemName: item.itemName,
               maxQuantity: item.quantity,
               selectedQuantity: item.category,
               rentPerItem: "5",
               totalRent: "5",
               gst: "5",
               isChecked: true
           )
        
//        cell.itemnamelabel.text = datum.itemName
//        cell.itemquantitylabel.text = "Max Quantity: " + datum.quantity
        
//        cell.openbtn.tag = indexPath.section
//                
//                cell.openbtn.addTarget(self, action: #selector(sendDetail(_:)), for: .touchUpInside)
        return cell
    }
    
//    @objc func sendDetail(_ sender: UIButton) {
//       
//           let section = sender.tag
//           
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Requestdetailvc") as! Requestdetailvc
//        
//        vc.itemdetails = dataList[section].items
//        
//        self.navigationController?.pushViewController(vc, animated: true)
//           
//           
//       
//  //         openNextPage(with: selectedItem)
//       }


    
}
