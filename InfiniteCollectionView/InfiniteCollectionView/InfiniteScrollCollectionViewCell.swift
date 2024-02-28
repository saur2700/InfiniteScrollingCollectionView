//
//  InfiniteScrollCollectionViewCell.swift
//  InfiniteCollectionView
//
//  Created by Saurav Kumar on 28/02/24.
//

import UIKit

class InfiniteScrollCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var pictureImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(imageName: String) {
        self.pictureImageView.image = UIImage(named: imageName)
    }

}
