//
//  Character.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


enum CharacterType: Int {
    case warior = 1, wizard, colossus, midget
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
        case .warior:
            self.weaponType = .sword
            self.life = 100
            
        case .wizard:
            self.weaponType = .magicPotion
            self.life = 80
            
        case.colossus:
            self.weaponType = .ironGlove
            self.life = 150
            
        case.midget:
            self.weaponType = .axe
            self.life = 50
        }
    }
    // Tempoary place, this implement the action of the characters
    func action(target: Character) {
        if charactertype == .wizard {
            target.life += weaponType.power()
        } else {
            target.life -= weaponType.power()
        }
    }
}



