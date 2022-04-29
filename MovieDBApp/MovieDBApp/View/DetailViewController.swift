//
//  DetailViewController.swift
//  MovieDBApp
//
//  Created by Jesus Perez Mojica on 28/04/22.
//

import UIKit

class DetailViewController: UIViewController {

    //MARK: -> DETAILVIEW CONTROLLER

    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var overrideMovie: UILabel!
    @IBOutlet weak var rateMovie: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isUserInteractionEnabled = true
        navigationController?.navigationBar.tintColor = UIColor.red
        
    }
    
    
}




