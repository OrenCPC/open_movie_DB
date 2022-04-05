//
//  DetailPlotCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit

class DetailPlotCollectionViewCell: UICollectionViewCell {
   
    static let identifier = "PlotCell"
    
    // MARK: Views
    
   private let plot: UILabel = {
      let label = UILabel()
       label.font = .systemFont(ofSize: 17, weight: .bold)
       label.textColor = .white
       return label
   }()
   
    
    // MARK: Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(plot)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(plot: String) {
        self.plot.text = plot
        
        }
        
    override func prepareForReuse() {
            super.prepareForReuse()
            plot.text = nil
        }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        self.backgroundColor = .orange
        plot.frame = CGRect(x: 10,
                            y: 0,
                            width: contentView.frame.size.width ,
                            height: contentView.frame.size.height / 3)
    }
}
