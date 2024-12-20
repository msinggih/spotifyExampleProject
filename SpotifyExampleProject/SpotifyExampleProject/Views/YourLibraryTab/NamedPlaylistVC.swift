//
//  NamedPlaylistVC.swift
//  SpotifyExampleProject
//
//  Created by Muhammad Singgih Soedarto on 06/12/24.
//

import UIKit
import CoreData

protocol NamedPlaylistDelegate {
    func confirmButtonAction()
}

class NamedPlaylistVC: UIViewController {
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var textfieldPlaylist: UITextField!
    
    var delegate: NamedPlaylistDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func confirmButtonTapped(_ sender: Any) {
        self.dismiss(animated: true)
        delegate?.confirmButtonAction()
        
    }
    
}
