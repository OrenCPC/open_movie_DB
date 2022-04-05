//
//  DeatilViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class DeatilViewController: UIViewController {
    
    private lazy var detailedSearchModel = SearchDetailed()

    var imdbID = "tt0360717"
    
    private let customCellsCount = 3

    var film: [String: Any] = ["Title":"The Social Network",
        "Year":"2010",
        "Rated":"PG-13","Released":"01 Oct 2010"]
    
    
    
    
    
    // MARK: Views
   
    let collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero , collectionViewLayout: layout)
        
        collectionView.register(DetailCollectionViewCellWithImage.self, forCellWithReuseIdentifier: DetailCollectionViewCellWithImage.identifier)
        
        collectionView.register(TitleAndYearCollectionViewCell.self, forCellWithReuseIdentifier: TitleAndYearCollectionViewCell.identifier)
        
        collectionView.register(DetailPeopleCollectionViewCell.self, forCellWithReuseIdentifier: DetailPeopleCollectionViewCell.identifier)
        
        collectionView.register(DetailPlotCollectionViewCell.self, forCellWithReuseIdentifier: DetailPlotCollectionViewCell.identifier)


        return collectionView
    }()
    
    
    // MARK: Setup

    override func viewDidLoad() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        subviews()
        collectionView.frame = view.bounds


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
        if indexPath.row == 0 {
            
            return  CGSize(width: collectionView.frame.size.width/3, height: collectionView.frame.size.height/3)

        }
        return CGSize(width: 200.0, height: 200.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    //poster
    //title, releaseDate
    //Genre, Director, Actors, imdbRating
    //Plot

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.row {
            
        case 0: // MARK: Cell 0 (poster)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCellWithImage.identifier, for: indexPath)
            if let inputCell = cell as? DetailCollectionViewCellWithImage {
                inputCell.configure(imageStringPoster: "https://m.media-amazon.com/images/M/MV5BOGUyZDUxZjEtMmIzMC00MzlmLTg4MGItZWJmMzBhZjE0Mjc1XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg")
            }
            return cell
        case 1: // MARK: Cell 1 (title, releaseDate)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TitleAndYearCollectionViewCell.identifier, for: indexPath)
            if let inputCell = cell as? TitleAndYearCollectionViewCell {
                inputCell.configure(text: "Sample Title", year: "Sample date")
            }
            return cell
        case 2: //  MARK: Cell 2(Genre, Director, Actors, imdbRating)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPeopleCollectionViewCell.identifier, for: indexPath)
            if let inputCell = cell as? DetailPeopleCollectionViewCell {
                inputCell.configure(genre: "Genre", director: "Director", actors: "Oren, Dinur, Oren, Dinur", imdbRating: "9.9")
            }
            return cell
            
        case 3: // MARK: Cell 4(Plot)
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailPlotCollectionViewCell.identifier, for: indexPath)
            if let inputCell = cell as? DetailPlotCollectionViewCell {
                inputCell.configure(plot: "This is the plot")
            }
            return cell
        default: return collectionView.dequeueReusableCell(withReuseIdentifier: DetailPlotCollectionViewCell.identifier, for: indexPath)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
    
}


