//
//  Requestvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 03/08/24.
//

import UIKit

class Requestvc: UIViewController {
    
    @IBOutlet weak var tableview:UITableView!
    
    var dataList = [ItemDetail]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.register(UINib(nibName: "requestdatacell", bundle: nil), forCellReuseIdentifier: "requestdatacell")
        tableview.delegate = self
        tableview.dataSource = self
       // getRequestDetail()
    }
    
//    func getRequestDetail() {
//            var dict = [String: Any]()
//            dict["emp_code"] = "SANS-00290"
//            
//        APIManager.apiCall(postData: dict as NSDictionary, url: Constant.requestdetailapi) { result, response, error, data in //Constant.submitedlistapi
//                DispatchQueue.main.async {
//                    Loader.hideLoader()
//                }
//                if let JSONData = data {
//                    print(JSONData)
//                    do {
//                        let response = try JSONDecoder().decode(Requestresponsedata.self, from: JSONData)
//                        if response.status {
//                            
//                            self.dataList = response.data
//                            print(self.dataList)
//                            DispatchQueue.main.async {
//                                self.tableview.reloadData()
//                            }
//                        } else {
//                            print(response.message)
//                        }
//                    } catch {
//                        print("Error decoding JSON: \(error)")
//                    }
//                } else if let error = error {
//                    print("API call error: \(error)")
//                }
//            }
//        }
    
    
    @IBAction func backbtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
}
extension Requestvc: UITableViewDelegate, UITableViewDataSource, RequestDataCellDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "requestdatacell", for: indexPath) as! requestdatacell
        let datum = dataList[indexPath.section]
        
        cell.clientnamelbl.text = datum.clientName
        cell.locationlbl.text = datum.toLocation
        cell.contactpersonlbl.text = datum.contactPerson
        cell.datelbl.text = datum.showDate
        cell.openbtn.setTitle("Open", for: .normal)
        
        // Set the delegate and section index for the cell
        cell.delegate = self
        cell.sectionIndex = indexPath.section
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.clear
        return view
    }
    
    // Delegate method to handle button tap
    func didTapOpenButton(at index: Int) {
        let itemsList = dataList[index].items
        openItemsList(itemsList)
    }
    
    func openItemsList(_ items: [Item]) {
        // Example to pass items to openpdfvc
        let vc = storyboard?.instantiateViewController(withIdentifier: "Requestdetailvc") as! Requestdetailvc
        vc.itemdetails = items // Assuming openpdfvc has a property `itemsList`
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    

    

    
//    func openPDF(for section: Int) {
//           let pdfData = dataList[section].challanDetail
//           let pdfBaseURL = "https://sap.sanskargroup.in/Files/"
//           let pdfURLString = pdfBaseURL + pdfData
//
//           if let pdfURL = URL(string: pdfURLString) {
//               let vc = self.storyboard?.instantiateViewController(withIdentifier: "openpdfvc") as! openpdfvc
//               vc.pdfURL = pdfURL
//               self.navigationController?.pushViewController(vc, animated: true)
//           } else {
//               // Handle invalid URL case
//               print("Invalid URL string: \(pdfURLString)")
//           }
//       }

    
}
