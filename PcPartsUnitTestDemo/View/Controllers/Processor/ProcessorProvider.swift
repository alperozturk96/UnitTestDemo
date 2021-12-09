//
//  ProcessorProvider.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 29.11.2021.
//

import CoreData

final class ProcessorProvider {
    var context: NSManagedObjectContext
    var request:NSFetchRequest<NSFetchRequestResult>
    
    required init(context:NSManagedObjectContext, request:NSFetchRequest<NSFetchRequestResult>) {
        self.context = context
        self.request = request
    }
    
    func fetchRequest() -> NSArray{
        do
        {
            return try context.fetch(request) as NSArray
        }
        catch
        {
            return []
        }
    }
}
