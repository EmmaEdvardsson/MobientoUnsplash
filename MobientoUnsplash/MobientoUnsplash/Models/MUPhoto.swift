//
//  MUPhoto.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import Unbox

enum MUPhotoKeys: String, UnboxableEnum {
    case thumbnailUrl = "urls.thumb"
    case regularUrl = "urls.regular"
}

struct MUPhoto {
    var thumbnailUrl: String?
    var regularUrl: String?
}

extension MUPhoto: Unboxable {
    init(unboxer: Unboxer) throws {
        self.thumbnailUrl = try unboxer.unbox(keyPath: MUPhotoKeys.thumbnailUrl.rawValue)
        self.regularUrl = try unboxer.unbox(keyPath: MUPhotoKeys.regularUrl.rawValue)
    }
}
