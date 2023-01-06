//
//  MainCoordinator.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//
import UIKit
import Requests
import Models

final class MainCoordinator: Coordinator {
    
    var nav: UINavigationController
    
    init(_ nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        goToHome()
    }
    
    func goToHome() {
        let repository = CharactersRepository()
        let viewModel = HomeCharactersViewModel(repository: repository)
        let vc = HomeCharactersViewController(viewModel: viewModel,
                                                    coordinator: self)
        nav.pushViewController(vc, animated: true)
    }
    
    func goToDetail(_ character: Character) {
        let comicsRepo = CharactersComicsRepository()
        let storiesRepo = CharactersStoriesRepository()
        let viewModel = HomeDetailCharacterViewModel(character: character,
                                              comicsRepo: comicsRepo,
                                              storiesRepo: storiesRepo)
        let vc = HomeDetailCharacterViewController(viewModel: viewModel)
        nav.pushViewController(vc, animated: true)
    }
}
