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
    
    
    func fetchFilm(url: String, onComplete: () -> Void) {
        Alamofire.request(url).responseJSON{ (response) in
            if let json = response.result.value as! [String:Any]?{
                
                //Check how to use
                if let responseValue = json[""] as! [String:Any]?{
                    self.film = responseValue
                }
            }
        }
        onComplete()
    }
    
    func searchFilms(imdbID : String, onComplete: ([String:Any]) -> Void) {
        url = "https://www.omdbapi.com/?i="+imdbID+"&apikey="+myApiKey
        fetchFilm(url: url) {
            print(film)
            onComplete(film)
        }
    }
    
}
