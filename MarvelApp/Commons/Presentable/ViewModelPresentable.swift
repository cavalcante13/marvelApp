//
//  BasePresentable.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import Foundation

protocol ViewModelPresentable: AnyObject {
    func loading()
    func failed(_ error: Error)
}
