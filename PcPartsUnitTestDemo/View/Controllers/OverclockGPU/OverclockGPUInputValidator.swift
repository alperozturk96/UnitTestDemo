//
//  OverclockGPUInputValidator.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 29.11.2021.
//

import Foundation

final class OverclockGPUInputValidator {
    
    func isClockSpeedValid(_ clockSpeed:String) throws -> Bool {
        guard let intClockSpeed = Int(clockSpeed) else {
            return false
        }
        
        if intClockSpeed > 2300 {
            throw OverlockGPUError.aboveMaxClockSpeed
        }
        
        if intClockSpeed < 300 {
            throw OverlockGPUError.underMinClockSpeed
        }
        
        return true
    }
    
    
    func isVoltageValid(_ voltage:String) throws -> Bool {
        guard let doubleVoltage = Double(voltage) else {
            return false
        }
        
        if doubleVoltage > 1.4 {
            throw OverlockGPUError.aboveMaxVoltage
        }
        
        if doubleVoltage < 0.8 {
            throw OverlockGPUError.underMinVoltage
        }
        
        return true
    }
    
}
