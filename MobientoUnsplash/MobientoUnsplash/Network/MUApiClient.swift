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
    let kUnsplashAccessKey = "053f65a6d645dddebaa96dc0ca512a241cf3909c7299d911251579a68b9d5f06"
    let kPageSize: Int = 12
    
    func getSearchResults(forSearchText: String, page: Int = 1, success: @escaping (DataResponse<Any>) -> Void, failure: @escaping () -> Void) {
        let params = "?query=\(forSearchText)&page=\(page)&per_page=\(kPageSize)&orientation=squarish"
        
        guard let url = URL(string: kBaseUrl+searchPhotosApiPath+params) else {
            failure()
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Alamofire.HTTPMethod.get.rawValue
        urlRequest.setValue("Client-ID \(kUnsplashAccessKey) ", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(urlRequest).responseJSON { response in
            if response.result.isSuccess {
                print("I've got some results!")
                success(response)
            } else {
                failure()
            }
        }
    }
}
