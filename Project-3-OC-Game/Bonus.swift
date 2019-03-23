//
//  Bonus.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 20/03/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation
// TODO: Extention
class Bonus {
    // ingrement the the victim life point to 0, and remove half of the life point from all characters of the opposite team
    func selfDestructionBonus(victim: Character, attackerTeam: Team) {
        victim.life = 0
        for character in attackerTeam.characters {
            character.life /= 2
        }
        print("""
            
            ❗️❗️❗️Due to his low level of life points, \(victim.name) the \(victim.charactertype) \(victim.charactertype.getEmoji()) choose by himself, to use self Destuct, by this action, he fainted 💀 but he also inflict a loose of half to the life points of all the characters in the Team \(attackerTeam.name)❗️❗️❗️
            
            """)
        
    }
    
    func magicBoxAppearence(character: Character) {
        let value = Int.random(in: 0..<2)
        if value == 0 {
            magicBox(character: character)
        }
    }
    
    func magicBox(character: Character){
        let weapons = WeaponType.getWeaponsFor(type: character.charactertype)
        let randomValue = Int.random(in: 0..<weapons.count)
        let newWeapon = weapons [randomValue]
        
        guard character.weaponType != newWeapon else {
            magicBox(character: character)
            return
        }
        
        print("""
            
            \(character.name), the \(character.charactertype) \(character.charactertype.getEmoji()), find a Magic Box 🎁!!!!
            
            On this Magic Box🎁, there a e new weapon !!! Your character took it !!!
            
            Before, he had \(character.weaponType) \(character.weaponType.emoji()) with a power of \(character.weaponType.power())
            """)
        character.weaponType = newWeapon
        
        print("""
            
            🎉 Now he is armed by \(character.weaponType) \(character.weaponType.emoji()) with a power of \(character.weaponType.power())
            """)
    }
}

