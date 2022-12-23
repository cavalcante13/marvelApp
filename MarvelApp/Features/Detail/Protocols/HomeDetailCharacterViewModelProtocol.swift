//
//  HomeDetailCharacterViewModelProtocol.swift
//  MarvelApp
//
//  Created by Diego on 16/12/22.
//

import Foundation
import Requests
import Models
import Combine

protocol HomeDetailCharactersVieModelPresentable: ViewModelPresentable {
    func success(_ data: ([Comics], [Story]))
}

protocol HomeDetailCharacterViewModelProtocol {
    var presentable: HomeDetailCharactersVieModelPresentable? { get set }
    var character: Character { get set }
    func loadData()
}
