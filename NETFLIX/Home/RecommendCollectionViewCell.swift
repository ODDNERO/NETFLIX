//
//  RecommendCollectionViewCell.swift
//  NETFLIX
//
//  Created by NERO on 6/24/24.
//

import UIKit
import SnapKit
import Kingfisher

class RecommendCollectionViewCell: UICollectionViewCell {
    let movieImageView = Resource.movieImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RecommendCollectionViewCell {
    func configureLayout() {
        contentView.addSubview(movieImageView)
        movieImageView.snp.makeConstraints {
            $0.edges.equalTo(contentView.safeAreaLayoutGuide)
        }
    }
    
    func update(url: String) {
        let url = URL(string: url)
        movieImageView.kf.setImage(with: url)
    }
}