//
//  WeaponType.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 17/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

enum WeaponType {
    case sword, magicPotion, ironGlove, axe
    
    func power() -> Int {
        switch self {
        case .sword :
            return 10
        case .magicPotion:
            return 8
        case .ironGlove:
            return 6
        case .axe:
            return 30
        }
    }
}
