//
//  HomeDetailCharacterViewController.swift
//  MarvelApp
//
//  Created by Diego Costa on 16/11/22.
//

import UIKit
import Kingfisher
import Combine
import Models

final class HomeDetailCharacterViewController: ViewController {
    
    private var scrollView: UIScrollView = .init()
    private var stackView: UIStackView = .init()
    private var imageView: UIImageView = .init()
    private var nameLabel: UILabel = .init()
    private var descriptionLabel: UILabel = .init()
    private var collectionView: UICollectionView = .init(frame: .zero, collectionViewLayout: .init())
    private var datasource: CompositionalLayoutDatasource?
    private var snapshot: CompositionalLayoutSnapshot = .init()
    private var bag: Set<AnyCancellable> = .init()
    private var viewModel: HomeDetailCharacterViewModelProtocol
    private var indicatorLoading: LoadingIndicator
    private var errorView: GenericErrorViewProtocol
    
    init(viewModel: HomeDetailCharacterViewModelProtocol,
         indicatorLoading: LoadingIndicator,
         errorView: GenericErrorViewProtocol) {
        self.viewModel = viewModel
        self.indicatorLoading = indicatorLoading
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
        self.view.backgroundColor = .black
        self.viewModel.loadData()
    }
    
    override func addViewHierarchy() {
        view.addSubview(scrollView)
        scrollView.addSubview(stackView)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(collectionView)
    }
    
    override func setupConstraints() {
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
            make.width.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        
        collectionView.snp.makeConstraints { make in
            make.height.equalTo(200)
        }
    }
    
    override func configureViews() {
        configureDatasource()
        configureScrollView()
        configureStackView()
        configureImageView()
        configureNameLabel()
        configureDescriptionLabel()
        configureCollectionView()
    }
    
    private func configureScrollView() {
        scrollView.showsVerticalScrollIndicator = false
    }
    
    private func configureStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
    }
    
    private func configureImageView() {
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = Assets.imgNotFound.image
        imageView.isAccessibilityElement = false

        if let url = viewModel.character.thumbnail?.imageUrl {
            imageView.kf.setImage(with: url, placeholder: imageView.image)
        }
    }
    
    private func configureNameLabel() {
        nameLabel.text = viewModel.character.name
        nameLabel.numberOfLines = 0
        nameLabel.textAlignment = .left
        nameLabel.textColor = .white
        nameLabel.font = .preferredFont(forTextStyle: .title1)
        nameLabel.adjustsFontForContentSizeCategory = true
        nameLabel.isAccessibilityElement = true
        nameLabel.accessibilityLanguage = "en-US"
    }
    
    private func configureDescriptionLabel() {
        descriptionLabel.text = viewModel.character.description
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textAlignment = .left
        descriptionLabel.textColor = .white
        descriptionLabel.font = .preferredFont(forTextStyle: .subheadline)
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.isAccessibilityElement = true
        descriptionLabel.accessibilityLanguage = "en-US"
    }
    
    private func configureDatasource() {
        if !snapshot.sectionIdentifiers.contains(.comics) {
            self.snapshot.appendSections([.comics])
        }
        if !snapshot.sectionIdentifiers.contains(.stories) {
            self.snapshot.appendSections([.stories])
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
    
    private func updateDatasource() {
        self.datasource?.apply(snapshot)
        let contentSize = collectionView.contentSize.height
        self.collectionView.snp.updateConstraints { make in
            make.height.equalTo(contentSize)
        }
    }
    
    private func configureCollectionView() {
        self.collectionView.isScrollEnabled = false
        self.collectionView.backgroundColor = .clear
        self.collectionView.showsVerticalScrollIndicator = false
        self.collectionView.collectionViewLayout = CompositionalLayout.layout(snapshot)
        self.collectionView.register(ImageViewCell.self)
        self.collectionView.register(ButtonViewCell.self)
    }
    
    func cell(collectionView: UICollectionView, indexPath: IndexPath, item: CompositionalLayoutItem) -> UICollectionViewCell? {
        switch item {
        case .comics(let data):
            let cell = collectionView.dequeue(cell: ImageViewCell.self, indexPath: indexPath)
            cell.set(thumbnail: data.thumbnail)
            cell.setAccessibility(
                Strings.Accessibility.Detail.Characters.Comics.label,
                value: Strings.Accessibility.Detail.Characters.Comics.value(indexPath.item + 1, snapshot.numberOfItems(inSection: .comics))
            )
            return cell
        case .stories(let data):
            let cell = collectionView.dequeue(cell: ButtonViewCell.self, indexPath: indexPath)
            cell.set(title: data.title, action: nil)
            cell.setAccessibility(
                Strings.Accessibility.Detail.Characters.Stories.label(data.title ?? ""),
                value: Strings.Accessibility.Detail.Characters.Stories.value(indexPath.item + 1, snapshot.numberOfItems(inSection: .stories))
            )
            return cell
        default:
            return nil
        }
    }
}
extension HomeDetailCharacterViewController: HomeDetailCharactersVieModelPresentable {
    
    func loading() {
        if !UIAccessibility.isVoiceOverRunning {
            self.indicatorLoading.show()
        }
    }
    
    func success(_ data: ([Models.Comics], [Models.Story])) {
        let comicsItems = data.0.map { return CompositionalLayoutItem.comics($0)}
        self.snapshot.appendItems(comicsItems, toSection: .comics)
        
        let storiesItems = data.1.map { return CompositionalLayoutItem.stories($0)}
        self.snapshot.appendItems(storiesItems, toSection: .stories)
        
        self.updateDatasource()
        self.indicatorLoading.stop()
    }
    
    func failed(_ error: Error) {
        self.indicatorLoading.stop()
        self.errorView.show(inView: collectionView, message: error.localizedDescription) { [weak self] in
            self?.viewModel.loadData()
        }
    }
}
