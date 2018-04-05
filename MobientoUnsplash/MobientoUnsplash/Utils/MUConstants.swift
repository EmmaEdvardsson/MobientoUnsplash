//
//  MUConstants.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

//MARK: - Access Key
let kUnsplashAccessKey = "053f65a6d645dddebaa96dc0ca512a241cf3909c7299d911251579a68b9d5f06"

//MARK: - Identifiers
enum MUViewControllers {
    case searchView
    case focusView
    
    var storyboardName: String {
        switch self {
        case .searchView, .focusView: return "SearchView"
        }
    }
    
    var storyboardIdentifier: String {
        switch self {
        case .searchView: return "SearchView"
        case .focusView: return "FocusView"
        }
    }
}

//MARK: - Cell Identifiers
let kPhotoCellIdentifier = "PhotoCellIdentifier"

//MARK: - Other
let kPageSize: Int = 12
let kNumberOfCellsFromBottom = 6
