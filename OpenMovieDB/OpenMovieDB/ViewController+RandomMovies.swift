//
//  ViewController+RandomMovies.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 10/04/2022.
//

import Foundation

extension ViewController {
    public func getRandomMovie() -> String {
        let movies : [String] = ["Breaking%20Bad", "HALO", "Spider-man"]
        return movies.randomElement()!
    }
}
