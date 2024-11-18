//
//  submitchallanvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 30/07/24.
//

import UIKit

class submitchallanvc: BaseVC {
    
    @IBOutlet weak var tableview:UITableView!
    
    var dataList: [InventoryDetail] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        uiUpdate()
    }
   
    func uiUpdate() {
        tableview.register(UINib(nibName: "ChallanViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        apiclall()
    }
}
//MARK: TableView

extension submitchallanvc: UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChallanViewCell
        let detail = dataList[indexPath.section]
        cell.configures(with: detail)
        cell.buttonAction = { [weak self] in
        self?.openPDF(for: indexPath.section)
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
    
    func openPDF(for section: Int) {
           let pdfData = dataList[section].challanDetail
           let pdfBaseURL = "https://sap.sanskargroup.in/Files/"
        let pdfURLString = pdfBaseURL + (pdfData ?? "")

           if let pdfURL = URL(string: pdfURLString) {
               let vc = self.storyboard?.instantiateViewController(withIdentifier: "openpdfvc") as! openpdfvc
               vc.pdfURL = pdfURL
               self.navigationController?.pushViewController(vc, animated: true)
           } else {
               print("Invalid URL string: \(pdfURLString)")
           }
       }
}

//MARK: API Calling
extension submitchallanvc {
    func apiclall() {
            var dict = [String: Any]()
            dict["emp_code"] = "SANS-00290"
            dict["type"] = "1"
            ApiClient.shared.callmethodMultipart(apiendpoint: Constant.submitedlistapi, method: .post, param: dict, model: InventoryResponse.self){ result in
                switch result {
                case .success(let model):
                    if let data = model.data {
                        self.dataList = data
                        DispatchQueue.main.async {
                            self.tableview.reloadData()
                        }
                    } else {
                        print("No data available in the response.")
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    
}

