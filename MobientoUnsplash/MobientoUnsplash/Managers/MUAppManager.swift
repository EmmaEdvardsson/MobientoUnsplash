//
//  MUAppManager.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import Foundation

class MUAppManager {
    static func getSearchResults(forSearchText: String, page: Int, success: () -> Void) {
        MUApiClient().getSearchResults(forSearchText: "Horse", page: page, success: success, failure: {
            print("Show error message")
        })
    }
}
