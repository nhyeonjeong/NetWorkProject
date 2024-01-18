//
//  BookCollectionViewCell.swift
//  NetWorkProject
//
//  Created by 남현정 on 2024/01/18.
//

import UIKit
import Kingfisher

class BookCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var movieName: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var movieGradeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        settingCell()
    }

    func configureCell(data: Document) {
        movieName.text = data.title
        
        if let url = URL(string: data.thumbnail) {
            movieImageView.kf.setImage(with: url)
        } else {
            movieImageView.image = UIImage(systemName: "nosign")
        }
        
        movieGradeLabel.text = "\(data.salePrice)"
    }
    
    func settingCell() {
        movieName.font = .boldSystemFont(ofSize: 15)
        movieName.textColor = .white
        
        movieImageView.contentMode = .scaleAspectFill
        
        movieGradeLabel.font = .systemFont(ofSize: 13)
        movieGradeLabel.textColor = .white
    }
}
