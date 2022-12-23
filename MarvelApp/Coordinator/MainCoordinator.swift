//
//  MainCoordinator.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//
import UIKit
import Requests
import Models
import Combine

final class AppCoordinator: Coordinator {
    
    @Published
    private var vc: UIViewController?
    private var bag: Set<AnyCancellable> = .init()
    var nav: UINavigationController
    
    init(_ nav: UINavigationController) {
        self.nav = nav
    }
    
    func start() {
        $vc.sink { [weak self] vc in
            guard let viewController = vc else { return }
            self?.nav.pushViewController(viewController, animated: true)
        }.store(in: &bag)
        self.push(.home)
    }
    
    func push(_ screens: Screens) {
        switch screens {
        case .home:
            let repository = CharactersRepository()
            let viewModel = HomeCharactersViewModel(repository: repository)
            let progressHUD = LoadingProgressHUD()
            let errorView = ErrorView()
            self.vc = HomeCharactersViewController.init(viewModel: viewModel,
                                                        coordinator: self,
                                                        loadingIndicator: progressHUD,
                                                        errorView: errorView)
        case .detail(let character):
            let comicsRepo = CharactersComicsRepository()
            let storiesRepo = CharactersStoriesRepository()
            let progressHUD = LoadingProgressHUD()
            let errorView = ErrorView()
            let viewModel = HomeDetailCharacterViewModel(character: character,
                                                  comicsRepo: comicsRepo,
                                                  storiesRepo: storiesRepo)
            self.vc = HomeDetailCharacterViewController(viewModel: viewModel,
                                                        indicatorLoading: progressHUD,
                                                        errorView: errorView)
        }
    }
}
