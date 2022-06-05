//
//  AssetInfoHeader.swift
//  assetutil-convert
//
//  Created by Hal Mueller on 6/5/22.
//

import Foundation

/*
 {
   "Appearances" : {
     "UIAppearanceAny" : 0
   },
   "AssetStorageVersion" : "Xcode 13.2.1 (13C100) via AssetCatalogSimulatorAgent",
   "Authoring Tool" : "@(#)PROGRAM:CoreThemeDefinition  PROJECT:CoreThemeDefinition-519\n",
   "CoreUIVersion" : 737,
   "DumpToolVersion" : 738.1,
   "Key Format" : [
     "kCRThemeScaleName",
     "kCRThemeIdiomName",
     "kCRThemeSubtypeName",
     "kCRThemeDimension2Name",
     "kCRThemeDimension1Name",
     "kCRThemeIdentifierName",
     "kCRThemeElementName",
     "kCRThemePartName"
   ],
   "MainVersion" : "@(#)PROGRAM:CoreUI  PROJECT:CoreUI-737.2\n",
   "Platform" : "ios",
   "PlatformVersion" : "13.4",
   "SchemaVersion" : 2,
   "StorageVersion" : 17,
   "ThinningParameters" : "carutil 738.100000, thinned <mode app> <idiom *> <subtype *> <subtypefallback *> <scale *> <gamut *> <graphics *> <graphicsfallback *> <memory *> <deployment+ *> <hostedIdioms *> <removed none>",
   "Timestamp" : 1654453889
 },

 */

struct AssetInfoHeader: Codable {
    let assetStorageVersion : String
    let platformVersion : String
    
    enum CodingKeys : String, CodingKey {
        case assetStorageVersion = "AssetStorageVersion"
        case platformVersion = "PlatformVersion"
    }
}
