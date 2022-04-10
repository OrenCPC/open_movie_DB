//
//  SearchDetailed.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import Foundation
import Alamofire

class SearchDetailed {
    
    var url: String = ""
    private (set) var film = [String:Any]()
    private let myApiKey = "757bb97b"
    
    func clearFilm() {
        film = [:]
    }
    
    func fetchFilm(url: String, onComplete: @escaping (() -> Void)) {
        Alamofire.request(url).responseJSON{ (response) in
            if let json = response.result.value {
                self.film = json as! [String: Any]
                onComplete()
            }
        }
    }
    
    func searchFilm(imdbID : String, onComplete: @escaping (([String:Any]) -> Void)) {
        url = "https://www.omdbapi.com/?i="+imdbID+"&apikey="+myApiKey
        fetchFilm(url: url) {
            onComplete(self.film)
        }
    }
    
}
