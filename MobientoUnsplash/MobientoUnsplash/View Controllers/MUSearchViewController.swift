//
//  MUSearchViewController.swift
//  MobientoUnsplash
//
//  Created by Emma Edvardsson on 2018-04-05.
//  Copyright © 2018 Emma Edvardsson. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import DZNEmptyDataSet

class MUSearchViewController: UIViewController {
    @IBOutlet weak var photoSearchBar: UISearchBar!
    @IBOutlet weak var searchResultCollectionView: UICollectionView!
    var pageNumber = 1
    var searchMore: Bool = true
    var photosArray: [MUPhoto] = []
    let kPhotoCellIdentifier = "PhotoCellIdentifier"
    let kNumberOfCellsFromBottom = 6
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        setupAppearance()
    }
    
    func setupAppearance() {
        photoSearchBar.placeholder = "Write your search word here"
        searchResultCollectionView.emptyDataSetSource = self
        searchResultCollectionView.emptyDataSetDelegate = self
    }
    
    fileprivate func setupBindings() {
        photoSearchBar.rx.text
            .throttle(0.3, scheduler: MainScheduler.instance)
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { (searchText) in
                guard let searchText = searchText, !searchText.isEmpty else { return }
                
                self.photosArray.removeAll()
                self.search(withText: searchText)
            }).disposed(by: disposeBag)
    }
    
    func search(withText: String) {
        MUAppManager.getSearchResults(forSearchText: withText, page: self.pageNumber, success: { searchResult in
            if searchResult.totalPages > self.pageNumber {
                self.pageNumber += 1
                self.searchMore = true
            } else {
                self.pageNumber = 1
                self.searchMore = false
            }
            
            if let photos = searchResult.photos {
                self.photosArray.append(contentsOf: photos)
                self.searchResultCollectionView.reloadData()
            }
        })
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        photoSearchBar.endEditing(true)
    }
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
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if indexPath.row == (photosArray.count - kNumberOfCellsFromBottom) && searchMore {
            guard let searchText = photoSearchBar.text, !searchText.isEmpty else { return }
            self.search(withText: searchText)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let focusStoryboard =  UIStoryboard(name: MUViewControllers.focusView.storyboardName, bundle: nil)
        guard let focusViewController = focusStoryboard.instantiateViewController(withIdentifier: MUViewControllers.focusView.storyboardIdentifier) as? MUFocusViewController
            else { return }
        
        focusViewController.imageUrl = photosArray[indexPath.row].regularUrl
        self.present(focusViewController, animated: true, completion: nil)
    }
}

extension MUSearchViewController: DZNEmptyDataSetSource, DZNEmptyDataSetDelegate {
    func title(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "No images to show")
    }
    
    func description(forEmptyDataSet scrollView: UIScrollView!) -> NSAttributedString! {
        return NSAttributedString(string: "Write a search word in the search bar, and hope for some nice result")
    }
    
    func image(forEmptyDataSet scrollView: UIScrollView!) -> UIImage! {
        return UIImage(named: "noResultImage")
    }
    
    func emptyDataSet(_ scrollView: UIScrollView!, didTap view: UIView!) {
        self.photoSearchBar.resignFirstResponder()
    }
}
