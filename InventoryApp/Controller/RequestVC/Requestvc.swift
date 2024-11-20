//
//  Requestvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 03/08/24.
//

import UIKit

class Requestvc: BaseVC {
    
    @IBOutlet weak var tableview:UITableView!
    
    var dataList = [ItemDetail]()

    override func viewDidLoad() {
        super.viewDidLoad()
         uiUpdate()
    }

    func uiUpdate() {
        tableview.register(UINib(nibName: "ChallanViewCell", bundle: nil), forCellReuseIdentifier: "cell")
        tableview.delegate = self
        tableview.dataSource = self
        getRequestDetail()
    }
}

extension Requestvc: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ChallanViewCell else {
                   return UITableViewCell()}
        let detail = dataList[indexPath.row]
            cell.configurees(with: detail)
            cell.buttonAction = { [weak self] in
                self?.didTapOpenButton(at: indexPath.row)
                print("Button tapped for \(detail.clientName)")
                
            }
        return cell
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

// MARK: - Button Action Handlers
extension Requestvc {
    
    private func didTapOpenButton(at index: Int) {
        let selectedItem = dataList[index]
        let itemsList = selectedItem.items
        openItemsList(itemsList, tempID: selectedItem.tempID)
    }
    private func openItemsList(_ items: [Item], tempID: String) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "Requestdetailvc") as? Requestdetailvc else {
            return
        }
        vc.itemdetails = items
        vc.tempID = tempID
        navigationController?.pushViewController(vc, animated: true)
    }
}
//MARK: - API Calling
extension Requestvc {
    func getRequestDetail() {
            var dict = [String: Any]()
            dict["emp_code"] = "SANS-00290"
        APIManager.apiCall(postData: dict as NSDictionary, url: Constant.requestdetailapi) { result, response, error, data in
                if let JSONData = data {
                    do {
                        let response = try JSONDecoder().decode(Requestresponsedata.self, from: JSONData)
                        if response.status {
                            self.dataList = response.data ?? []
                            DispatchQueue.main.async {
                                self.tableview.reloadData()
                            }
                        } else {
                            print(response.message)
                        }
                    } catch {
                        print("Error decoding JSON: \(error)")
                    }
                } else if let error = error {
                    print("API call error: \(error)")
                }
            }
        }
}
