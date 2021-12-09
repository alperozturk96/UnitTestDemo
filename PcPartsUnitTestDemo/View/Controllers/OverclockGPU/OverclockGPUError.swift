//
//  OverclockGPUError.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 29.11.2021.
//

enum OverlockGPUError: Error {
    case underMinClockSpeed
    case aboveMaxClockSpeed
    case aboveMaxVoltage
    case underMinVoltage
}
