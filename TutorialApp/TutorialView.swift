//
//  TutorialView.swift
//  TutorialApp
//
//  Created by Veeral Bhateja on 19/06/19.
//  Copyright © 2019 Veeral Bhateja. All rights reserved.
//

import UIKit

open class TutorialView: UIView {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var collectionTutorial: UICollectionView!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrevious: UIButton!
    @IBOutlet weak var buttonSkip: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    private var customColl: CustomCollectionVM? = nil
    private var isCircle: Bool = false
    public var homeViewController: UIViewController!
    
    @IBInspectable public var images_Coma: String = "" {
        didSet {
            if !TutorialViewState.shared.isViewed{
                self.imageArray = images_Coma.components(separatedBy: ",")
                self.pageControl.numberOfPages = imageArray.count
                registerTutorialCollection()
            }
        }
    }
    
    @IBInspectable public var rootVc: String = "" {
        didSet {
            if TutorialViewState.shared.isViewed{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: rootVc)
                let navigationController = UINavigationController(rootViewController: nextViewController)
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.window?.rootViewController = navigationController
            }
        }
    }
    
    @IBInspectable public var isCircular: Bool = false {
        didSet {
            self.isCircle = isCircular
        }
    }

    
    private var imageArray: [String] = [String]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }

    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        registerNib()
    }
    
    
    private func registerNib() {
        Bundle.main.loadNibNamed("TutorialView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    
    fileprivate func registerTutorialCollection() {
        self.collectionTutorial.register(UINib(nibName: "TutorialCollectionDesign", bundle: nil), forCellWithReuseIdentifier: "TutorialCollectionDesign")
        let block:CustomCollectionVM.scrollIndBlock = { currentPage in
            self.pageControl.currentPage = Int(currentPage)
        }
        self.customColl = CustomCollectionVM(imageArray, scrolledTo: block)
        self.collectionTutorial.delegate = customColl
        self.collectionTutorial.dataSource = customColl
        self.collectionTutorial.reloadData()
        updateStatus()
    }
    
    @IBAction func actionNext(_ sender: UIButton){
        let index = self.pageControl.currentPage
        if index < (self.pageControl.numberOfPages-1){
            moveToIndex(index + 1)
        }else if isCircle{
            moveToIndex(0)
            TutorialViewState.shared.isViewed = true
        }else{
            TutorialViewState.shared.isViewed = true
        }
    }
    
    @IBAction func actionPrevious(_ sender: UIButton){
        let index = self.pageControl.currentPage
        if index > 0{
            moveToIndex(index-1)
        }
    }
    
    private func updateStatus(){
        let index = self.pageControl.currentPage
        let numberOfPages = self.pageControl.numberOfPages
        buttonNext.isSelected = false
        if index == 0{
            buttonPrevious.isHidden = true
        }else if index > 0 && index < numberOfPages-1{
            buttonPrevious.isHidden = false
            buttonNext.isHidden = false
        }else if index == numberOfPages-1{
            if !isCircle{
                buttonNext.isSelected = true
            }
        }
    }
    
    @IBAction func actionSkip(_ sender: UIButton){
        TutorialViewState.shared.isViewed = true
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: rootVc)
        let navigationController = UINavigationController(rootViewController: nextViewController)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = navigationController
    }
    
    private func moveToIndex(_ index: Int){
        DispatchQueue.main.async {
            let indexPath: IndexPath = IndexPath(item: index, section: 0)
            self.collectionTutorial.scrollToItem(at: indexPath, at: .left, animated: true)
            self.pageControl.currentPage = index
            self.updateStatus()
        }
    }
    
    deinit {
        print("DeInitialized Tutorial Screen")
    }
}
