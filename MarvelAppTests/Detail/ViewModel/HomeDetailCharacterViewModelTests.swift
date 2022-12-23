//
//  Detail.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 21/12/22.
//
import XCTest
import Requests
import Models
import Combine
@testable import MarvelApp

final class HomeDetailCharacterViewModelTests: XCTestCase {
    
    private var comicsRepoSpy = CharactersComicsRepositoryProtocolSpy()
    private var storiesRepoSpy = CharactersStoriesRepositoryProtocolSpy()
    private let presentableSpy = HomeDetailCharactersVieModelPresentableSpy()
    private let character: Character = .fixture(id: 99)
    
    private lazy var sut: HomeDetailCharacterViewModel = {
       let sut = HomeDetailCharacterViewModel(character: character,
                                        comicsRepo: comicsRepoSpy,
                                        storiesRepo: storiesRepoSpy)
        sut.presentable = presentableSpy
        return sut
    }()
    
    func testLoadData_whenFetchingDataWithSuccess_shouldCallPresentableSuccess() {
        comicsRepoSpy.response = .success(.fixture())
        storiesRepoSpy.response = .success(.fixture())
        
        sut.loadData()
        
        XCTAssertEqual(presentableSpy.calledMethods, [.loading,
                                                      .success(([.fixture()], [.fixture()]))])
        XCTAssertEqual(comicsRepoSpy.calledMethods, [.getComics(99)])
        XCTAssertEqual(storiesRepoSpy.calledMethods, [.getStories(99)])
    }
    
    func testLoadData_whenFetchingComicsWithSuccess_andFetchingStoriesWithFailure_shouldCallPresentableFailure() {
        comicsRepoSpy.response = .success(.fixture())
        storiesRepoSpy.response = .failure(RequestError.transportError)
        
        sut.loadData()
        
        XCTAssertEqual(presentableSpy.calledMethods, [.loading,
                                                      .failed(RequestError.transportError)])
        XCTAssertEqual(comicsRepoSpy.calledMethods, [.getComics(99)])
        XCTAssertEqual(storiesRepoSpy.calledMethods, [.getStories(99)])
    }
    
    func testLoadData_whenFetchingComicsWithFailure_andFetchingStoriesWithSuccess_shouldCallPresentableFailure() {
        comicsRepoSpy.response = .failure(RequestError.transportError)
        storiesRepoSpy.response = .success(.fixture())
        
        sut.loadData()
        
        XCTAssertEqual(presentableSpy.calledMethods, [.loading,
                                                      .failed(RequestError.transportError)])
        XCTAssertEqual(comicsRepoSpy.calledMethods, [.getComics(99)])
        XCTAssertEqual(storiesRepoSpy.calledMethods, [.getStories(99)])
    }
    
    func testLoadData_whenFetchingComicsWithFailure_andFetchingStoriesWithFailure_shouldCallPresentableFailure() {
        comicsRepoSpy.response = .failure(RequestError.transportError)
        storiesRepoSpy.response = .failure(RequestError.transportError)
        
        sut.loadData()
        
        XCTAssertEqual(presentableSpy.calledMethods, [.loading,
                                                      .failed(RequestError.transportError)])
        XCTAssertEqual(comicsRepoSpy.calledMethods, [.getComics(99)])
        XCTAssertEqual(storiesRepoSpy.calledMethods, [.getStories(99)])
    }
}
