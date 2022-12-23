//
//  MD5.swift
//  MarvelApi
//
//  Created by Diego Costa on 16/11/22.
//

import Foundation
import CommonCrypto

final class MD5 {
    
    class func value(_ string: String) -> String {
        let data = Data(string.utf8)
        let hash = data.withUnsafeBytes { (bytes: UnsafeRawBufferPointer) -> [UInt8] in
            var hash = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
            CC_MD5(bytes.baseAddress, CC_LONG(data.count), &hash)
            return hash
        }
        return hash.map { String(format: "%02x", $0) }.joined()
    }
}
