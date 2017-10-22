//
//  AddLoanViewController.swift
//  Flourish
//
//  Created by Jason Du on 10/21/17.
//  Copyright © 2017 Jason Du. All rights reserved.
//

import Foundation
import UIKit

class AddLoanViewController: UIViewController {

    @IBOutlet weak var cardView: UIView!

    // Schedule
    @IBOutlet weak var purposeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var startingDateTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var loanAmountTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var billingPeriodTextField: SkyFloatingLabelTextField!

    // Pickers
    let datePicker = UIDatePicker()
    let billingPicker = UIPickerView()
    let loanAmountPicker = UIPickerView()
    let loanDataArr = ["$100.00", "$200.00", "$400.00", "$800.00"]

    @IBOutlet weak var interestSwitch: UISwitch!
    @IBOutlet weak var searchButton: UIButton!

    override func viewDidLoad() {
        formatNavBar()
        formatCardView()
        formatTextFields()
        formatPicker()
    }

    @IBAction func searchPressed(_ sender: Any) {

    }

}

// Formatting
extension AddLoanViewController {

    func formatNavBar() {
        self.navigationController?.navigationBar.setBackgroundImage(GradientNavBar.create(size: self.navigationController!.navigationBar.bounds), for: .default)
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = UIColor.white
        let systemBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelNavBar))
        navigationItem.rightBarButtonItem = systemBarButtonItem
    }

    func formatCardView() {
        cardView.layer.shadowRadius = 2
        cardView.layer.shadowOffset = CGSize(width: 0, height: 3)
        cardView.layer.shadowOpacity = 0.2
    }

    func formatTextFields() {
        formatTextField(textField: purposeTextField)
        formatTextField(textField: loanAmountTextField)
        formatTextField(textField: startingDateTextField)
    }

    func formatTextField(textField: SkyFloatingLabelTextField) {
        textField.delegate = self
        textField.selectedLineColor = Theme.darkBlue
        textField.selectedTitleColor = Theme.darkBlue
    }
}

// Actions
extension AddLoanViewController {

    @objc func cancelNavBar() {
        self.dismiss(animated: true, completion: nil)
    }

    @objc func cancel() {
        self.view.endEditing(true)
    }

    @objc func loanAmountPickerDonePressed() {
        loanAmountTextField.text = loanDataArr[loanAmountPicker.selectedRow(inComponent: 0)]
        self.view.endEditing(true)
    }

    @objc func dateTextFieldDonePressed() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        let dateString = formatter.string(from: datePicker.date)
        startingDateTextField.text = dateString
        self.view.endEditing(true)
    }
}

// Textfield Delegate
extension AddLoanViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// Picker Delegate
extension AddLoanViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }


    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return loanDataArr.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return loanDataArr[row]
    }
}

// Textview formatting
extension AddLoanViewController {

    func formatPicker() {
        formatDatePicker()
        formatLoanAmountPickerView()
    }

    func formatDatePicker() {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dateTextFieldDonePressed))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let flexibleSpacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([cancelItem, flexibleSpacing, doneItem], animated: false)
        startingDateTextField.inputAccessoryView = toolBar
        startingDateTextField.inputView = datePicker
        datePicker.datePickerMode = .date
    }

    func formatLoanAmountPickerView() {
        loanAmountPicker.delegate = self
        loanAmountPicker.dataSource = self
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(loanAmountPickerDonePressed))
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancel))
        let flexibleSpacing = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        toolBar.setItems([cancelItem, flexibleSpacing, doneItem], animated: false)
        loanAmountTextField.inputAccessoryView = toolBar
        loanAmountTextField.inputView = loanAmountPicker
    }
}

