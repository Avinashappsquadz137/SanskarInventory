//
//  createchallanvc.swift
//  InventoryApp
//
//  Created by Sanskar IOS Dev on 30/07/24.
//

import UIKit

class createchallanvc: BaseVC  {
    
    @IBOutlet weak var Datatxt: UITextField!
    @IBOutlet weak var Nametxt: UITextField!
    @IBOutlet weak var Locationtxt: UITextField!
    @IBOutlet weak var txtRemarkView: UITextView!
    
    let placeholderText = "Enter your remarks here..."
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDatePicker()
        txtRemarkView.delegate = self
        txtRemarkView.text = placeholderText
        txtRemarkView.textColor = .lightGray
    }
    

    
    
 // MARK: - Setup Date Picker
    private func setupDatePicker() {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        }
        datePicker.addTarget(self, action: #selector(dateChanged(datePicker:)), for: .valueChanged)
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        Datatxt.inputAccessoryView = toolbar
        Datatxt.inputView = datePicker
    }
    
    @objc private func dateChanged(datePicker: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        Datatxt.text = dateFormatter.string(from: datePicker.date)
    }
    
    @objc private func donePressed() {
        self.view.endEditing(true)
    }
    
    @IBAction func Nextbtnaction(_ sender: UIButton) {
        if validateFields() {
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "Additemvc") as! Additemvc
                self.navigationController?.pushViewController(vc, animated: true)
            }
    }
    
    // MARK: - Validation
    private func showValidationAlert(message: String) {
        let alert = UIAlertController(title: "All Field Required", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    private func validateFields() -> Bool {

        // Validate Date field
        if Datatxt.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showValidationAlert(message: "Date field is required.")
            return false
        }
        // Validate Name field
        if Nametxt.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showValidationAlert(message: "Name field is required.")
            return false
        }
        // Validate Location field
        if Locationtxt.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true {
            showValidationAlert(message: "Location field is required.")
            return false
        }

        // Validate Remark TextView
        if txtRemarkView.text?.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ?? true || txtRemarkView.text == placeholderText {
            showValidationAlert(message: "Remarks field is required.")
            return false
        }
        return true
    }


    
}
// MARK: - UITextViewDelegate Methods
extension  createchallanvc : UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == placeholderText {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeholderText
            textView.textColor = .lightGray
        }
    }
}
