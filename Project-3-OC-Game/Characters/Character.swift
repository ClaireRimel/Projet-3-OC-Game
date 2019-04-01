//
//  Character.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


enum CharacterType: Int {
    case warrior = 1, wizard, colossus, midget
    
    // Use to atribute an emoji to the character type
    func getEmoji() -> String {
        switch self {
        case .warrior:
            return "🤺"
        case .wizard:
            return "🧙🏻‍♂️"
        case .colossus:
            return "🏋🏻‍♂️"
        case .midget:
            return "🧝🏻‍♂️"
        }
    }
}


class Character {
    
    let name: String
    let charactertype: CharacterType
    var weaponType: WeaponType
    var life: Int
    
    init(name: String, charactertype: CharacterType){
        self.name = name
        self.charactertype = charactertype
        
        //Give to the character type a weaponType and set the life points
        switch self.charactertype {
        case .warrior:
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
    
    // This implement the action of the characters
    func action(target: Character) {
        if charactertype == .wizard {
            target.life += weaponType.power()
        } else {
            target.life -= weaponType.power()
        }
    }
}



