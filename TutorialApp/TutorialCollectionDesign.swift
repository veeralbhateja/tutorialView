//
//  TutorialCollectionDesign.swift
//  TutorialApp
//
//  Created by Veeral Bhateja on 20/06/19.
//  Copyright © 2019 Veeral Bhateja. All rights reserved.
//

import UIKit

class TutorialCollectionDesign: UICollectionViewCell {

    @IBOutlet weak var imageViewBG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setImage(_ imageName: String){
        self.imageViewBG.image = UIImage(named: imageName)
    }
    
}
