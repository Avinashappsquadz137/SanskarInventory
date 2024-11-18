//
//  submitchallanvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 30/07/24.
//

import UIKit

class submitchallanvc: UIViewController {
    
    @IBOutlet weak var tableview:UITableView!
    
    var dataList: [InventoryDetail] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.register(UINib(nibName: "datatablecell", bundle: nil), forCellReuseIdentifier: "datatablecell")
        tableview.delegate = self
        tableview.dataSource = self
       //getsubmiteddetail()
        apiclall()
        
    }
    func apiclall() {
            var dict = [String: Any]()
            dict["emp_code"] = "SANS-00290" // Use the correct key as per the API error message
            dict["type"] = "1"
            ApiClient.shared.callmethodMultipart(apiendpoint: Constant.submitedlistapi, method: .post, param: dict, model: InventoryResponse.self){ result in
                switch result {
                case .success(let model):
                   
                    
                    print(model)
                 
                    
                case .failure(let error):
                    print(error)
                }
            }
        }
    
    func getsubmiteddetail() {
        var dict = [String: Any]()
        dict["emp_code"] = "SANS-00290" // Use the correct key as per the API error message
        dict["type"] = "1"
        
        APIManager.apiCall(postData: dict as NSDictionary, url: submitedlistapi) { result, response, error, data in
            DispatchQueue.main.async {
                Loader.hideLoader()
            }
            if let JSONData = data {
                print(JSONData)
                do {
                    let welcome = try JSONDecoder().decode(InventoryResponse.self, from: JSONData)
                    if welcome.status ?? false {
                        self.dataList = welcome.data ?? []
                        DispatchQueue.main.async {
                            self.tableview.reloadData() // Assuming you have an IBOutlet for the table view
                        }
                    } else {
                        print(welcome.message)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            } else if let error = error {
                print("API call error: \(error)")
            }
        }
    }


        
    
    

    @IBAction func backbtn(_ sender: UIButton) {
        
        self.navigationController?.popViewController(animated: true)
        
    }


}
extension submitchallanvc: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "datatablecell", for: indexPath) as! datatablecell
        let datum = dataList[indexPath.section]
        cell.dateLbl.text = datum.showDate
        cell.locationlbl.text = datum.toLocation
        cell.clientnamelbl.text = datum.clientName
        cell.contactpersonname.text = datum.contactPerson
        cell.openbtn.setTitle("Open Pdf", for: .normal)
        
        
        
        cell.buttonAction = { [weak self] in
                  // self?.openPDF(for: indexPath.section)
               }
        return cell
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        if #available(iOS 15.0, *) {
            view.backgroundColor = UIColor.clear
        } else {
        }
        return view
    }
    
//    func openPDF(for section: Int) {
//           let pdfData = dataList[section].challanDetail
//           let pdfBaseURL = "https://sap.sanskargroup.in/Files/"
//        let pdfURLString = pdfBaseURL + pdfData
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


