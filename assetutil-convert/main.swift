//
//  main.swift
//  assetutil-convert
//
//  Created by Hal Mueller on 6/5/22.
//

import Foundation

let stdin = FileHandle.standardInput
if let inputData = try! stdin.readToEnd() {
    
    let decoder = JSONDecoder()
    // The first element of the array is a different struct. I'm ignoring it, letting the decoding
    // error clear it out of the way.
    let safeAssets = try? decoder.decode([Result<AssetInfo, DecodingError>].self, from: inputData)
    if let assets = safeAssets?.compactMap({ try? $0.get() }) {
        print(AssetInfo.quickCSVHeader())
        for asset in assets {
            print(asset.quickCSV())
        }
    }
    
}

