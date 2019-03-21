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
}

