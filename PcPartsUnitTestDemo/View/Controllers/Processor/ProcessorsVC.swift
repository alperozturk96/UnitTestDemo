//
//  ProcessorsVC.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

import UIKit
import CoreData

class ProcessorsVC: BaseVC {
    
    @IBOutlet private weak var processorsTableView: UITableView!
    
    var processorList = [ProcessorM]()
    var provider:ProcessorProvider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initProcessorsTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initProvider()
        loadProcessorList()
    }
    
    func initProvider(){
        provider = ProcessorProvider(context: CoreDataStack.shared.mainContext,
                                     request: NSFetchRequest<NSFetchRequestResult>(entityName: "Processors"))
    }
    
    func initProcessorsTableView(){
        processorsTableView.dataSource = self
        processorsTableView.delegate = self
    }
    
    func loadProcessorList(){
        let result = provider.fetchRequest()
        
        for item in result {
            if let processor = item as? ProcessorM {
                processorList.append(processor)
            }
        }
        processorsTableView.reloadData()
    }
}

extension ProcessorsVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return processorList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConst.processorTVId) as? ProcessorsTableViewCell else {
            return ProcessorsTableViewCell()
        }
        
        cell.configureCell(item: processorList[indexPath.row])
        return cell
    }
}
