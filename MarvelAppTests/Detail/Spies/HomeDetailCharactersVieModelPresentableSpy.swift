//
//  HomeDetail.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 22/12/22.
//

import Foundation
import Combine
import Models
import Requests

@testable import MarvelApp

final class HomeDetailCharactersVieModelPresentableSpy: HomeDetailCharactersVieModelPresentable {
    enum Method: Equatable {
        case loading
        case success(([Comics], [Story]))
        case failed(Error)
    }
    
    private(set) var calledMethods: [Method] = []
    
    func loading() {
        calledMethods.append(.loading)
    }
    
    func success(_ data: ([Models.Comics], [Models.Story])) {
        calledMethods.append(.success((data.0, data.1)))
    }
    
    func failed(_ error: Error) {
        calledMethods.append(.failed(error))
    }
}

extension HomeDetailCharactersVieModelPresentableSpy.Method {
    static func == (lhs: HomeDetailCharactersVieModelPresentableSpy.Method, rhs: HomeDetailCharactersVieModelPresentableSpy.Method) -> Bool {
        switch (lhs, rhs) {
        case (.loading, .loading), (.success, .success), (.failed, .failed): return true
        default: return false
        }
    }
}
