//
//  PhotosError.swift
//  Photos
//
//  Created by Leandro Rocha on 12/5/20.
//

import Foundation

public enum PhotosError: String, Error {
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid response from the server. Please try again."
    case invalidData = "The data received from the server was invalid. Please try again."
}
