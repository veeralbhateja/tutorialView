//
//  TutorialViewState.swift
//  TutorialApp
//
//  Created by Veeral Bhateja on 26/06/19.
//  Copyright © 2019 Veeral Bhateja. All rights reserved.
//

import Foundation

private let appUserDefaults = UserDefaults.standard
class TutorialViewState{
    
    static let shared = TutorialViewState()
    private init(){}
    
    enum appUserKey: String {
        case isViewed = "isViewed"
    }
    
    var isViewed:Bool {
        set {
            appUserDefaults.setValue(newValue, forKey: appUserKey.isViewed.rawValue)
            appUserDefaults.synchronize()
        }
        get {
            return appUserDefaults.bool(forKey: appUserKey.isViewed.rawValue)
        }
    }
}
