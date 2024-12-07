//
//  ApiService.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 07/12/24.
//

import Foundation

// MARK: - API Service
class APIService {
    static let shared = APIService()
    private let session = URLSession.shared
    
    func fetchMovies(completion: @escaping (Result<[Music], Error>) -> Void) {
        let urlString = "https://itunes.apple.com/search?term=jack+johnson&entity=musicVideo"
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "Invalid URL", code: -1, userInfo: nil)))
            return
        }
        
        session.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: -1, userInfo: nil)))
                return
            }
            
            do {
                let decodedResponse = try JSONDecoder().decode(MusicResponse.self, from: data)
                completion(.success(decodedResponse.results))
            } catch let decodingError {
                completion(.failure(decodingError))
            }
        }.resume()
    }
}
