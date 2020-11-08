//
//  Constants.swift
//  NewsApp
//
//  Created by Robert Shrestha on 11/7/20.
//

import Foundation

struct Constants{
    enum UserDefaults: String {
        case selectedCountry
        case favourites

        var value: String {
            return self.rawValue
        }
    }
    static let labelOk = "OK"
    static let cancel = "Cancel"
    static let back = "Back"
    static let edit = "Edit"
    static let create = "CREATE"
    static let createLabel = "Create"
    static let saveLabel = "SAVE"
    static let save = "SAVE CHANGES"
    static let savecontinue = "Save and Continue"
    static let createSite = "Create New Site"
    static let deleteMesasge = "Are you sure you want to delete ?"

    //camera constants
    static let takePhoto = "Take photo"
    static let cameraRoll = "Camera roll"
    static let photoLibrary = "Photo library"

    // MARK: - Pagination
    static let perPage = 20

    // MARK: PlaceholderText
    enum PlaceholderText: String {
        case unknown = "Unknown"
        var value: String {
            return self.rawValue
        }
    }
    static let placeHolderImageURLString: String = "https://newsapi.org/images/n-logo-border.png"
}

struct MessageConstants {
    enum NoCountries: String{
        case title = "No countries Found"
        case message = ""
        var value: String {
            return self.rawValue
        }
    }
    enum NoHeadline: String {
        case title = "No Headlines Found"
        case message = "No Headline Found.Try changing the countries or try again later."
        var value: String {
            return self.rawValue
        }
    }
    enum NoSource: String {
        case title = "No Source Found"
        case message = "No Sources found.Try again later"
        var value: String {
            return self.rawValue
        }
    }
    enum NoSaveArticle: String {
        case title = "No saved articlesFound"
        case message = "You have not saved any articles"
        var value: String {
            return self.rawValue
        }
    }
}

struct CellContants {
    
}
