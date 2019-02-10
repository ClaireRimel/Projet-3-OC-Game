//
//  Team.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


class Team {
    // Remind add rule, 3 characters max
    var characters: [Character] = []
    
    let name: String
    
    init(name: String) {
        self.name = name
        
    }
}

//Create array of Team
var teams: [Team] = []

//Create 2 teams
func enterTeamName(){
    
    for i in 1...2 {
        
        var name: String?
        
        //ask user a team's name
        repeat {
            print("Player \(i), please enter your team´s name")
            
            name = readLine()
            
            // add optinal binding, to extract the value form an optional if it exist
            if let value = name, value.count > 0 {
                let name = Team(name: value)
                teams.append(name)
            }
        } while (name == nil || name?.count == 0)
    }
}

// add character to the team
func addTeamMember(team: Team){
    // Choose 1 character and give a name 3 times
    repeat {
        print("Please choose 3 characters to constitue your team, (1 to 4)"
            + "\n1. 🤺 Warior: 100, ⚔️: 10"
            + "\n2. 🧞‍♂️ Magus, ❤️: 75, 🍵: 8"
            + "\n3: 🏋🏻‍♂️ Colossus, ❤️: 150, 🥊: 6"
            + "\n4: 🧝🏻‍♂️ Midget, ❤️: 50, ⛏: 30 ")
        
        // Turn a string optionnal into an Int non-optional.
        let input = readLine()
        
        if let inputNonOptional = input,
            let inputNumber = Int(inputNonOptional),
            let type = CharacterType(rawValue: inputNumber) {
            
            print("You have selected the the \(team.characters)")
            
            var characterName: String?
            
            repeat {
                print("Please enter the character´s name")
                characterName = readLine()
                // add optinal binding, to extract the value form an optional if it exist
                if let value = characterName, value.count > 0 {
                    let characterName = Character(name: value, charactertype: type)
                    team.characters.append(characterName)
                    
                }
                
            } while (characterName == nil || characterName?.count == 0)
            
        } else {
            
            print("Please enter un number between 1 and 4")
            
        }
        
    } while team.characters.count <= 3
    
}
