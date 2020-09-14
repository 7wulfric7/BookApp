//
//  ViewController.swift
//  BookApp
//
//  Created by Deniz Adil on 9/14/20.
//  Copyright © 2020 Code Academy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var txtFisrtName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        txtFisrtName.delegate = self
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

