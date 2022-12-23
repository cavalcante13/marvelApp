//
//  HomeCharactersViewModel.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//
import Foundation
import Requests
import Models
import Combine

final class HomeCharactersViewModel: HomeCharactersViewModelProtocol {
    
    private var offset: Int = 0
    private var repository: CharactersRepositoryProtocol
    private var bag: Set<AnyCancellable> = .init()
    weak var presentable: HomeCharactersVieModelPresentable?
    
    init(repository: CharactersRepositoryProtocol) {
        self.repository = repository
    }
    
    func loadData() {
        self.fetchData()
    }
    
    func loadMoreData(_ arrayCount: Int) {
        self.offset += arrayCount
        self.fetchData()
    }

    private func fetchData() {
        self.presentable?.loading()
        self.repository.getCharacters(offset: offset)
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .failure(let error):
                    self?.presentable?.failed(error)
                default:
                    break
                }
            }, receiveValue: { [weak self] data in
                self?.presentable?.success(data.data.results)
            }).store(in: &bag)
    }
}
