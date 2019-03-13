//
//  Fight.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


class Game {
    //Create array of Team
    var teams: [Team] = []
    
    func start() {
        print("   Welcome to Battle Game OC"
            + "\n"
            + "\n   This war game is simple, 2 teams with 3 characters per team"
            + "\n   You will have the choice between:"
            + "\n"
            + "\n   🤺 Warior, 100 life point, 10 inflicted by his Sword"
            + "\n   🧙🏻‍♂️ Wizard, 80 life point, 8 points recoverded by his Magic Potion"
            + "\n   🏋🏻‍♂️ Colossus, 150 life point, 6 inflicted by is Iron GLove"
            + "\n   🧝🏻‍♂️ Midget, 50 life point, 30 inflicted by his Axe"
            + "\n"
            + "\n   When your team is ready, let´s the game begin !!!"
            + "\n"
            + "\n"
            + "\n   OH, I forgot to tell you something... nothing is played in advance..."
            + "\n"
            + "\n                      ...Be aware..."
            + "\n")
        
        self.createTeams()
    }
    
    
    // Utils :
    
    //Function which verify of the name is avaible
    func isCharacterNameIsUnique(characterName: String) -> Bool {
        for team in teams {
            // nested loop
            for character in team.characters {
                if characterName == character.name{
                    print("This character name is not avaible"
                        + "\n")
                    return false
                }
            }
        }
        return true
    }
    
    // verify if the team name is unique, that return to a Bool
    func isTeamNameIsUnique(name: String) -> Bool {
        for team in teams {
            if name == team.name {
                print("This team name is not avaible"
                    + "\n")
                return false
            }
        }
        return true
    }
    
    func addNameToYourTeam() -> String {
        var name: String?
        
        repeat {
            
            print("Please enter a name"
                + "\n")
            name = readLine()
            // add optinal binding, to extract the value form an optional if it exist
            if let value = name, value.count > 0 {
                name = value
                
            }
            
        } while (name == nil || name?.count == 0)
        
        return name!
    }
    
    //Create 2 teams
    func createTeams() {
        
        for i in 1...2 {
            
            var name: String
            //ask user a team's name
            repeat {
                print("Player \(i), please enter your team´s name"
                    + "\n")
                
                name = addNameToYourTeam()
                
            } while isTeamNameIsUnique(name: name) == false
            
            let team = Team(name: name, game: self)
            // add the name in an array.
            teams.append(team)
            team.addTeamMembers()
            
        }
    }
    
    func startBattle() {
        var isFirstTeamTurn = true
        var hasTeam1Lost = false
        var hasTeam2Lost = false

        repeat {
            if isFirstTeamTurn {
                battleTurn(team: teams[0], enemyTeam: teams[1])
                hasTeam2Lost = teams[1].hasLost()
                
            } else {
                battleTurn(team: teams[1], enemyTeam: teams[0])
                hasTeam1Lost = teams[0].hasLost()
            }
            // .toggle, change and assign the value for the opposite boolean value
            isFirstTeamTurn.toggle()
            
         // !hasTeam1Lost change and BUT NOT assign the value for the opposite boolean value
        } while !hasTeam1Lost && !hasTeam2Lost
        
        // Print the winning team´s name
        if hasTeam1Lost {
            print("Congratulation \(teams[1].name), you win! 🏆")
        } else if hasTeam2Lost {
            print("Congratulation \(teams[0].name), you win! 🏆")
        }
    }

    
    // Print the character team to be selected
   
    func battleTurn(team: Team, enemyTeam: Team) {
        
        //MENU selection of character
        print("Team \(team.name)"
            + "\n"
            + "\nSelect a character to play:")
        let characterSelected = selectCharacterFrom(team: team)
        // print the character that could be cured
        if characterSelected.charactertype == .wizard {
            print("\nSelect a character from your team to heal:")
            
            // Should the wizard be able to heal himself ?
            let characterToHealSelected = selectCharacterFrom(team: team)
            characterSelected.action(target: characterToHealSelected)
            // The characters can have more life points that they initialy have ?
            
            print("""
                
                \(characterToHealSelected.name) \(characterToHealSelected.charactertype.getEmoji()) has being healed by \(characterSelected.name) \(characterSelected.charactertype.getEmoji()), and has now \(characterToHealSelected.life) life points ❤️.
                
                """)
        } else {
            print("\nSelect an enemy to attack:")
            let enemySelected = selectCharacterFrom(team: enemyTeam)
            characterSelected.action(target: enemySelected)
           
            print("""
                
                \(characterSelected.name) \(characterSelected.charactertype.getEmoji()) attacked \(enemySelected.name) \(enemySelected.charactertype.getEmoji()).
                \(enemySelected.name) \(enemySelected.charactertype.getEmoji()) has now \(enemySelected.life) life points ❤️.
                
                """)
            
            //check if enemy.life <= 0 -> dead
            if enemySelected.life <= 0 {
                print("\(enemySelected.name) \(enemySelected.charactertype.getEmoji()) is dead 💀")
            }
        }
       
        
    }
    
   
    //validate that the character selected is alive, if not we'll display an error message and the user we'll have to repeat the selection
    func selectCharacterFrom(team: Team) -> Character {
        
        var characterSelected: Character?
        
        // Used to print the selection of characters
        repeat {
            //print characters list
            for i in 0..<team.characters.count {
                let character = team.characters[i]
                // +1 useful to show to the player the number corresponding from the selection
                if character.life > 0 {
                    print ( " \(i + 1) \(character.name): \(character.charactertype.getEmoji()) | ❤️ : \(character.life) | \(character.charactertype.getWeaponEmoji()): \(character.weaponType.power())" )
                } else {
                    print(" \(i + 1) \(character.name): \(character.charactertype.getEmoji()) is dead")
                }
            }
            
            // verify if the number is an Int
            var inputSelection: Int?
            
            repeat {
                //select option
                inputSelection = numericValue(input: readLine())
            } while inputSelection == nil || inputSelection! < 1 || inputSelection! > 3
            
            // -1 useful to reput the number selected corresponding to the initial array number
            characterSelected = team.characters[inputSelection! - 1]
        } while isCharacterDead(characterSelected!)
        
        print("You have selected \(characterSelected!.name)")
        return characterSelected!
    }
    
    func isCharacterDead(_ character: Character) -> Bool {
        if character.life <= 0 {
            print("The character selected is dead, please choose another one")
            return true
        }
        return false
    }
    
    // use the verify if the number could be convertible to an Int
    func numericValue(input: String?) -> Int? {
        if let inputNonOptional = input,
            inputNonOptional.count > 0,
            let inputNumber = Int(inputNonOptional) {
            return inputNumber
        }
        return nil
    }
}
