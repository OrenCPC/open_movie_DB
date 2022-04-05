//
//  TitleAndYearCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class TitleAndYearCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TitleAndYearCell"
    
    // MARK: Views
    
    private let title: UILabel = {
      let label = UILabel()
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
       return label
   }()
   
    private let releaseDate : UILabel = {
      let label = UILabel()
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
       return label
   }()
    
    // MARK: Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(title)
        contentView.addSubview(releaseDate)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, year: String) {
        title.text = text
        if !year.isEmpty, year.last! == "-" {
            self.releaseDate.text = String(year.dropLast())
        } else {
            self.releaseDate.text = year
        }
        
        func prepareForReuse() {
            super.prepareForReuse()
            title.text = nil
            releaseDate.text = nil
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = .blue


        title.frame = CGRect(x: 10,
                               y: 0,
                               width: contentView.frame.size.width ,
                               height: contentView.frame.size.height / 3)
        releaseDate.frame = CGRect(x: 10,
                               y: 20,
                               width: contentView.frame.size.width ,
                               height: contentView.frame.size.height / 3)
    }

    
}
