//
//  MUColor.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import SwiftHEXColors

public extension UIColor {
    static func muGreen(alpha: Float = 1.0) -> UIColor {
        return UIColor(hexString: "#9BB59B", alpha: alpha) ?? UIColor.green
    }
}
