//
//  HomeVM.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 21.11.2021.
//

final class HomeVM {
    let menuItems:[HomeM] = [HomeM(title: "Processor List", destination: "showProcessorsVC"),
                             HomeM(title: "Add New Processor", destination: "showAddProcessorVC"),
                             HomeM(title: "Cat Facts :)", destination: "showCatFactsVC"),
                             HomeM(title: "Overclock GPU !", destination: "showCatFactsVC")]
}
