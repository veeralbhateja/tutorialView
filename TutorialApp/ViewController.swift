//
//  ViewController.swift
//  TutorialApp
//
//  Created by Veeral Bhateja on 19/06/19.
//  Copyright © 2019 Veeral Bhateja. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewTut: TutorialView!

    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
//    override func loadView() {
//    }
//
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
}

