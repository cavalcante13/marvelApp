//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import UIKit
import SnapKit
import Combine
import Models
import Requests

final class HomeCharactersViewController: ViewController {
    private var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())
    private var datasource: CompositionalLayoutDatasource?
    private var snapshot: CompositionalLayoutSnapshot = .init()
    private var coordinator: Coordinator
    private var loadingIndicator: LoadingIndicator
    private var viewModel: HomeCharactersViewModelProtocol
    private var errorView: GenericErrorViewProtocol
    
    init(viewModel: HomeCharactersViewModelProtocol,
         coordinator: Coordinator,
         loadingIndicator: LoadingIndicator,
         errorView: GenericErrorViewProtocol) {
        self.viewModel = viewModel
        self.coordinator = coordinator
        self.loadingIndicator = loadingIndicator
        self.errorView = errorView
        super.init(nibName: nil, bundle: nil)
        self.viewModel.presentable = self
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = Strings.Home.Navigation.title
        self.view.backgroundColor = .black
        self.viewModel.loadData()
    }
    
    override func addViewHierarchy() {
        view.addSubview(collectionView)
    }
    
    override func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override func configureViews() {
        configureDatasource()
        configureCollectionView()
    }
    
    private func configureDatasource() {
        if !snapshot.sectionIdentifiers.contains(.populars) {
            self.snapshot.appendSections([.populars])
        }
        
        self.datasource = .init(collectionView: collectionView, cellProvider: { [weak self] collectionView, indexPath, item in
            return self?.cell(collectionView: collectionView, indexPath: indexPath, item: item)
        })
        
        let sectionRegistration: UICollectionView.SupplementaryRegistration<CompositionalLayoutHeaderView> = .init(elementKind: CompositionalLayoutSection.SupplementaryElementKind.sectionHeader) { [weak self] headerView, kind, indexPath in
            if let title = self?.datasource?.snapshot().sectionIdentifiers[indexPath.section].title {
                headerView.set(title: title)
            }
        }
        
        self.datasource?.supplementaryViewProvider = { collectionView, kind, indexPath in
            return collectionView.dequeueConfiguredReusableSupplementary(using: sectionRegistration, for: indexPath)
        }
    }
    
    private func configureCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.backgroundColor = .clear
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.collectionViewLayout = CompositionalLayout.layout(snapshot)
        self.collectionView.register(HomeCharactersCollectionViewCell.self)
    }

    private func cell(collectionView: UICollectionView, indexPath: IndexPath, item: CompositionalLayoutItem) -> UICollectionViewCell? {
        switch item {
        case .characters(let data):
            let cell = collectionView.dequeue(cell: HomeCharactersCollectionViewCell.self, indexPath: indexPath)
            cell.set(character: data)
            return cell
        default:
            return nil
        }
    }
}

extension HomeCharactersViewController: HomeCharactersVieModelPresentable {
    
    func loading() {
        self.loadingIndicator.show()
    }
    
    func success(_ data: [Character]) {
        let item = data.map { return CompositionalLayoutItem.characters($0)}
        self.snapshot.appendItems(item, toSection: .populars)
        self.datasource?.apply(snapshot)
        self.loadingIndicator.stop()
    }
    
    func failed(_ error: Error) {
        self.loadingIndicator.stop()
        self.errorView.show(inView: collectionView, message: error.localizedDescription) { [weak self] in
            self?.viewModel.loadData()
        }
    }
}

extension HomeCharactersViewController: UICollectionViewDelegate, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let item = datasource?.itemIdentifier(for: indexPath) {
            switch item {
            case .characters(let character):
                coordinator.push(.detail(character))
            default:
                break
            }
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let height = scrollView.contentSize.height
        
        if (offsetY > (height - scrollView.frame.size.height)) {
            self.viewModel.loadMoreData(snapshot.numberOfItems)
        }
    }
}
