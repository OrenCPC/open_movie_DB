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
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 50, height: 50), collectionViewLayout: layout)        
        collectionView.register(DetailCollectionViewCellWithImage.self, forCellWithReuseIdentifier: DetailCollectionViewCellWithImage.identifier)
        collectionView.backgroundColor = .black

        return collectionView
    }()
    
    
    // MARK: Setup

    override func viewDidLoad() {
        
        collectionView.dataSource = self
        collectionView.delegate = self
        subviews()

    }
}

extension DeatilViewController {
    func subviews() {
        view.addSubview(collectionView)

    }
    func constraints() {

        collectionView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalToSuperview()
            make.height.width.equalTo(200)
        }
    }
}

extension DeatilViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailCollectionViewCellWithImage.identifier, for: indexPath) as! DetailCollectionViewCellWithImage
            
            return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
    
}


