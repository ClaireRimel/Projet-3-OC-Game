//
//  Bonus.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 20/03/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

class Bonus {
    func checkSelfDestructionBonus(victim: Character, attackerTeam: Team) {
        if victim.life <= 7 {
            victim.life = 0
            for character in attackerTeam.characters {
                character.life /= 2
              
            }
            print("""
                
                ❗️❗️❗️ \(victim.name) the \(victim.charactertype) \(victim.charactertype.getEmoji()) use self Destuct, by this attack he fainted 💀 but at the same time, he inflict a loose of the half to the life points of all the characters of the Team \(attackerTeam.name)❗️❗️❗️
                
                """)
            
            //
        }
    }
}
