//
//  HomeDetailCharacterViewModel.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//
import Requests
import Models
import Combine
import UIKit

final class HomeDetailCharacterViewModel: HomeDetailCharacterViewModelProtocol {
   
    private var comicsRepo: CharactersComicsRepositoryProtocol
    private var storiesRepo: CharactersStoriesRepositoryProtocol
    private var bag: Set<AnyCancellable> = .init()
    var character: Character
    weak var presentable: HomeDetailCharactersVieModelPresentable?
    
    init(character: Character,
        comicsRepo: CharactersComicsRepositoryProtocol,
        storiesRepo: CharactersStoriesRepositoryProtocol) {
        self.character = character
        self.comicsRepo = comicsRepo
        self.storiesRepo = storiesRepo
    }
    
    func loadData() {
        self.presentable?.loading()
        self.comicsRepo.getComics(characterID: character.id)
            .zip(storiesRepo.getStories(characterID: character.id))
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.presentable?.failed(error)

                default:
                    break
                }
            }, receiveValue: { [weak self] comics, stories in
                self?.presentable?.success((comics.data.results, stories.data.results))
            }).store(in: &bag)
    }
}
