//
//  MUSearchViewController.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import RxSwift

class MUSearchViewController: UIViewController {
    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    var pageNumber = 1
    var searchMore: Bool = true
    var photosArray: [MUPhoto] = []
    let kPhotoCellIdentifier = "PhotoCellIdentifier"
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoSearchBar.placeholder = "Write your search word here"
    }
    
    @IBAction func runRequest(_ sender: Any) {
        MUAppManager.getSearchResults(forSearchText: "", page: pageNumber, success: { searchResult in
            if searchResult.totalPages > self.pageNumber {
                self.pageNumber += 1
                self.searchMore = true
                self.searchResultCollectionView.reloadData()
                guard let photos = searchResult.photos else { return }
                self.photosArray.append(contentsOf: photos)
            } else {
                self.pageNumber = 1
                self.searchMore = false
                self.photosArray = []
                self.searchResultCollectionView.reloadData()
            }
        })
    }
}

extension MUSearchViewController: UISearchControllerDelegate {
}

extension MUSearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kPhotoCellIdentifier, for: indexPath) as? MUPhotoCollectionViewCell,
            photosArray.count > indexPath.row
            else { return UICollectionViewCell() }
        
        cell.setupCell(withPhoto: photosArray[indexPath.row])
        
        return cell
    }
}
