//
//  Character.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


enum CharacterType: Int {
    case Warior = 1, Magus, Colossus, Midget
}

class Character {
    var name: String
    let charactertype: CharacterType
    var weapon: Weapon
    var life: Int
    
    init(name: String, charactertype: CharacterType){
        self.name = name
        self.charactertype = charactertype
        
        switch self.charactertype {
        case .Warior:
            self.weapon = Sword()
            self.life = 100
            
        case.Magus:
            self.weapon = MagicPotion()
            self.life = 80
            
        case.Colossus:
            self.weapon = IronGlove()
            self.life = 150
            
        case.Midget:
            self.weapon = Axe()
            self.life = 50
        }
    }
}



