//
//  MUConstants.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import Foundation

enum MUViewControllers {
    case searchView
    
    var storyboardName: String {
        switch self {
        case .searchView: return "SearchView"
        }
    }
    
    var storyboardIdentifier: String {
        switch self {
        case .searchView: return "SearchView"
        }
    }
}
