//
//  MUSearchResult.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import Unbox

enum MUSearchResultKey: String, UnboxableEnum {
    case total = "total"
    case totalPages = "total_pages"
    case photos = "results"
}

struct MUSearchResult {
    var total: Int
    var totalPages: Int
    var photos: [MUPhoto]?
}

extension MUSearchResult: Unboxable {
    init(unboxer: Unboxer) throws {
        self.total = try unboxer.unbox(key: MUSearchResultKey.total.rawValue)
        self.totalPages = try unboxer.unbox(key: MUSearchResultKey.totalPages.rawValue)
        self.photos = unboxer.unbox(key: MUSearchResultKey.photos.rawValue)
    }
}
