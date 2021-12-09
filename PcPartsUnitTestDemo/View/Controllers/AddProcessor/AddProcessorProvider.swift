//
//  CoreDataManager.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 28.11.2021.
//

import CoreData

final class AddProcessorProvider {
    var context: NSManagedObjectContext
    var entity: NSEntityDescription
    
    required init(context:NSManagedObjectContext, entity:NSEntityDescription) {
        self.context = context
        self.entity = entity
    }
    
    @discardableResult
    func save(processor:ProcessorM) -> String? {
        do
        {
            try context.save()
            return processor.modelName
        }
        catch
        {
            return nil
        }
    }
}
