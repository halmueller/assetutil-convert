//
//  Decodable+Result.swift
//  assetutil-convert
//
//  Created by Hal Mueller on 6/5/22.
//

import Foundation

// from https://stackoverflow.com/a/66065916/719690
extension Result: Decodable where Success: Decodable, Failure == DecodingError {

    public init(from decoder: Decoder) throws {

        let container: SingleValueDecodingContainer = try decoder.singleValueContainer()

        do {

            self = .success(try container.decode(Success.self))

        } catch {

            if let decodingError = error as? DecodingError {
                self = .failure(decodingError)
            } else {
                self = .failure(DecodingError.dataCorrupted(.init(codingPath: [], debugDescription: error.localizedDescription)))
            }
        }
    }
    
}
