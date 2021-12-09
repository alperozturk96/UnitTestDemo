//
//  AddProcessorInputValidator.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 23.11.2021.
//

final class AddProcessorInputValidator {
    
    func checkInput(processor:ProcessorM) -> Bool {
       guard let manufacturer = processor.manufacturer else {
            return false
        }
        
        guard let modelName = processor.modelName else {
            return false
        }
        
        guard let coreCount = processor.coreCount else {
            return false
        }
        
        guard let cacheSize = processor.cacheSize else {
            return false
        }
        
        guard let clockSpeed = processor.clockSpeed else {
            return false
        }
        
        guard let lithography = processor.lithography else {
            return false
        }
         
      
        if manufacturer.isEmpty{
            return false
        }
        else if modelName.isEmpty {
            return false
        }
        else if coreCount.intValue <= 0 {
            return false
        }
        else if cacheSize.intValue <= 0 {
            return false
        }
        else if clockSpeed.intValue <= 0 {
            return false
        }
        else if lithography.intValue <= 0 {
            return false
        }
        else
        {
            return true
        }
    }
    
}
