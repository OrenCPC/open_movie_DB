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
    
    // MARK: Views
    
    private let myImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "step_brothers_1")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let myLabel: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .bold)
        label.text = "Custom Cell"
        return label
    }()
   
    
    // MARK: Setup
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(text: String, imageStringPoster: String) {
        myLabel.text = text
        let url = URL(string: imageStringPoster)
        myImageView.kf.setImage(with: url)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 6
        
        myLabel.frame = CGRect(x: 10,
                               y: 0,
                               width: contentView.frame.size.width - 10 - imageSize,
                               height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: contentView.frame.size.width-imageSize,
                                   y: 3,
                                   width: imageSize,
                                   height: imageSize)
    }
}

