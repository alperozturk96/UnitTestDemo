//
//  ViewController.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet private weak var menuTableView: UITableView!
    let VM = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        initMenuTableView()
    }
    
    func initMenuTableView(){
        menuTableView.dataSource = self
        menuTableView.delegate = self
    }
    
    func openOverclockGPUVC(){
        navigationController?.pushViewController(OverclockGPUVC(nibName: "OverclockGPU", bundle: nil), animated: true)
    }
}

extension HomeVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 3 {
            openOverclockGPUVC()
        }
        else
        {
            performSegue(withIdentifier: VM.menuItems[indexPath.row].destination, sender: nil)
        }
    }
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return VM.menuItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConst.menuTVId) else {
            return UITableViewCell()
        }
        
        cell.textLabel?.text = VM.menuItems[indexPath.row].title
        return cell
    }
}
