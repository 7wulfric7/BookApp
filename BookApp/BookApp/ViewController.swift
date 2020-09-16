//
//  ViewController.swift
//  BookApp
//
//  Created by Deniz Adil on 9/14/20.
//  Copyright © 2020 Code Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    @IBOutlet weak var txtFisrtName: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtCountry: UITextField!
    @IBOutlet weak var txtNaselba: UITextField!
    
    let picker = UIPickerView()
    let naselbi = ["Centar", "Karpos", "Aerodrom", "Cair", "Gazibaba", "Butel", "Vlae", "Gjorce Petrov"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegatesAndBorders()
        setupPickerView()
    }
    
    func setupDelegatesAndBorders() {
        //        txtFisrtName.delegate = self
        //        txtAddress.delegate = self
        //        txtCountry.delegate = self
        //        txtNaselba.delegate = self
        
        for i in 1...4 {
            if let textField = self.view.viewWithTag(i) as? UITextField {
                textField.delegate = self
                textField.layer.borderWidth = 1.0
                textField.layer.borderColor = UIColor(red: 255/255.0, green: 99/255.0, blue: 71/255.0, alpha: 1.0).cgColor
                textField.layer.cornerRadius = 10.0
            }
        }
    }
    
    func setupPickerView() {
        
        picker.dataSource = self
        picker.delegate = self
        txtNaselba.inputView = picker
        setupToolbar()
    }
    func setupToolbar() {
        let toolbar = UIToolbar()
        toolbar.items = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(onCancel)), UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(onDone))]
        txtNaselba.inputAccessoryView = toolbar
        toolbar.sizeToFit()
    }
    @objc func onCancel() {
        txtNaselba.resignFirstResponder()
    }
    @objc func onDone() {
        
        let titleIndex = picker.selectedRow(inComponent: 0)
        let title = naselbi[titleIndex]
        txtNaselba.text = title
        txtNaselba.resignFirstResponder()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return naselbi.count
    }
    
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return naselbi[row]
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == txtNaselba {
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y - 120, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == txtNaselba {
            UIView.animate(withDuration: 0.3) {
                self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y + 120, width: self.view.frame.size.width, height: self.view.frame.size.height)
            }
        }
    }
}
