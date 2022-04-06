//
//  DetailPeopleCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit
import SnapKit

class GeneralInfoCell: UICollectionViewCell {
    
    static let identifier = "GenreDirectorActorsImdbratingCell"

    // MARK: Views

   private let genre: UILabel = {
      let label = UILabel()
       label.numberOfLines = 0
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
//       label.backgroundColor = .green
       return label
   }()
    
    private let director: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
//        label.backgroundColor = .black
       return label
   }()
    
    private let actors: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
//        label.backgroundColor = .green
       return label
   }()
    
    private let imdbRating: UILabel = {
      let label = UILabel()
        label.numberOfLines = 0
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
//        label.backgroundColor = .black
       return label
   }()

    // MARK: Setup
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(genre)
        contentView.addSubview(director)
        contentView.addSubview(actors)
        contentView.addSubview(imdbRating)
        
        constraints()
        
//        contentView.backgroundColor = .orange
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(genre: String, director: String, actors: String, imdbRating: String) {
        self.genre.text = genre
        self.director.text = director
        self.actors.text = actors
        self.imdbRating.text = imdbRating
        
    }
        
    override func prepareForReuse() {
            super.prepareForReuse()
            genre.text = nil
            director.text = nil
            actors.text = nil
            imdbRating.text = nil
        }
    
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        self.backgroundColor = .lightGray
//
//        genre.frame = CGRect(x: 10,
//                            y: 0,
//                            width: contentView.frame.size.width / 4 ,
//                            height: contentView.frame.size.height / 4)
//        director.frame = CGRect(x: 10,
//                                y: 30,
//                                width: contentView.frame.size.width ,
//                                height: contentView.frame.size.height / 4)
//        actors.frame = CGRect(x: 10,
//                              y: 60,
//                              width: contentView.frame.size.width ,
//                              height: contentView.frame.size.height / 4)
//        imdbRating.frame = CGRect(x: 10,
//                                  y: 90,
//                                  width: contentView.frame.size.width ,
//                                  height: contentView.frame.size.height / 4)
//        }
    }

extension GeneralInfoCell {
    func constraints() {
        genre.snp.makeConstraints { make in
            make.width.leading.trailing.top.equalToSuperview()
            make.height.equalTo(contentView.frame.size.height / 4)
            
        }
        
        director.snp.makeConstraints { make in
            make.width.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView.frame.size.height / 4)
            make.top.equalTo(genre.snp.bottom).offset(5)
        }
        
        actors.snp.makeConstraints { make in
            make.width.leading.trailing.equalToSuperview()
            make.height.equalTo(contentView.frame.size.height / 4)
            make.top.equalTo(director.snp.bottom).offset(5)
        }
        
        imdbRating.snp.makeConstraints { make in
            make.width.leading.trailing.bottom.equalToSuperview()
            make.height.equalTo(contentView.frame.size.height / 4)
            make.top.equalTo(actors.snp.bottom).offset(5)
        }
        
    }
}
    

    

