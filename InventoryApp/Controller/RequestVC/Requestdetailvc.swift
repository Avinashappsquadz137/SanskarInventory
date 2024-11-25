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
    var tempID: String?
    var data = ["Consignee","Transporter","Consigner","HSN/SAC Code","Eway Bill Transaction","Eway Bill No","Eway Bill Date","Team Member","Transport Id"]
    var textFieldValues: [String] = []
    var teamMembers: [String] = []
    var multiSelectValues: [Int: [String]] = [:]
    var formattedDate = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        textFieldValues = Array(repeating: "", count: data.count)
        tabledetail.register(UINib(nibName: "TextFieldDetailCell", bundle: nil), forCellReuseIdentifier: "cell")
        tabledetail.delegate = self
        tabledetail.dataSource = self
        getMemberDetail()
    }
    
    @IBAction func btnActionSubmit(_ sender: UIButton) {
        print("textFieldValues before validation: \(textFieldValues)")
        validateTextFields { isValid, collectedData in
            if isValid {
                print("All fields are valid. Collected Data: \(collectedData)")
                apiclall()
            } else {
                showValidationAlert(message: "Please fill all required fields.")
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
    func showValidationAlert(message: String) {
        let alert = UIAlertController(title: "All Field Required", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
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
        
        if data[indexPath.row] == "Team Member" {
            let pickerView = UIPickerView()
            pickerView.delegate = self
            pickerView.dataSource = self
            pickerView.tag = indexPath.row
            cell.nameTextField.inputView = pickerView
            createPickerToolbar(for: cell.nameTextField, withTag: indexPath.row)
        }
//        else if data[indexPath.row] == "Eway Bill Date" {
//            cell.nameTextField.addTarget(self, action: #selector(datetextfiels(_:)), for: .editingDidBegin)
//        }
        else {
            cell.nameTextField.inputView = nil
            createToolbar(for: cell.nameTextField)
        }
        cell.nameTextField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        return cell
    }
    @objc func textFieldDidChange(_ textField: UITextField) {
        let index = textField.tag
        if index < textFieldValues.count {
            textFieldValues[index] = textField.text ?? ""
        }
    }
//    @objc func datetextfiels(_ textField: UITextField) {
//        let index = textField.tag
//        if data[index] == "Eway Bill Date" {
//            IosDatePicker().showDate(animation: .zoomIn, pickerMode: .date) { date in
//                textField.text = Utils.dateString(date: date, format: "yyyy-MM-dd")
//            }
//            if index < self.textFieldValues.count {
//                self.textFieldValues[index] = formattedDate
//            }
//            
//            // Debug: Print the updated textFieldValues
//            print("Updated textFieldValues: \(self.textFieldValues)")
//        }
//    }
    func createToolbar(for textField: UITextField) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPicker))
        toolbar.setItems([doneButton], animated: true)
        toolbar.isUserInteractionEnabled = true
        textField.inputAccessoryView = toolbar
    }
    
    @objc func dismissPicker() {
        self.view.endEditing(true)
    }
}

extension Requestdetailvc {
    func apiclall() {
        var dict = [String: Any]()
        dict["challan_status"] = "0"
        dict["temp_id"] = "\(tempID ?? "")"
        dict["item_qr_string[]"] = ["some_value_1", "some_value_2"]
        dict["emp_code"] = "SANS-00290"
        for (index, field) in data.enumerated() {
            switch field {
            case "Consignee":
                dict["consignee"] = textFieldValues[index]
            case "Transporter":
                dict["transporter"] = textFieldValues[index]
            case "Consigner":
                dict["consigner"] = textFieldValues[index]
            case "HSN/SAC Code":
                dict["hsn_sac_code"] = textFieldValues[index]
            case "Eway Bill Transaction":
                dict["eway_bill_transaction"] = textFieldValues[index]
            case "Eway Bill No":
                dict["eway_bill_no"] = textFieldValues[index]
            case "Eway Bill Date":
                dict["eway_bill_date"] = textFieldValues[index]
            case "Team Member":
                dict["team_member"] = textFieldValues[index]
            case "Transport Id":
                dict["transport_id"] = textFieldValues[index]
            default:
                break
            }
        }
        ApiClient.shared.callmethodMultipart(apiendpoint: Constant.addSaveChallanmaster, method: .post, param: dict, model: SaveChallanMaster.self){ result in
            switch result {
            case .success(let model):
                let storyboard = UIStoryboard(name: "DetailsScreen", bundle: nil)
                if let vc = storyboard.instantiateViewController(withIdentifier: "ItemDetailsFillVC") as? ItemDetailsFillVC {
                    vc.itemdetails = self.itemdetails
                    self.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func getMemberDetail() {
        ApiClient.shared.callmethodMultipart(apiendpoint: Constant.getCrewMember, method: .post, param: [:], model: CrewMemberModel.self){ result in
            switch result {
            case .success(let model):
                self.teamMembers = model.data?.compactMap { $0.emp_name } ?? []
                DispatchQueue.main.async {
                    self.tabledetail.reloadData()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension Requestdetailvc: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return teamMembers.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return teamMembers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let selectedFieldIndex = pickerView.tag
        
        guard selectedFieldIndex < data.count else {
            print("Invalid index for picker view")
            return
        }
        guard !teamMembers.isEmpty else {
            print("teamMembers array is empty")
            return
        }
        let selectedName = teamMembers[row]
        if multiSelectValues[selectedFieldIndex] == nil {
            multiSelectValues[selectedFieldIndex] = []
        }
        if let currentValues = multiSelectValues[selectedFieldIndex], currentValues.contains(selectedName) {
            multiSelectValues[selectedFieldIndex]?.removeAll(where: { $0 == selectedName })
        } else {
            multiSelectValues[selectedFieldIndex]?.append(selectedName)
        }
        textFieldValues[selectedFieldIndex] = multiSelectValues[selectedFieldIndex]?.joined(separator: ", ") ?? ""
        
        if let cell = tabledetail.cellForRow(at: IndexPath(row: selectedFieldIndex, section: 0)) as? TextFieldDetailCell {
            cell.nameTextField.text = textFieldValues[selectedFieldIndex]
        }
    }
    func createPickerToolbar(for textField: UITextField, withTag tag: Int) {
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        // Remove Button
        let removeButton = UIBarButtonItem(title: "Remove", style: .plain, target: self, action: #selector(removePickerSelection(_:)))
        removeButton.tag = tag
        
        // Done Button
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(dismissPicker))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([removeButton, flexSpace, doneButton], animated: true)
        textField.inputAccessoryView = toolbar
    }
    @objc func removePickerSelection(_ sender: UIBarButtonItem) {
        let tag = sender.tag
        guard let currentValues = multiSelectValues[tag], !currentValues.isEmpty else {
            return
        }
        let removedItem = currentValues.last
        multiSelectValues[tag]?.removeAll { $0 == removedItem }
        textFieldValues[tag] = multiSelectValues[tag]?.joined(separator: ", ") ?? ""
        if let cell = tabledetail.cellForRow(at: IndexPath(row: tag, section: 0)) as? TextFieldDetailCell {
            cell.nameTextField.text = textFieldValues[tag]
        }
        self.view.endEditing(true)
    }
}
