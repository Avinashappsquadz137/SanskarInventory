//
//  Requestdetailvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/09/24.
//

import UIKit

class Requestdetailvc: UIViewController {
    
    @IBOutlet weak var tabledetail:UITableView!
    
    var itemdetails = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tabledetail.register(UINib(nibName: "requestdetailcell", bundle: nil), forCellReuseIdentifier: "requestdetailcell")
        tabledetail.delegate = self
        tabledetail.dataSource = self
      print(itemdetails)
    }
    

    @IBAction func backbtn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension Requestdetailvc: UITableViewDelegate,UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return itemdetails.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "requestdetailcell", for: indexPath) as! requestdetailcell
        let datum = itemdetails[indexPath.section]
        print(datum)
        cell.itemnamelabel.text = datum.itemName
        cell.itemquantitylabel.text = "Max Quantity: " + datum.quantity
        
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

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 170
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        if #available(iOS 15.0, *) {
            view.backgroundColor = UIColor.clear
        } else {
        }
        return view
    }
    
}
