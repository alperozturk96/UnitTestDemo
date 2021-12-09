//
//  ProcessorsTableViewCell.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

import UIKit

class ProcessorsTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var cacheSizeLabel: UILabel!
    @IBOutlet private weak var clockSpeedLabel: UILabel!
    @IBOutlet private weak var coreCountLabel: UILabel!
    @IBOutlet private weak var modelNameLabel: UILabel!
    @IBOutlet private weak var manufacturerLabel: UILabel!
    @IBOutlet private weak var lithographyLabel: UILabel!
    
    func configureCell(item:ProcessorM){
        manufacturerLabel.text = item.manufacturer
        modelNameLabel.text = item.modelName
        
        if let clockSpeed = item.clockSpeed {
            clockSpeedLabel.text = clockSpeed.stringValue + "mhz"
        }
        else
        {
            clockSpeedLabel.text = "Not Found"
        }
        
        if let lithography = item.lithography {
            lithographyLabel.text = lithography.stringValue + "nm"
        }
        else
        {
            lithographyLabel.text = "Not Found"
        }
        
        if let cacheSize = item.cacheSize {
            cacheSizeLabel.text = cacheSize.stringValue + "mb"
        }
        else
        {
            cacheSizeLabel.text = "Not Found"
        }
        
        if let coreCount = item.coreCount {
            coreCountLabel.text = coreCount.stringValue + " cores"
        }
        else
        {
            coreCountLabel.text = "Not Found"
        }
    }
    
}
