//
//  DetailCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit
import Kingfisher


class DetailCollectionViewCellWithImage: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    var ratio: CGFloat?
    
    // MARK: Views
    
   private let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "no_image_available")
        imageView.contentMode = .scaleAspectFill
       imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Views

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myImageView)
        
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageStringPoster: String) {
        if imageStringPoster != "N/A" {
            let url = URL(string: imageStringPoster)
            myImageView.kf.indicatorType = .activity
            myImageView.kf.setImage(with: url)
            //?
            guard myImageView.image != nil else { return}
            
            let width = myImageView.image?.size.width
            let height = myImageView.image?.size.height
            if let height = height, let width = width {
                ratio = CGFloat(width) / CGFloat(height)
            }

        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        myImageView.frame = CGRect(x: 0,
                                   y: 0,
                                   width: contentView.frame.size.width,
                                   height: contentView.frame.size.height)
    }
}



