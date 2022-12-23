//
//  HomeCharactersVieModelPresentableSpy.swift
//  MarvelAppTests
//
//  Created by Diego on 21/12/22.
//

import Foundation
import Combine
import Models
import Requests

@testable import MarvelApp

final class HomeCharactersVieModelPresentableSpy: HomeCharactersVieModelPresentable {
    enum Method: Equatable {
        case loading
        case success([Character])
        case failed(Error)
    }
    
    private(set) var calledMethods: [Method] = []
    
    func loading() {
        calledMethods.append(.loading)
    }
    
    func success(_ data: [Character]) {
        calledMethods.append(.success(data))
    }
    
    func failed(_ error: Error) {
        calledMethods.append(.failed(error))
    }
}

extension HomeCharactersVieModelPresentableSpy.Method {
    static func == (lhs: HomeCharactersVieModelPresentableSpy.Method, rhs: HomeCharactersVieModelPresentableSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading), (.success, .success), (.failed, .failed): return true
        default: return false
        }
    }
}
