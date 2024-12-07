//
//  AddSongVM.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 07/12/24.
//

import Foundation
import UIKit

class AddSongVM {
    var musics: [Music] = [] {
        didSet{
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var tableView = UITableView()
    
    init(tableView:UITableView) {
        self.tableView = tableView
    }
    
    func FetchMovies() {
        APIService.shared.fetchMovies { result in
            switch result {
            case .success(let movies):
                self.musics = movies
            case .failure(let error):
                print("Error fetching movies: \(error)")
            }
        }
    }
}
        
