//
//  AddProcessorVC.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

import UIKit
import CoreData

class AddProcessorVC: BaseVC {
    
    @IBOutlet weak var lithographyTF: UITextField!
    @IBOutlet weak var cacheSizeTF: UITextField!
    @IBOutlet weak var clockSpeedTF: UITextField!
    @IBOutlet weak var coreCountTF: UITextField!
    @IBOutlet weak var modelNameTF: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    @IBOutlet private weak var manufacturerPickerView: UIPickerView!
    
    let VM = AddProcessorVM()
    var provider:AddProcessorProvider?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initPickerView()
        initProcessorFactory()
    }
    
    func initPickerView(){
        manufacturerPickerView.dataSource = self
        manufacturerPickerView.delegate = self
    }
    
    func initProcessorFactory(){
        let context = CoreDataStack.shared.mainContext
        guard let entity = NSEntityDescription.entity(forEntityName: "Processors", in: context) else {
            return
        }
        
        provider = AddProcessorProvider.init(context: context, entity:  entity)
    }
    
    @IBAction func save(){
        guard let processorFactory = provider else {
            showErrorMessage(message: "An error occured while trying to save.")
            return
        }
        
        let processor = ProcessorM(entity: processorFactory.entity,
                                   insertInto: processorFactory.context)
        
        processor.manufacturer = VM.selectedManufacturer
        processor.modelName =  modelNameTF.text
        processor.coreCount = NumberFormatter().number(from: coreCountTF.value())
        processor.cacheSize = NumberFormatter().number(from: cacheSizeTF.value())
        processor.lithography = NumberFormatter().number(from: lithographyTF.value())
        processor.clockSpeed = NumberFormatter().number(from: clockSpeedTF.value())
        
        let inputValidator = AddProcessorInputValidator()
        
        if inputValidator.checkInput(processor: processor)
        {
           processorFactory.save(processor: processor)
           navigationController?.popToRootViewController(animated: true)
        }
        else
        {
            showErrorMessage(message: "Please fill all input areas.")
        }
    }
}

extension AddProcessorVC: UIPickerViewDelegate, UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return VM.manufacterers[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        VM.selectedManufacturer = VM.manufacterers[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return VM.manufacterers.count
    }
}
