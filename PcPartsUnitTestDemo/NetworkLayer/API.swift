//
//  API.swift
//  PcPartsUnitTestDemo
//
//  Created by Alper Öztürk on 24.11.2021.
//

import Foundation
import Combine

enum API {
    static let resultWrapper = ResultWrapper()
}

extension API {

    static func catFact() -> AnyPublisher<CatFactsM, Error>? {
        guard let url = URL(string: "https://catfact.ninja/fact") else {
            return nil
        }
        let request = URLRequest(url: url)
        return resultWrapper.run(request)
            .map(\.value)
            .eraseToAnyPublisher()
    }
}
