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
    
    func getSearchResults(forSearchText: String, success: () -> Void, failure: () -> Void) {
        let params = "?query=\(forSearchText)&orientation=squarish"
        
        guard let url = URL(string: kBaseUrl+searchPhotosApiPath+params) else {
            failure()
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = Alamofire.HTTPMethod.get.rawValue
        urlRequest.setValue("Client-ID \(kUnsplashAccessKey) ", forHTTPHeaderField: "Authorization")
        
        Alamofire.request(urlRequest).responseJSON { response in
            print("I've got some results!")
        }
    }
}
