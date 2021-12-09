//
//  BaseVC.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 29.11.2021.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showErrorMessage(message:String){
        let errorAlert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        errorAlert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        present(errorAlert, animated: true, completion: nil)
    }
}
