//
//  CharactersStoriesRepositorySpy.swift
//  MarvelAppTests
//
//  Created by Diego Costa on 21/12/22.
//
import Foundation
import Combine
import Models
import Requests

@testable import MarvelApp

final class CharactersStoriesRepositorySpy: CharactersStoriesRepositoryProtocol {
    enum Method: Equatable {
        case getStories(Int)
    }
    private let storyData: StoryData = .fixture()
    private(set) var calledMethods: [Method] = []
    
    lazy var response: Response = .success(storyData)
    
    func getStories(characterID: Int) -> AnyPublisher<Models.StoryData, Error> {
        calledMethods.append(.getStories(characterID))
        return response.publisher
    }
}
