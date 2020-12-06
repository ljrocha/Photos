//
//  Photo.swift
//  PhotoViewer
//
//  Created by Leandro Rocha on 12/5/20.
//

import Foundation

public struct PhotoSearchResult: Decodable {
    public let results: [Photo]
}

public struct Photo: Decodable {
    public let id: String
    public let description: String?
    public let imagePath: String
    
    private enum PhotoCodingKeys: String, CodingKey {
        case id
        case description
        case imagePath = "urls"
    }
    
    private enum ImageURLCodingKeys: String, CodingKey {
        case small
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: PhotoCodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        
        let imageURLContainer = try container.nestedContainer(keyedBy: ImageURLCodingKeys.self, forKey: .imagePath)
        self.imagePath = try imageURLContainer.decode(String.self, forKey: .small)
    }
}
