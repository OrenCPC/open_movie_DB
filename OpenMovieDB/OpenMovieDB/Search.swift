//
//  Search.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import Foundation
import Alamofire


class Search {
    
    var url: String = ""
    private (set) var films = [[String:Any]]()
    private let myApiKey = "757bb97b"
    
    func fetchFilms(url: String, onComplete: () -> Void) {
        Alamofire.request(url).responseJSON{ (response) in
            if let json = response.result.value as! [String:Any]?{
                if let responseValue = json["Search"] as! [[String:Any]]?{
                    self.films = responseValue
                }
            } 
        }
        onComplete()
    }
    
    func searchFilms(text : String, onComplete: ([[String:Any]]) -> Void) {
        url = "https://www.omdbapi.com/?s="+text+"&apikey="+myApiKey
        fetchFilms(url: url) {
            print(films)
            onComplete(films)
        }
    }
}
