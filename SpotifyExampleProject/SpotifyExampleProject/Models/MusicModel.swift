//
//  TrackModel.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 07/12/24.
//

import Foundation

// MARK: - Movie Model
struct Music: Codable {
    let wrapperType: String?
    let kind: String?
    let collectionId: Int?
    let trackId: Int?
    let artistName: String?
    let collectionName: String?
    let trackName: String?
    let collectionCensoredName: String?
    let trackCensoredName: String?
    let collectionViewUrl: String?
    let trackViewUrl: String?
    let previewUrl: String?
    let artworkUrl100: String?
    let collectionPrice: Double?
    let trackPrice: Double?
    let trackRentalPrice: Double?
    let releaseDate: String?
    let primaryGenreName: String?
    let longDescription: String?
    let contentAdvisoryRating: String?
}

// MARK: - Movie Response
struct MusicResponse: Codable {
    let resultCount: Int
    let results: [Music]
}

struct Playlist {
    var musics: [Music]
    var name: String
}
