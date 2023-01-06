//
//  HomeCharactersViewModelProtocol.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//
import Models
import Combine

protocol HomeCharactersVieModelPresentable: ViewModelPresentable {
    func success(_ data: [Character])
}
protocol HomeCharactersViewModelProtocol {
    var presentable: HomeCharactersVieModelPresentable? { get set }
    func loadData()
    func loadMoreData(_ arrayCount: Int)
}
