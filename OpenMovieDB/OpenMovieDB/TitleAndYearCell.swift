//
//  TitleAndYearCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit
import SnapKit

class TitleAndYearCell: UICollectionViewCell {
    
    static let identifier = "TitleAndYearCell"
    
    // MARK: Views
    
    private let title: UILabel = {
      let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .white
        label.numberOfLines = 0
//        label.backgroundColor = .orange
       return label
   }()
   
    private let releaseDate : UILabel = {
      let label = UILabel()
       label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .white
//        label.backgroundColor = .red
       return label
   }()
    
    // MARK: Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(title)
        contentView.addSubview(releaseDate)
        
                
        constraints()


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
    
}

extension TitleAndYearCell {
    
    func constraints() {
        
        title.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.trailing.top.equalToSuperview()
            make.leading.trailing.equalTo(30)
            make.height.equalTo(100)
           
        }
        
        releaseDate.snp.makeConstraints { make in
            make.trailing.bottom.equalToSuperview()
            make.top.equalTo(title.snp.bottom)
            make.width.equalToSuperview()
            make.leading.equalTo(30)

            make.height.equalTo(25)
            
        }
    }
}
