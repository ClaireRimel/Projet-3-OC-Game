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
    
    let game: Game
    
    let name: String
    
    init(name: String, game: Game) {
        self.name = name
        self.game = game
    }

    // add character to the team
    func addTeamMembers(){
        print(" "
            + "\nTeam: \(name)")
    // Choose 1 character and give it a name, 3 times
        repeat {
        // display the current number of character
            print(" "
                + "\nPlease choose 3 characters to constitue your team, (1 to 4)"
                + "\n"
                + "\n1. \(CharacterType.warrior.getEmoji()) Warior   | ❤️: 100 | ⚔️: 10"
                + "\n2. 🧙🏻‍♂️ Wizard   | ❤️: 75  | 🍵: 8"
                + "\n3: 🏋🏻‍♂️ Colossus | ❤️: 150 | 🥊: 6"
                + "\n4: 🧝🏻‍♂️ Midget   | ❤️: 50  | ⛏: 30"
                + "\n")
        
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
                } while game.isCharacterNameIsUnique(characterName: characterName) == false
            
                let character = Character(name: characterName, charactertype: type)
            // add the character in the array corresponding
                characters.append(character)
            
            } else {
                print("Please enter un number between 1 and 4"
                    + "\n")
            }

        } while characters.count < 3
    }


    // function which verify if the name the player give a name.
    func addNameToYourCharacter() -> String {
        var characterName: String?
        
        repeat {
            print("\nPlease enter the character name")
            characterName = readLine()
            // add optinal binding, to extract the value form an optional if it exist
            if let value = characterName, value.count > 0 {
                characterName = value
                
            }
            
        } while (characterName == nil || characterName?.count == 0)
        
        return characterName!
    }
    
    func displayCurrentStatus() {
        print(" "
            + "\nTeam \(name) you team is composed of :"
            + "\n")
        
        for character in characters {
            print("  - \(character.name) the \(character.charactertype), he have \(character.life) life points, he is armed with \(character.weaponType) which have a power of \(character.weaponType.power()) ")
        }
    }
    
    func hasLost() -> Bool {        
        // .filter extract juste the element that is required in the condition, is this case : life
        return characters.filter({ $0.life > 0 }).count == 0
    }
}
