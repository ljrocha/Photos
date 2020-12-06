//
//  PhotoStore.swift
//  PhotoViewer
//
//  Created by Leandro Rocha on 12/5/20.
//

import UIKit

public class PhotoStore {
    
    public static let shared = PhotoStore()
    
    private init() {}
    
    public func fetchListOfPhotos(completion: @escaping (Result<[Photo], PhotosError>) -> Void) {
        let url = UnsplashAPI.photosListURL()
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let photos = try jsonDecoder.decode([Photo].self, from: data)
                completion(.success(photos))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    public func searchPhotos(forTerm searchTerm: String, completion: @escaping (Result<[Photo], PhotosError>) -> Void) {
        let url = UnsplashAPI.photoSearchURL(forTerm: searchTerm)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let photoSearchResult = try jsonDecoder.decode(PhotoSearchResult.self, from: data)
                completion(.success(photoSearchResult.results))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
    public func fetchRandomPhoto(forTerm searchTerm: String? = nil, completion: @escaping (Result<Photo, PhotosError>) -> Void) {
        let url = UnsplashAPI.randomPhotoURL(forTerm: searchTerm)
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(.unableToComplete))
                return
            }

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }

            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }

            do {
                let jsonDecoder = JSONDecoder()
                let photo = try jsonDecoder.decode(Photo.self, from: data)
                completion(.success(photo))
            } catch {
                completion(.failure(.invalidData))
            }
        }
        task.resume()
    }
    
}
