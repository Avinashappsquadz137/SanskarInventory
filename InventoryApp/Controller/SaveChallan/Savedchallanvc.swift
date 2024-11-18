//
//  Savedchallanvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 03/08/24.
//

import UIKit

class Savedchallanvc: BaseVC {
    
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
        apiSubmitList()
    }
}


extension Savedchallanvc: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return dataList.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ChallanViewCell
        
        let detail = dataList[indexPath.section]
        cell.configure(with: detail)
        cell.buttonAction = {
            print("Button tapped for \(detail.clientName)")
        }
        
        return cell
    }
    @objc func opendata(_ sender: UIButton) {
        let section = sender.tag
        let datum = dataList[section]
        }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        if #available(iOS 15.0, *) {
            view.backgroundColor = UIColor.clear
        } else {
        }
        return view
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 15
    }
}


//MARK: - API Calling
extension Savedchallanvc {
    func apiSubmitList() {
        var dict = [String: Any]()
        dict["emp_code"] = "SANS-00290"
        dict["type"] = "0"
        ApiClient.shared.callmethodMultipart(apiendpoint: Constant.submitedlistapi, method: .post, param: dict, model: InventoryResponse.self) { result in
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
