//
//  XIBBasedVC.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 29.11.2021.
//

import UIKit

class OverclockGPUVC: BaseVC {

    @IBOutlet weak var clockSpeedTF: UITextField!
    @IBOutlet weak var voltageTF: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func overclockGPU(){
        let inputValidator = OverclockGPUInputValidator()
        let errorMessage =  "An error occured while saving new configuration check the limit of inputs."
        
        do
        {
            var isValid = try inputValidator.isClockSpeedValid(clockSpeedTF.text ?? "1500")
            isValid = try inputValidator.isVoltageValid(voltageTF.text ?? "1.0")
            
            if isValid {
                navigationController?.popViewController(animated: true)
            }
            else
            {
                showErrorMessage(message: errorMessage)
            }
        }
        catch
        {
            showErrorMessage(message: errorMessage)
        }
    }

}
