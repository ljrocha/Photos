//
//  UnsplashAPI.swift
//  PhotoViewer
//
//  Created by Leandro Rocha on 12/5/20.
//

import Foundation

fileprivate enum Endpoint: String {
    case photosList = "/photos"
    case photoSearch = "/search/photos"
    case randomPhotos = "/photos/random"
}

struct UnsplashAPI {
    
    private static let baseURLString = "https://api.unsplash.com/"
    private static let accessKey = Private.accessKey
    
    static func photosListURL() -> URL {
        url(for: .photosList, parameters: ["per_page": "30", "order_by": "popular"])
    }
    
    static func photoSearchURL(forTerm searchTerm: String) -> URL {
        url(for: .photoSearch, parameters: ["per_page": "30", "query": searchTerm])
    }
    
    static func randomPhotoURL(forTerm searchTerm: String? = nil) -> URL {
        if let searchTerm = searchTerm {
            return url(for: .randomPhotos, parameters: ["query": searchTerm])
        } else {
            return url(for: .randomPhotos)
        }
    }
    
    private static func url(for endpoint: Endpoint, parameters: [String: String]? = nil) -> URL {
        var components = URLComponents(string: baseURLString + endpoint.rawValue)!
        
        var queryItems = [URLQueryItem]()
        
        let baseParams = [
            "client_id": accessKey
        ]
        
        for (key, value) in baseParams {
            let item = URLQueryItem(name: key, value: value)
            queryItems.append(item)
        }
        
        if let additionalParameters = parameters {
            for (key, value) in additionalParameters {
                let item = URLQueryItem(name: key, value: value)
                queryItems.append(item)
            }
        }
        
        components.queryItems = queryItems
        
        return components.url!
    }
}
