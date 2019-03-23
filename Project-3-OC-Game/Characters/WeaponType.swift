//
//  WeaponType.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 17/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

enum WeaponType {
    case sword, magicPotion, ironGlove, axe, bomb, hammer, knif, dragger, firecraker, chain, elexirOfYouth, serum, apples, gun, spanner, bricks
    
    func weaponsName() -> String {
        switch self {
        case .sword:
            return "Sword"
        case .magicPotion:
            return "Magic Potion"
        case .ironGlove:
            return "Iron Glove"
        case .axe:
            return "Axe"
        case .bomb:
            return "Bomb"
        case .hammer:
            return "Hammer"
        case .knif:
            return "Knif"
        case .dragger:
            return "Dragger"
        case .firecraker:
            return "firecraker"
        case .chain:
            return "Chain"
        case .elexirOfYouth:
            return "Elexir Of Youth"
        case .serum:
            return "Serum"
        case .apples:
            return "Apples"
        case .gun:
            return "Gun"
        case .spanner:
            return "Spanner"
        case .bricks:
            return "Bricks"
            
        }
    }
    
    func power() -> Int {
        switch self {
        case .sword:
            return 10
        case .magicPotion:
            return 8
        case .ironGlove:
            return 6
        case .axe:
            return 30
        case .bomb:
            return 58
        case .hammer:
            return 40
        case .knif:
            return 35
        case .dragger:
            return 50
        case .firecraker:
            return 48
        case .chain:
            return 45
        case .elexirOfYouth:
            return 30
        case .serum:
            return 20
        case .apples:
            return 15
        case .gun:
            return 26
        case .spanner:
            return 20
        case .bricks:
            return 19
            
        }
    }
    
    func emoji() -> String {
        switch self {
        case .sword:
            return "⚔️"
        case .magicPotion:
            return "🍵"
        case .ironGlove:
            return "🥊"
        case .axe:
            return "⛏"
        case .bomb:
            return "💣"
        case .hammer:
            return "🔨"
        case .knif:
            return "🔪"
        case .dragger:
            return "🗡"
        case .firecraker:
            return "🧨"
        case .chain:
            return "⛓"
        case .elexirOfYouth:
            return "🧬"
        case .serum:
            return "🧪"
        case .apples:
            return "🍎🍏"
        case .gun:
            return "🔫"
        case .spanner:
            return "🔧"
        case .bricks:
            return "🧱"
            
        }
    }
    
    static func getWeaponsFor(type: CharacterType) -> [WeaponType] {
        switch type {
        case .wizard:
            return [.elexirOfYouth, .serum, .apples]
        case .warrior:
            return [.knif, .dragger, .gun]
        case .colossus:
            return [.bomb, .chain, .bricks]
        case .midget:
            return [.hammer, .firecraker, .spanner ]
        }
    }
}
