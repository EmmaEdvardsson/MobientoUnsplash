//
//  MUAppManager.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import Foundation
import Unbox

class MUAppManager {
    static func getSearchResults(forSearchText: String, page: Int, success: @escaping (MUSearchResult) -> Void) {
        MUApiClient().getSearchResults(forSearchText: "Horse", page: page, success: { result in
            do {
                if let data = result.data {
                    let searchResult: MUSearchResult = try unbox(data: data)
                    success(searchResult)
                }
            } catch {
                print("Error parsing search result response: \(error)")
            }
        }, failure: {
            print("Show error message")
        })
    }
}
