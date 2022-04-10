//
//  DetailPlotCollectionViewCell.swift
//  OpenMovieDB
//
//  Created by Oren Dinur on 04/04/2022.
//

import UIKit
import SnapKit

class PlotCell: UICollectionViewCell {
   
    static let identifier = "PlotCell"
    
    // MARK: Views
    
   private let plot: UILabel = {
      let label = UILabel()
       label.font = .systemFont(ofSize: 20, weight: .bold)
       label.textColor = .white
       label.numberOfLines = 0
//       label.backgroundColor = .green
       return label
   }()
   
    
    // MARK: Setup
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.addSubview(plot)
        constraints()

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
    }

extension PlotCell {
    
    func constraints() {
        plot.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview()
            make.top.equalToSuperview().offset(15)
        }
    }
}
