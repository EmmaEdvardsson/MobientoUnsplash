//
//  MUApiClient.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import Foundation
import Alamofire

class MUApiClient {
    let kBaseUrl = "https://api.unsplash.com"
    let searchPhotosApiPath = "/search/photos"
    
    func getSearchResults(forSearchText: String, page: Int = 1, success: @escaping (DataResponse<Any>) -> Void, failure: @escaping () -> Void) {
        guard let string = forSearchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) else { return failure() }
        let params = "?query=\(string)&page=\(page)&per_page=\(kPageSize)&orientation=squarish"
        
        guard let url = URL(string: kBaseUrl+searchPhotosApiPath+params) else {
            failure()
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Alamofire.HTTPMethod.get.rawValue
        urlRequest.setValue("Client-ID \(kUnsplashAccessKey) ", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(urlRequest).responseJSON { response in
            if response.result.isSuccess {
                success(response)
            } else {
                failure()
            }
        }
    }
}
