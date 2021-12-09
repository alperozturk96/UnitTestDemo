//
//  CatFactsVC.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 24.11.2021.
//

import UIKit
import Combine

class CatFactsVC:UIViewController {
    
    @IBOutlet private weak var catFactsLabel: UILabel!
    
    let VM = CatFactsVM()
    var catFactAnyCancellable:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCatFact()
    }
    
    func fetchCatFact(){
        guard let publisher = API.catFact() else {
            return
        }
        
        catFactAnyCancellable = VM.fetchCatFact(publisher: publisher, complicated: { catFact in
            self.catFactsLabel.text = catFact.fact
        }, error: { error in
            print("error caught at fetchCatFact: ")
        })
    }
    
    @IBAction func fetchNewFact(){
        fetchCatFact()
    }
    
}
