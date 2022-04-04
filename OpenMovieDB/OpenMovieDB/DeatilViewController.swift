//
//  DeatilViewController.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class DeatilViewController: UIViewController {
    
    private lazy var detailedSearchModel = SearchDetailed()
//    var film = [String:Any]()


    var imdbID: String? {
        didSet {
            
        }
    }
    
//    var film = [String:Any]()
    var film: [String: Any] = ["Title":"The Social Network",
        "Year":"2010",
        "Rated":"PG-13","Released":"01 Oct 2010"]
    
    // MARK: Views
    private let collectionView: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: DetailCollectionViewCellWithImage.identifier)

        return collectionView
    }()
    
    
//    private let myImageView: UIImageView = {
//       let imageView = UIImageView()
//        imageView.image = UIImage(named: "no_image_available")
//        imageView.contentMode = .scaleAspectFill
//        imageView.clipsToBounds = true
//        return imageView
//    }()
//
//    private let FilmTitle : UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 17, weight: .bold)
//        return label
//    }()
//
//    private let releaseDate : UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 17, weight: .bold)
//        return label
//    }()
//
//    private let imdbID : UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 17, weight: .bold)
//        return label
//    }()
//
//    private let movieType : UILabel = {
//       let label = UILabel()
//        label.font = .systemFont(ofSize: 17, weight: .bold)
//        return label
//    }()
//
    
    
    // MARK: Setup

    override func viewDidLoad() {
        super.viewDidLoad()
        print("I arrived bitch")
        print("this is my imdb bitch \(self.imdbID)")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        subviews()
        constraints()
    }
}

extension DeatilViewController {
    func subviews() {
        view.addSubview(collectionView)

//        view.addSubview(tableView)
//        view.addSubview(textBox)
    }
    
    func constraints() {
        
        NSLayoutConstraint.activate([
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
                collectionView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
                collectionView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)
            ])
//        let sizeThatFits = textBox.sizeThatFits(CGSize(width: view.frame.width, height: CGFloat(MAXFLOAT)))
//
//        textBox.snp.makeConstraints{ make in
//            make.leading.equalToSuperview().offset(20)
//            make.trailing.equalToSuperview().offset(-20)
//            make.top.equalToSuperview().offset(50)
//            make.height.equalTo(sizeThatFits)
//        }
//
//        tableView.snp.makeConstraints{ make in
//            make.leading.trailing.bottom.equalToSuperview()
//            make.top.equalTo(textBox.snp.bottom).offset(30)
//        }
    }
}

extension DeatilViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  DetailCollectionViewCellWithImage.identifier, for: indexPath)
        if let inputCell = cell as? DetailCollectionViewCellWithImage {
        
        }

        return cell
    }

}

extension DeatilViewController: UICollectionViewDelegate {
    
}
