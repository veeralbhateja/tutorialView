//
//  CustomCollectionVM.swift
//  TutorialApp
//
//  Created by Veeral Bhateja on 26/06/19.
//  Copyright © 2019 Veeral Bhateja. All rights reserved.
//

import UIKit

class CustomCollectionVM: NSObject,UICollectionViewDelegate, UICollectionViewDataSource,UIScrollViewDelegate, UICollectionViewDelegateFlowLayout {
    typealias scrollIndBlock = (_ scrollIndex :Int) ->()

    private var imageArray: [String] = [String]()
    private var scrolledTo: scrollIndBlock!
    
    init(_ imageArray: [String], scrolledTo: @escaping scrollIndBlock) {
        self.imageArray = imageArray
        self.scrolledTo = scrolledTo
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TutorialCollectionDesign", for: indexPath) as! TutorialCollectionDesign
        cell.setImage(imageArray[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/UIScreen.main.bounds.width)
        self.scrolledTo(Int(pageIndex))
    }

}
