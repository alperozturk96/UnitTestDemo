//
//  ProcessorM.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

import CoreData

@objc(Processors)
class ProcessorM: NSManagedObject {
    @NSManaged var id:NSNumber?
    @NSManaged var manufacturer:String?
    @NSManaged var modelName:String?
    @NSManaged var clockSpeed:NSNumber?
    @NSManaged var coreCount:NSNumber?
    @NSManaged var cacheSize:NSNumber?
    @NSManaged var lithography:NSNumber?
}
