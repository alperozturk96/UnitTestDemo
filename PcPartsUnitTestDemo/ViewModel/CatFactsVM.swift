//
//  CatFactsVM.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 24.11.2021.
//

import Combine

final class CatFactsVM {
    
    func fetchCatFact(publisher: AnyPublisher<CatFactsM, Error>, complicated: @escaping (_ catFact:CatFactsM)->(), error: @escaping (_ error:Any)->()) -> AnyCancellable
    {
        return publisher
            .sink(receiveCompletion: { result in
            switch result {
            case .finished: print("catFact fetched")
            case .failure(let err): error("error caught at catFact: \(err)")
            }
        }, receiveValue: { response in
            complicated(response)
        })
    }
}
