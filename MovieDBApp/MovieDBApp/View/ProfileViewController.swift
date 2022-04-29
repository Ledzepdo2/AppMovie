//
//  ProfileViewController.swift
//  MovieDBApp
//
//  Created by Jesus Perez Mojica on 28/04/22.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var nameOutletLabel: UILabel!
    
    @IBOutlet weak var emailOutletLabel: UILabel!
    
    
    //MARK: -> LOGIN INPUTS
    var dataPerson = ViewModelSignin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.isUserInteractionEnabled = false
        navigationController?.navigationBar.tintColor = UIColor.clear
        
        logoutButton.dropShadow()
        nameOutletLabel.text = dataPerson.person.name
        emailOutletLabel.text = dataPerson.person.email
        
    }
    
    
    @IBAction func LogoutButton(_ sender: Any) {
    }
}
