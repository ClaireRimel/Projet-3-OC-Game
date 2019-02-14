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
    //Create array of Team
    var teams: [Team] = []
    
    let name: String
    
    init(name: String) {
        self.name = name
        
    }

// add character to the team
    func addTeamMember(team: Team){
        print("Team: \(team.name)")
    // Choose 1 character and give it a name, 3 times
        repeat {
        // display the current number of character
            print("Please choose 3 characters to constitue your team, (1 to 4)"
                + "\n1. 🤺 Warior, ❤️: 100, ⚔️: 10"
                + "\n2. 🧞‍♂️ Magus, ❤️: 75, 🍵: 8"
                + "\n3: 🏋🏻‍♂️ Colossus, ❤️: 150, 🥊: 6"
                + "\n4: 🧝🏻‍♂️ Midget, ❤️: 50, ⛏: 30 ")
        
            // Turn a string optionnal into an Int non-optional.
            let input = readLine()
        
            if let inputNonOptional = input,
                let inputNumber = Int(inputNonOptional),
                let type = CharacterType(rawValue: inputNumber) {
            
                print("You have selected the \(type)")
            
                var characterName: String
                // Verify if the name the player give a name.
                repeat {
                    characterName = addNameToYourCharacter()
                    // Verify of the name is avaible
                } while isCharacterNameIsUnique(characterName: characterName) == false
            
                let character = Character(name: characterName, charactertype: type)
            // add the character in the array corresponding
                team.characters.append(character)
            
            } else {
                print("Please enter un number between 1 and 4")
            }

        } while team.characters.count < 3
    }


// function which verify if the name the player give a name.
    func addNameToYourCharacter() -> String {
    
    var characterName: String?
    
    repeat {
        print("Please enter the character name")
        characterName = readLine()
        // add optinal binding, to extract the value form an optional if it exist
        if let value = characterName, value.count > 0 {
            characterName = value
    
        }
        
    } while (characterName == nil || characterName?.count == 0)
    
    return characterName!
}


//Function which verify of the name is avaible
func isCharacterNameIsUnique(characterName:String) -> Bool {
    
    for team in teams {
        // nested loop
        for character in team.characters {
            if characterName == character.name{
                print("This name is not avaible")
                return false
            }
        }
    }
    return true
    }
}
