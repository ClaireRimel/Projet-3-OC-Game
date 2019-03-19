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

////
//enum ArmaType {
//    //research Enum, associated type
//    case attack(AttackWeaponOption)
//    case heal(HealWeaponOption)
//}
//
//enum AttackWeaponOption {
//    case sword, ironGlove, axe, bonusSword, bonusIronGlove, bonusAxe
//
//    func power() -> Int {
//        switch self {
//        case .sword:
//            return 10
//        case .ironGlove:
//            return 6
//        case .axe:
//            return 30
//        case .bonusSword:
//            return 30
//        case .bonusIronGlove:
//            return 18
//        case .bonusAxe:
//            return 90
//
//        }
//    }
//
//enum HealWeaponOption {
//    case magicPotion, magicPotionBonus

//  func power() -> Int {
//        switch self {
//        case .magicPotion:
//            return 8
//        case .magicPotionBonus:
//            return 21
//
//  }
//}
//
//    func characterType() -> [CharacterType] {
//        switch self {
//        case .sword :
//            return [.warrior]
//        case .bonusSword:
//            return [.warrior]
//        case .ironGlove:
//            return [.colossus]
//        case .ironGloveBonus:
//            return [.colossus]
//        case .axe:
//            return [.midget]
//        case .axeBonus:
//            return [.midget]
//        case .magicPotion:
//            return [.wizard]
//        case .magicPotionBonus:
//            return [.wizard]
//
//        }
//    }
//}
//
