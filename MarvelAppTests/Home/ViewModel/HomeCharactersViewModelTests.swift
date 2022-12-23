//
//  HomeViewModel.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 21/12/22.
//

import XCTest
import Requests
import Models
import Combine

@testable import MarvelApp

final class HomeCharactersViewModelTests: XCTestCase {
    
    private let repositorySpy = CharactersRepositoryProtocolSpy()
    private let presentableSpy = HomeCharactersVieModelPresentableSpy()
    
    private lazy var sut: HomeCharactersViewModelProtocol = {
        let sut = HomeCharactersViewModel(repository: repositorySpy)
        sut.presentable = presentableSpy
        return sut
    }()
   
    func testLoadData_whenFetchingDataWithSuccess_shouldCallPresentableSuccess() {
        repositorySpy.response = .success(.fixture())
        
        sut.loadData()
        
        XCTAssertEqual(repositorySpy.calledMethods, [.getCharacters(0)])
        XCTAssertEqual(presentableSpy.calledMethods, [.loading, .success([.fixture()])])
    }
    
    func testLoadData_whenFetchingDataWithFailure_shouldCallPresentableFailed() {
        let error = RequestError.transportError
        repositorySpy.response = .failure(error)
        
        sut.loadData()
        
        XCTAssertEqual(repositorySpy.calledMethods, [.getCharacters(0)])
        XCTAssertEqual(presentableSpy.calledMethods, [.loading, .failed(error)])
    }
    
    func testLoadMoreData_whenFetchingDataWithSuccess_shouldCallPresentableSuccess() {
        repositorySpy.response = .success(.fixture())
        
        sut.loadMoreData(20)
        
        XCTAssertEqual(repositorySpy.calledMethods, [.getCharacters(20)])
        XCTAssertEqual(presentableSpy.calledMethods, [.loading, .success([.fixture()])])
    }
    
    func testLoadMoreData_whenFetchingDataWithFailure_shouldCallPresentableFailed() {
        let error = RequestError.transportError
        repositorySpy.response = .failure(error)
        
        sut.loadMoreData(20)
        
        XCTAssertEqual(repositorySpy.calledMethods, [.getCharacters(20)])
        XCTAssertEqual(presentableSpy.calledMethods, [.loading, .failed(error)])
    }
}
