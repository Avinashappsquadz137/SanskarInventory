//
//  Requestdetailvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 18/09/24.
//

import UIKit

class Requestdetailvc: BaseVC {
    
    @IBOutlet weak var tabledetail:UITableView!
    @IBOutlet weak var btnSubmit: UIButton!
    var itemdetails = [Item]()
    
    var data = ["Name", "SurName", "Fullname", "Hello", "Example", "Another Example"]
    var textFieldValues: [String] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        textFieldValues = Array(repeating: "", count: data.count)
        tabledetail.register(UINib(nibName: "TextFieldDetailCell", bundle: nil), forCellReuseIdentifier: "cell")
        tabledetail.delegate = self
        tabledetail.dataSource = self
    }
    
    @IBAction func btnActionSubmit(_ sender: UIButton) {
        validateTextFields { isValid, collectedData in
            if isValid {
                print("All fields are valid. Collected Data: \(collectedData)")
            } else {
                print("Please fill all required fields.")
            }
        }
    }
    func validateTextFields(completion: (_ isValid: Bool, _ collectedData: [String]) -> Void) {
        
        let allFieldsFilled = !textFieldValues.contains(where: { $0.isEmpty })
        
        if allFieldsFilled {
            completion(true, textFieldValues)
        } else {
            completion(false, [])
        }
    }
    
    
}

extension Requestdetailvc: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TextFieldDetailCell
        cell.topTextFieldPlaceHolder.text = data[indexPath.row]
        cell.nameTextField.tag = indexPath.row
        cell.nameTextField.placeholder = "Enter \(data[indexPath.row])"
        cell.nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return cell
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let index = textField.tag
        if index < textFieldValues.count {
            textFieldValues[index] = textField.text ?? ""
        }
    }
    
}
