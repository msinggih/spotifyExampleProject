//
//  PlaylistVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit

class PlaylistVC: UIViewController {
    @IBOutlet weak var libraryTitleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    private func setupUI() {
        //tableView setup
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "SongListCell", bundle: nil), forCellReuseIdentifier: "SongListCell")
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addSongListButtonTapped(_ sender: Any) {
        print("addSong list button tapped")
        let vc = AddSongVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlaylistVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongListCell", for: indexPath) as! SongListCell
        return cell
    }
}
