//
//  HomeViewController.swift
//  MarvelApp
//
//  Created by Diego Costa on 14/11/22.
//

import Foundation

public struct MarvelEnvironmentConfig {
    
    static let privateKey = (Bundle.main.object(forInfoDictionaryKey: "MarvelApi-privateKey") as? String) ?? ""
    
    static let publicKey = (Bundle.main.object(forInfoDictionaryKey: "MarvelApi-publicKey") as? String) ?? ""
    
    static let ts = String(Date().timeIntervalSince1970)
    
    static let hash = MD5.value("\(ts)\(privateKey)\(publicKey)")
    
    static let scheme = "https"
    
    static let host = "gateway.marvel.com"
    
    static let port = 443
    
    static var authParams: [String : String] {
        let publicKey = MarvelEnvironmentConfig.publicKey
        let ts = MarvelEnvironmentConfig.ts
        let hash = MarvelEnvironmentConfig.hash
        return ["apikey": publicKey, "ts": ts, "hash": hash]
    }
}
