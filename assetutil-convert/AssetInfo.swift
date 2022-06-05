//
//  AssetInfo.swift
//  assetutil-convert
//
//  Created by Hal Mueller on 6/5/22.
//

import Foundation
/*
 {
  "AssetType" : "Icon Image",
  "BitsPerComponent" : 8,
  "ColorModel" : "RGB",
  "Colorspace" : "srgb",
  "Compression" : "lzfse",
  "Encoding" : "ARGB",
  "Icon Index" : 1,
  "Idiom" : "phone",
  "Name" : "AppIcon",
  "NameIdentifier" : 6849,
  "Opaque" : true,
  "PixelHeight" : 29,
  "PixelWidth" : 29,
  "RenditionName" : "29.png",
  "Scale" : 1,
  "SHA1Digest" : "037E1D967EDBA5578F9ACE1E3BA3FD5DFC44D334",
  "SizeOnDisk" : 334
},
 {                                                                                            |
   "AssetType" : "Vector",                                                                    |
   "Colorspace" : "generic",                                                                  |
   "Height" : 17.6898193359375,                                                               |
   "Idiom" : "universal",                                                                     |
   "Name" : "BlueBackArrow",                                                                  |
   "NameIdentifier" : 30683,                                                                  |
   "RenditionName" : "Back.pdf",                                                              |
   "Scale" : 1,                                                                               |
   "SHA1Digest" : "86C3498B6CA7AABAC14965155FA6B896DC40215B",                                 |
   "SizeOnDisk" : 3977,                                                                       |
   "Width" : 11                                                                               |
 },                                                                                           |
*/

struct AssetInfo: Codable {
    let assetType: String
    let name: String?
    let renditionName: String?
    let idiom: String?
    // not present for vectors, replaced by Height and Width
    let pixelHeight: Int?
    let pixelWidth: Int?
    let sizeOnDisk: Int?
    let scale: Int?
    
    enum CodingKeys : String, CodingKey {
        case assetType = "AssetType"
        case name = "Name"
        case renditionName = "RenditionName"
        case idiom = "Idiom"
        case pixelHeight = "PixelHeight"
        case pixelWidth = "PixelWidth"
        case sizeOnDisk = "SizeOnDisk"
        case scale = "Scale"
    }
    
    // in lieu of adding a CSV coding package
    static func quickCSVHeader() -> String {
        return "Type,Name,\"Rendition Name\",Scale,PixelWidth,PixelHeight,Idiom,Size"
    }
    
    func quickCSV() -> String {
        var result = ""
        result += "\"\(assetType ?? "")\",\"\(name ?? "")\",\"\(renditionName ?? "")\","

        if let scale = scale {
            result += "\(scale),"
        } else {
            result += ","
        }

        if let pixelWidth = pixelWidth {
            result += "\(pixelWidth),"
        } else {
            result += ","
        }

        if let pixelHeight = pixelHeight {
            result += "\(pixelHeight),"
        } else {
            result += ","
        }

        if let idiom = idiom {
            result += "\(idiom),"
        } else {
            result += ","
        }
        
        // Last column, omit the comma to prevent blank column on import.
        if let sizeOnDisk = sizeOnDisk {
            result += "\(sizeOnDisk)"
        } else {
            result += ""
        }

        return result
    }
}
