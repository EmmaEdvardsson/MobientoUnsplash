//
//  MUFocusViewController.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import Kingfisher

class MUFocusViewController: UIViewController {
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var closeButton: UIButton!
    var imageUrl: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageUrl = imageUrl else { return }
        photoImageView.kf.setImage(with: URL(string: imageUrl))
    }
    
    @IBAction func close(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
