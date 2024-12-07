//
//  YourLibraryVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit

class YourLibraryVC: UIViewController {
    
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var playlistTableView: UITableView!
    @IBOutlet weak var toggleCollectionTableViewButton: UIButton!
    @IBOutlet weak var playlistCollectionView: UICollectionView!
    let nav = UINavigationController()
    @IBOutlet weak var sortIcon: UIImageView!
    var isTableView = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        //setup playlist tableview
        playlistTableView.delegate = self
        playlistTableView.dataSource = self
        playlistTableView.register(UINib(nibName: "PlayListCell", bundle: nil), forCellReuseIdentifier: "PlayListCell")
        
        //Setup category collection view
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 5
        categoryCollectionView.collectionViewLayout = layout
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(UINib(nibName: "CategoryCollectionCell", bundle: nil), forCellWithReuseIdentifier: "CategoryCollectionCell")
        
        let layout1 = UICollectionViewFlowLayout()
        layout1.minimumLineSpacing = 16
        layout1.minimumInteritemSpacing = 16
        playlistCollectionView.delegate = self
        playlistCollectionView.dataSource = self
        playlistCollectionView.collectionViewLayout = layout1
        playlistCollectionView.register(UINib(nibName: "PlaylistCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PlaylistCollectionViewCell")
        
        //Navigation Controller setup
        self.navigationController?.navigationBar.isHidden = true
    }
    @IBAction func toggleButtonTapped(_ sender: Any) {
        if isTableView == true {
            isTableView = false
            toggleCollectionTableViewButton.setImage(UIImage(named: "tableviewIcon"), for: .normal)
            playlistTableView.isHidden = true
            playlistCollectionView.isHidden = false
            sortIcon.isHidden = false
        } else {
            isTableView = true
            toggleCollectionTableViewButton.setImage(UIImage(named: "gridIcon"), for: .normal)
            playlistTableView.isHidden = false
            playlistCollectionView.isHidden = true
            sortIcon.isHidden = true
        }
    }
    
    @IBAction func createPlaylistButtonTapped(_ sender: Any) {
        let vc = CreatePlaylistVC()
        vc.delegate = self
        let navVC = UINavigationController(rootViewController: vc)
        
        navVC.isModalInPresentation = true
        if let sheet = navVC.sheetPresentationController {
            sheet.detents = [.custom(resolver: { context in
                0.1 * context.maximumDetentValue
            }), .large()]
        }
        self.navigationController?.present(navVC, animated: true)
    }
}


extension YourLibraryVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlayListCell", for: indexPath) as! PlayListCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 84
    }
}

extension YourLibraryVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case playlistCollectionView:
            return 6
        case categoryCollectionView:
            return 1
        default:
            return 1
        }
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case playlistCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlaylistCollectionViewCell", for: indexPath) as! PlaylistCollectionViewCell
            //cell.setupUI(indexpathrow: indexPath.row)
            return cell
        case categoryCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
            cell.setupUI(indexpathrow: indexPath.row)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionCell", for: indexPath) as! CategoryCollectionCell
            cell.setupUI(indexpathrow: indexPath.row)
            return cell
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case playlistCollectionView:
            let padding: CGFloat = 16 // Spacing between items
            let availableWidth = collectionView.bounds.width - (padding * 3)
            let itemWidth = availableWidth / 2
            return CGSize(width: itemWidth, height: itemWidth * 224 / 186)
        case categoryCollectionView:
            return CGSize(width: 100, height: 32)
        default:
            return CGSize(width: 100, height: 32)
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
}


extension YourLibraryVC: CreatePlayListDelegate {
    func handleNavigation() {
        let vc = NamedPlaylistVC()
        vc.delegate = self
        present(vc, animated: true)
    }
}

extension YourLibraryVC: NamedPlaylistDelegate {
    func confirmButtonAction() {
        let vc = PlaylistVC()
        self.navigationController?.pushViewController(vc, animated: false)
    }
}

