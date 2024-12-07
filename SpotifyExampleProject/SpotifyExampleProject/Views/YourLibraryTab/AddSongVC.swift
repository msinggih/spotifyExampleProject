//
//  AddSongVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 07/12/24.
//

import UIKit
import Combine

class AddSongVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var viewModel : AddSongVM!
    var timer = Timer()
    let searchController = UISearchController(searchResultsController: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        viewModel = AddSongVM(tableView: tableView)
        
        //setup tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongListCell", bundle: nil), forCellReuseIdentifier: "SongListCell")
    
    }
    @IBAction func cancelButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func searchOnEditingText(text:String) {
//        timer.invalidate()
        viewModel.FetchMovies()
        
    }
    
}

extension AddSongVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell", for: indexPath) as! SongListCell
        
        cell.setupData(titleLabel: viewModel.musics[indexPath.row].trackName ?? "", subtitleLabel: viewModel.musics[indexPath.row].artistName ?? "")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

extension AddSongVC: UISearchBarDelegate {
    
    
    // This Function, when we type on the textfield with iterval 1 sec
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        timer.invalidate()
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(searchOnEditingText), userInfo: nil, repeats: false)
//    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchOnEditingText(text: searchBar.searchTextField.text ?? "")
    }
    
}
