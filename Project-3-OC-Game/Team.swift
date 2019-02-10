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
    print("Team: \(team.name)")
    // Choose 1 character and give a name 3 times
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
            repeat {
                characterName = addNameToYourCharacter()
            } while isCharacterNameIsUnique(characterName: characterName) == false
            
            let character = Character(name: characterName, charactertype: type)
            team.characters.append(character)
            
        } else {
            
            print("Please enter un number between 1 and 4")
            
        }
        
    } while team.characters.count < 3
    
}

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


//      if isCharacterNameIsUnique(characterName: value)
