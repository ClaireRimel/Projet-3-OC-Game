//
//  WeaponType.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 17/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


enum WeaponType {
    case sword, knif, dragger, gun, magicPotion, apples, serum, elexirOfYouth, ironGlove, chain, bricks, bomb, axe, spanner, hammer, firecraker

    //Raw value, affecte *DICTIONNAIRE/Tableau ,dans chaque case affecter 3 fonctions, associted value,  function fonction similaire
    func weaponsName() -> String {
        switch self {
        case .sword:
            return "Sword"
        case .knif:
            return "Knif"
        case .dragger:
            return "Dragger"
        case .gun:
            return "Gun"
        case .magicPotion:
            return "Magic Potion"
        case .apples:
            return "Apples"
        case .serum:
            return "Serum"
        case .elexirOfYouth:
            return "Elexir Of Youth"
        case .ironGlove:
            return "Iron Glove"
        case .chain:
            return "Chain"
        case .bricks:
            return "Bricks"
        case .bomb:
            return "Bomb"
        case .axe:
            return "Axe"
        case .spanner:
            return "Spanner"
        case .hammer:
            return "Hammer"
        case .firecraker:
            return "firecraker"
        }
    }
    
    func power() -> Int {
        switch self {
        case .sword:
            return 10
        case .knif:
            return 15
        case .dragger:
            return 24
        case .gun:
            return 30
        case .magicPotion:
            return 8
        case .apples:
            return 15
        case .serum:
            return 20
        case .elexirOfYouth:
            return 25
        case .ironGlove:
            return 6
        case .chain:
            return 12
        case .bricks:
            return 18
        case .bomb:
            return 24
        case .axe:
            return 30
        case .spanner:
            return 37
        case .hammer:
            return 40
        case .firecraker:
            return 48
        }
    }
    
    func emoji() -> String {
        switch self {
        case .sword:
            return "⚔️"
        case .knif:
            return "🔪"
        case .dragger:
            return "🗡"
        case .gun:
            return "🔫"
        case .magicPotion:
            return "🍵"
        case .apples:
            return "🍎🍏"
        case .serum:
            return "🧪"
        case .elexirOfYouth:
            return "🧬"
        case .ironGlove:
            return "🥊"
        case .chain:
            return "⛓"
        case .bricks:
            return "🧱"
        case .bomb:
            return "💣"
        case .axe:
            return "⛏"
        case .spanner:
            return "🔧"
        case .hammer:
            return "🔨"
        case .firecraker:
            return "🧨"
        }
    }
    
    static func getWeaponsFor(type: CharacterType) -> [WeaponType] {
        switch type {
        case .wizard:
            return [.apples, .serum, .elexirOfYouth, ]
        case .warrior:
            return [.knif, .dragger, .gun]
        case .colossus:
            return [.chain, .bricks, .bomb]
        case .midget:
            return [.spanner, .hammer, .firecraker ]
        }
    }
}
