//
//  Fight.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

enum EndReason {
    case team1Win, team2Win, draw
}

class Game {
    //Create array of Team
    var teams: [Team] = []
    
    //Create Object with ()
    let bonus = Bonus()
    
    func start() {
        print("""

                            Welcome to Battle Game OC
            
               This war game is simple, 2 teams with 3 characters per team
               You will have the choice between:
            
               🤺 Warior, 100 life point ❤️, 10 inflicted by his Sword ⚔️
               🧙🏻‍♂️ Wizard, 80 life point ❤️, 8 points recoverded by his Magic Potion 🍵
               🏋🏻‍♂️ Colossus, 150 life point ❤️, 6 inflicted by is Iron GLove 🥊
               🧝🏻‍♂️ Midget, 50 life point ❤️, 30 inflicted by his Axe ⛏
            
               When your team is ready, let´s the game begin !!!
            
            
               OH, I forgot to tell you something... nothing is played in advance...
            
                                  ...Be aware...
            """)
        
        self.createTeams()
    }
    
    
    // Utils :
    
    //Function which verify of the name is avaible
    func isCharacterNameIsUnique(characterName: String) -> Bool {
        for team in teams {
            // nested loop
            for character in team.characters {
                if characterName == character.name{
                    print("""

                        ⚠️ This character name is not avaible
                        
                        """)
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
                print("""

                    ⚠️ This team name is not avaible

                    """)
                return false
            }
        }
        return true
    }
    
    func addNameToYourTeam() -> String {
        var name: String?
        
        repeat {
            
            name = readLine()
            // add optinal binding, to extract the value form an optional if it exist
            if let value = name, value.count > 0 {
                name = value
                
            }
            
        } while (name == nil || name?.count == 0)
        
        return name!
    }
    
    //Create 2 teams in an array
    func createTeams() {
        
        for i in 1...2 {
            
            var name: String
            //ask user a team's name
            repeat {
                print("""
                    
                    Player \(i), please enter your team´s name
                    
                    """)
                
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
        var turns = 0

        repeat {
            // verify which types of characters alive are still playing
            guard !onlyWizardsInGame() else {
                battleFinished(reason: .draw)
                return
            }
            
            if isFirstTeamTurn {
                battleTurn(team: teams[0], enemyTeam: teams[1])
                hasTeam2Lost = teams[1].hasLost()
                
            } else {
                battleTurn(team: teams[1], enemyTeam: teams[0])
                hasTeam1Lost = teams[0].hasLost()
            }
            // .toggle, change and assign the value for the opposite boolean value
            isFirstTeamTurn.toggle()
            turns += 1
         // !hasTeam1Lost change BUT NOT assign the value for the opposite boolean value
        } while !hasTeam1Lost && !hasTeam2Lost
        
//      Print the winning team´s name
        if hasTeam1Lost {
            battleFinished(reason: .team2Win)
        } else if hasTeam2Lost {
            battleFinished(reason: .team1Win)
        }
        
        print("\nTurns played: \(turns)")
    }

    
    // Print the character team to be selected
    func battleTurn(team: Team, enemyTeam: Team) {
        //MENU selection of character
        print("""
            
            Team \(team.name)
            Select a character to play:
            
            """)
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
           
            if enemySelected.life > 0 {
                print("""
                    
                    \(characterSelected.name) \(characterSelected.charactertype.getEmoji()) attacked \(enemySelected.name) \(enemySelected.charactertype.getEmoji())
                    \(enemySelected.name) \(enemySelected.charactertype.getEmoji()) has now \(enemySelected.life) life points ❤️
                    
                    """)
                // use to verify if enemySelected.life <= 4 using the selfDestructionBonus()
                if enemySelected.life <= 4 {
                    bonus.selfDestructionBonus(victim: enemySelected, attackerTeam: team)
                    
                }
               
                
                //check if enemy.life <= 0 -> dead
            } else if enemySelected.life <= 0 {
                print("""
                    
                    \(characterSelected.name) \(characterSelected.charactertype.getEmoji()) attacked \(enemySelected.name) \(enemySelected.charactertype.getEmoji())
                    \(enemySelected.name) \(enemySelected.charactertype.getEmoji()) is now dead 💀
                    
                    """)
            }
        }
    }
    
    // Ingrement the way to finish the party
    func battleFinished(reason: EndReason) {
        switch reason {
        case .team1Win:
            print("\nCongratulation \(teams[0].name), you win! 🏆")
        case .team2Win:
            print("\nCongratulation \(teams[1].name), you win! 🏆")
        case .draw:
            print("\n🧙🏻‍♂️🧙🏻‍♂️🧙🏻‍♂️Sorry this party is over, because there are only wizards in game🧙🏻‍♂️🧙🏻‍♂️🧙🏻‍♂️")

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
                    print ( "\(i + 1). \(character.name): \(character.charactertype.getEmoji()) | ❤️ : \(character.life) | \(character.charactertype.getWeaponEmoji()): \(character.weaponType.power())" )
                } else if character.life <= 0 {
                    print("\(i + 1). \(character.name): \(character.charactertype.getEmoji()) is dead 💀")
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
        
        print("""
            
            You have selected \(characterSelected!.name)
            
            """)
        return characterSelected!
    }
    
    // Verify if the character selected is dead
    func isCharacterDead(_ character: Character) -> Bool {
        if character.life <= 0 {
            print("""

            ⚠️ The character selected is dead 💀, please choose another one

            """)
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
    
    //Verify if all characters playing are wizard
    func onlyWizardsInGame() -> Bool {
        var wizardsCount = 0
        
        for team in teams {
            for character in team.characters {
                if character.charactertype == .wizard {
                    wizardsCount += 1
                }
            }
        }
        // To put all characters alive in a same array, before comparing them to the number of wizard
        var allCharacters: [Character] = []
        allCharacters.append(contentsOf: teams[0].characters)
        allCharacters.append(contentsOf: teams[1].characters)
        let charactersAlive = allCharacters.filter({ $0.life > 0 })

        return wizardsCount == charactersAlive.count
    }
}



