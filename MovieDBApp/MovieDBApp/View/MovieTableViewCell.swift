//
//  MovieTableViewCell.swift
//  MovieDBApp
//
//  Created by Jesus Perez Mojica on 27/04/22.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    
    //MARK: -> CELLS TABLE VIEW
    @IBOutlet weak var posterMovie: UIImageView!
    @IBOutlet weak var titleMovie: UILabel!
    @IBOutlet weak var yearMovie: UILabel!
    @IBOutlet weak var overrideMovie: UILabel!
    @IBOutlet weak var rateMovie: UILabel!
    
    private var urlString: String = ""
    
    
    func setCellWithValuesOf(_ movie:Movie) {
        updateUI(title: movie.title, releaseDate: movie.year, rating: movie.rate, overview: movie.overview, poster: movie.posterImage)
    }
    
    //MARK: -> UPDATE DATA
    private func updateUI(title: String?, releaseDate: String?, rating: Double?, overview: String?, poster: String?) {
        
        self.titleMovie.text = title
        self.yearMovie.text = convertDateFormater(releaseDate)
        guard let rate = rating else {return}
        self.rateMovie.text = String(rate)
        self.overrideMovie.text = overview
        
        guard let posterString = poster else {return}
        urlString = "https://image.tmdb.org/t/p/w300" + posterString
        
        guard let posterImageURL = URL(string: urlString) else {
            self.posterMovie.image = UIImage(named: "noImageAvailable")
            return
        }
        
        
        self.posterMovie.image = nil
        
        getImageDataFrom(url: posterImageURL)
        
    }
    
    //MARK: -> GET IMAGE
    private func getImageDataFrom(url: URL) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let data = data else {
               
                print("Empty Data")
                return
            }
            
            DispatchQueue.main.async {
                if let image = UIImage(data: data) {
                    self.posterMovie.image = image
                }
            }
        }.resume()
    }
    
    //MARK: -> DATE CONVERTER
    func convertDateFormater(_ date: String?) -> String {
        var fixDate = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        if let originalDate = date {
            if let newDate = dateFormatter.date(from: originalDate) {
                dateFormatter.dateFormat = "dd.MM.yyyy"
                fixDate = dateFormatter.string(from: newDate)
            }
        }
        return fixDate
    }
}

