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
        var isBattleFinished = false
        
        repeat {
            if isFirstTeamTurn {
                battleTurn(team: teams[0], enemyTeam: teams[1])
                isBattleFinished = teams[1].hasLost()
            } else {
                battleTurn(team: teams[1], enemyTeam: teams[0])
                isBattleFinished = teams[0].hasLost()
            }
            // .toggle, change the value for the opposite one
            isFirstTeamTurn.toggle()
            
        } while isBattleFinished == false
        
        //TODO: handle Battle finished...
    }

    
    // Print the character team to be selected
   
    func battleTurn(team: Team, enemyTeam: Team) {
        
        //MENU selection of character
        print("Team \(team.name)"
            + "\n"
            + "\n Select a character to play:")
        let characterSelected = selectCharacterFrom(team: team)
        // print the character that could be cured
        if characterSelected.charactertype == .wizard {
            print("wizard selected...")
            // TODO: Add Logic
            
            // print character that could be attacked
        } else {
            print("Select an enemy to attack:")
            let enemySelected = selectCharacterFrom(team: enemyTeam)
            characterSelected.action(target: enemySelected)
            
            //check if enemy.life <= 0 -> dead
        }
    }
    
    // Used to print the selection of characters
    func selectCharacterFrom(team: Team) -> Character {
        for i in 0..<team.characters.count {
            let character = team.characters[i]
            // +1 useful to show to the player the number corresponding from the selection
            print ( " \(i + 1) \(character.name) the \(character.charactertype), he have \(character.life) life points, he is armed with \(character.weaponType) which have a power of \(character.weaponType.power())" )
        }
        // verify if the number is an Int
        var inputSelection: Int?
        
        repeat {
            //select option
            inputSelection = numericValue(input: readLine())
        } while inputSelection == nil || inputSelection! < 1 || inputSelection! > 3
        // -1 useful to reput the number selected corresponding to the initial array number
        let characterSelected = team.characters[inputSelection! - 1]
        print("You have selected \(characterSelected.name)")
        return characterSelected
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
