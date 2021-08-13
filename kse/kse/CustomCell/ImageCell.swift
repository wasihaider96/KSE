//
//  ImageCell.swift
//  kse
//
//  Created by Dev ILI on 13/08/2021.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    static let identifier = "ImageCell"
    
    @IBOutlet weak var cellImageView: UIImageView!
    
    func prepareCell(_ image: UIImage) {
        cellImageView.image = image
    }
    
}
