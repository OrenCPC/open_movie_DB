//
//  DeatilViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class DeatilViewController: UIViewController {
        
    private lazy var detailedSearchModel = SearchDetailed()
        
    var imdbID: String = "" {
        didSet {
            startSearch(imdbID: imdbID)
        }
    }
    
    func startSearch(imdbID: String) {
        detailedSearchModel.searchFilm(imdbID: imdbID) { film in
            self.collectionView.reloadData()
        }
    }
        
    // MARK: Views
   
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor(red: 0.0, green: 0, blue: 0, alpha: 1.0)

        collectionView.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.identifier)
        collectionView.register(TitleAndYearCell.self, forCellWithReuseIdentifier: TitleAndYearCell.identifier)
        collectionView.register(GeneralInfoCell.self, forCellWithReuseIdentifier: GeneralInfoCell.identifier)
        collectionView.register(PlotCell.self, forCellWithReuseIdentifier: PlotCell.identifier)

        return collectionView
    }()
    
    
    // MARK: Setup

    override func viewDidLoad() {
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        collectionView.frame = view.bounds
    }
}
extension DeatilViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        switch indexPath.row {
            
        case 0:
            return  CGSize(width: collectionView.frame.size.width, height: 130)
            
        case 1:
            return  CGSize(width: collectionView.frame.size.width, height: 200)
            
        case 2:
            return  CGSize(width: collectionView.frame.size.width, height: 200)

        case 3:
            return  CGSize(width: collectionView.frame.size.width, height: 200)

        default: return CGSize()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return getCellsCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch indexPath.row {
            
        case 0: // MARK: Cell 0 (title, releaseDate)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleAndYearCell.identifier, for: indexPath)
            if let inputCell = cell as? TitleAndYearCell {
                if let title = detailedSearchModel.film["Title"] as? String, let year = detailedSearchModel.film["Year"] as? String{
                    inputCell.configure(text: title, year: year)
                }
            }
            return cell
            
        case 1: // MARK: Cell 1 (poster)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCell.identifier, for: indexPath)
            if let inputCell = cell as? PosterCell {
                if let poster = detailedSearchModel.film["Poster"] as? String {
                    inputCell.configure(imageStringPoster: poster)
                }
            }
            return cell
            
        case 2: //  MARK: Cell 2(Genre, Director, Actors, imdbRating)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralInfoCell.identifier, for: indexPath)
            if let inputCell = cell as? GeneralInfoCell {
                if let genre = detailedSearchModel.film["Genre"] as? String, let director = detailedSearchModel.film["Director"] as? String,
                   let actors = detailedSearchModel.film["Actors"] as? String, let imdbRating = detailedSearchModel.film["imdbRating"] as? String {
                    inputCell.configure(genre: genre, director: director, actors: actors, imdbRating: imdbRating)
                }
            }
            return cell
            
        case 3: // MARK: Cell 4(Plot)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlotCell.identifier, for: indexPath)
            if let inputCell = cell as? PlotCell {
                if let plot = detailedSearchModel.film["Plot"] as? String {
                    inputCell.configure(plot: plot)

                }
            }
            return cell
            
        default: return collectionView.dequeueReusableCell(withReuseIdentifier: PlotCell.identifier, for: indexPath)
        }
    }
    
    
    func getCellsCount() -> Int {
        return 4
    }

}




