//
//  MUPhotoCollectionViewCell.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import Kingfisher

class MUPhotoCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var photoImageView: UIImageView!
    
    func setupCell(withPhoto: MUPhoto) {
        guard let thumbnail = withPhoto.thumbnailUrl else {
            photoImageView.backgroundColor = UIColor.red
            return
        }
        photoImageView.kf.setImage(with: URL(string: thumbnail))
    }
}
