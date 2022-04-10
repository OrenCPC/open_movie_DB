//
//  CustomMovieTableViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 03/04/2022.
//

import UIKit
import Kingfisher

class CustomMovieTableViewCell: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    var imdbID: String?
    
    // MARK: Views
    
    private let myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "no_image_available")
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
     let title: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
         label.numberOfLines = 0
        return label
    }()
    
    private let releaseDate : UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.textColor = .white
        return label
    }()
    

   
    
    // MARK: Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(myImageView)
        contentView.addSubview(title)
        contentView.addSubview(releaseDate)
        
        constraints()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, imageStringPoster: String, year: String, imdbID: String) {
        self.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)
        
        title.text = text
        if !year.isEmpty, year.last! == "-" {
            self.releaseDate.text = String(year.dropLast())
        } else {
            self.releaseDate.text = year
        }
        if imageStringPoster != "N/A" {
            let url = URL(string: imageStringPoster)
            myImageView.kf.indicatorType = .activity
            myImageView.kf.setImage(with: url)
        }
        self.imdbID = imdbID
        
//        if title.text == "Breaking Bad" { contentView.backgroundColor = .blue}
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        myImageView.image = nil
        releaseDate.text = nil
    }
    
    
}

extension CustomMovieTableViewCell {
    func constraints() {
        title.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalTo(myImageView.snp.leading).offset(-10)
            make.height.equalTo(110)
            make.width.equalTo(contentView.frame.size.width / 2)
        }
        
        releaseDate.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.height.equalTo(50)
            make.width.equalToSuperview()
            make.top.equalTo(title.snp.bottom).offset(10)
        }
        
        myImageView.snp.makeConstraints { make in
            make.height.equalToSuperview()
            make.centerY.top.bottom.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
            make.width.equalTo(contentView.frame.size.width / 2)
        }
    }
}

