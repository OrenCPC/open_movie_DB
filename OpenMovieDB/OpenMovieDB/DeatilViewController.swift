//
//  DeatilViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class DeatilViewController: UIViewController {
    
    // TODO: connect all cells(other than poster) to the network call :)
    
    private lazy var detailedSearchModel = SearchDetailed()
    
    private var film = [String:Any]()
    
    var imdbID: String = "" {
        didSet {
            startSearch(imdbID: imdbID)
        }
    }
    
    func startSearch(imdbID: String) {
        print("imdbID: \(imdbID)")
        detailedSearchModel.searchFilm(imdbID: imdbID) { film in
            self.film = film
            print(self.film)
            self.collectionView.reloadData()
        }
    }
        
    // MARK: Views
   
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        
        collectionView.register(PosterCell.self, forCellWithReuseIdentifier: PosterCell.identifier)
        
        collectionView.register(TitleAndYearCell.self, forCellWithReuseIdentifier: TitleAndYearCell.identifier)
        
        collectionView.register(GeneralInfoCell.self, forCellWithReuseIdentifier: GeneralInfoCell.identifier)
        
        collectionView.register(PlotCell.self, forCellWithReuseIdentifier: PlotCell.identifier)


        return collectionView
    }()
    
    
    // MARK: Setup

    override func viewDidLoad() {
        //
        imdbID = "tt0489105"
        //
        
        collectionView.dataSource = self
        collectionView.delegate = self
        subviews()
        collectionView.frame = view.bounds
        collectionView.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)

        
    }
}

extension DeatilViewController {
    func subviews() {
        view.addSubview(collectionView)

    }
    func constraints() {

//        collectionView.snp.makeConstraints{ make in
//            make.leading.equalToSuperview()
//            make.trailing.equalToSuperview()
//            make.top.equalToSuperview()
//            make.height.width.equalTo(200)
//        }
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
        return getCustomCellsCount()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
            
        case 0: // MARK: Cell 0 (title, releaseDate)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleAndYearCell.identifier, for: indexPath)
            if let inputCell = cell as? TitleAndYearCell {
                if let title = film["Title"] as? String, let year = film["Year"] as? String{
                    inputCell.configure(text: title, year: year)
                }
            }
            return cell
            
        case 1: // MARK: Cell 1 (poster)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PosterCell.identifier, for: indexPath)
            if let inputCell = cell as? PosterCell {
                if let poster = film["Poster"] as? String {
                    inputCell.configure(imageStringPoster: poster)
                }
            }
            return cell
            
            
            
            
            
        case 2: //  MARK: Cell 2(Genre, Director, Actors, imdbRating)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GeneralInfoCell.identifier, for: indexPath)
            if let inputCell = cell as? GeneralInfoCell {
                if let genre = film["Genre"] as? String, let director = film["Director"] as? String,
                   let actors = film["Actors"] as? String, let imdbRating = film["imdbRating"] as? String {
                    inputCell.configure(genre: genre, director: director, actors: actors, imdbRating: imdbRating)
                }
            }
            return cell
            
        case 3: // MARK: Cell 4(Plot)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlotCell.identifier, for: indexPath)
            if let inputCell = cell as? PlotCell {
                if let plot = film["Plot"] as? String {
                    inputCell.configure(plot: plot)

                }
            }
            return cell
            
        default: return collectionView.dequeueReusableCell(withReuseIdentifier: PlotCell.identifier, for: indexPath)
        }
    }
    
    
    
    func getCustomCellsCount() -> Int {
        return 4
    }

}




