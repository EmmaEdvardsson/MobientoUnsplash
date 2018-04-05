//
//  MUSearchViewController.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit

class MUSearchViewController: UIViewController {
    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoSearchBar.placeholder = "Write your search word here"
    }
}

extension MUSearchViewController: UISearchControllerDelegate {
    
}

extension MUSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return UICollectionViewCell()
    }
}
