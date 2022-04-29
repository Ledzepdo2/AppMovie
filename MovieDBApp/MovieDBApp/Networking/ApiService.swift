//
//  ApiService.swift
//  MovieDBApp
//
//  Created by Jesus Perez Mojica on 28/04/22.
//

import Foundation

class ApiService {
    
    
    //MARK: -> SERVICE API
    private var dataTask: URLSessionDataTask?
    
    func getPopularMoviesData(completion: @escaping (Result<MoviesData, Error>) -> Void) {
        
        //MARK: -> JSON (API MOVIEDB)
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=38445509e86571a323a508cec1fc05c2&language=en-US&page=1"
        
        guard let url = URL(string: popularMoviesURL) else {return}
        
        
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            if let error = error {
                completion(.failure(error))
                print("DataTask error: \(error.localizedDescription)")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                
                print("Empty Data")
                return
            }
            
            do {
                
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                
                DispatchQueue.main.async {
                    completion(.success(jsonData))
                }
            } catch let error {
                completion(.failure(error))
            }
            
        }
        dataTask?.resume()
    }
}
