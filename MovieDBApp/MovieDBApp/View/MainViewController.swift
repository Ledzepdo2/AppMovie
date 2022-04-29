//
//  MainViewController.swift
//  MovieDBApp
//
//  Created by Jesus Perez Mojica on 26/04/22.
//

import UIKit
import CloudKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var LoginHomeButtonOutlet: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var apiService = ApiService()
    var personData = ViewModelSignin()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        LoginHomeButtonOutlet.dropShadow()
        apiService.getPopularMoviesData { result in
            print(result)
        }
        
        activityIndicator.hidesWhenStopped = true
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.tintColor = UIColor.clear
        
    }
    
    //MARK: -> LOGIC BUTTON SINGIN
    @IBAction func LoginActionButton(_ sender: Any) {
        
        
        if emailTextfield.text == personData.person.email && passwordTextField.text == personData.person.password {
            
            performSegue(withIdentifier: "TabBarStoryboard", sender: self)
            messageLabel.text = "Acabas de iniciar sesión a la mejor aplicación de películas"
            activityIndicator.startAnimating()
            
        } else {
            messageLabel.text = "Revisa y coloca nuevamente tu usuario y contraseña"
            
        }
        
        
    }
    
}
