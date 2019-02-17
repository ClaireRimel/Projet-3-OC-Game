//
//  Character.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


enum CharacterType: Int {
    case Warior = 1, Wizard, Colossus, Midget
}


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


class Character {
    
    let name: String
    
    let charactertype: CharacterType
    
    let weaponType: WeaponType
    
    var life: Int
    
    init(name: String, charactertype: CharacterType){
        self.name = name
        self.charactertype = charactertype
        
        switch self.charactertype {
        case .Warior:
            self.weaponType = .sword
            self.life = 100
            
        case .Wizard:
            self.weaponType = .magicPotion
            self.life = 80
            
        case.Colossus:
            self.weaponType = .ironGlove
            self.life = 150
            
        case.Midget:
            self.weaponType = .axe
            self.life = 50
        }
    }
}



