//
//  MockHelper.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Models
import Combine

enum Response<Model: Codable>: Equatable {
    case success(Model)
    case failure(Error)
    
    var publisher: AnyPublisher<Model, Error> {
        switch self {
        case .success(let model):
            return Result.Publisher(.success(model)).eraseToAnyPublisher()
        case .failure(let error):
            return Result.Publisher(.failure(error)).eraseToAnyPublisher()
        }
    }
    
    static func == (lhs: Response<Model>, rhs: Response<Model>) -> Bool {
        switch (lhs, rhs) {
        case (.success, .success), (.failure, .failure):
            return true
        default:
            return false
        }
    }
}
