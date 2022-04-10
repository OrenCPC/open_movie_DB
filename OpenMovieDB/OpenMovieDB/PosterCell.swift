//
//  DetailCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit
import Kingfisher
import SnapKit


class PosterCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    private var imageRect = CGRect()
    
    // MARK: Views
    
   private let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
       imageView.clipsToBounds = true
        return imageView
    }()
    
    // MARK: Views

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(myImageView)
        constraints()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(imageStringPoster: String) {
        if imageStringPoster != "N/A" {
            let url = URL(string: imageStringPoster)
            myImageView.kf.indicatorType = .activity
            myImageView.kf.setImage(with: url)
            guard myImageView.image != nil else {
                myImageView.image = UIImage(named: "no_image_available")
                return
            }
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myImageView.image = nil
    }
}

extension PosterCell {
    func constraints() {
        myImageView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview()

        }
    }
}



