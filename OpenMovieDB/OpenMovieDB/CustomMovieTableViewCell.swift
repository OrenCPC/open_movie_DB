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

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, imageStringPoster: String, year: String, imdbID: String) {
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
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
        myImageView.image = nil
        releaseDate.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.backgroundColor = UIColor(red: 0.3, green: 0.3, blue: 0.3, alpha: 1.0)

        
        let imageSize = contentView.frame.size.height - 6
        
        title.frame = CGRect(x: 10,
                               y: 0,
                               width: contentView.frame.size.width - 10 - imageSize,
                               height: contentView.frame.size.height)
        releaseDate.frame = CGRect(x: 10,
                               y: 20,
                               width: contentView.frame.size.width - 10 - imageSize,
                               height: contentView.frame.size.height)
        
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
}

