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
            + "\n   🧞‍♂️ Magus, 80 life point, 8 points recoverded by his Magic Potion"
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
        
        
    }
    
    
    // Utils :
    
    func input() -> Int {
        let strData = readLine();

        return Int(strData!)!
    }
    
    //Function which verify of the name is avaible
    func isCharacterNameIsUnique(characterName: String) -> Bool {
        for team in teams {
            // nested loop
            for character in team.characters {
                if characterName == character.name{
                    print("This character name is not avaible")
                    return false
                }
            }
        }
        return true
    }

    func isTeamNameIsUnique(name: String) -> Bool {
        for team in teams {
            if name == team.name {
                print("This team name is not avaible")
                return false
            }
        }
        return true
    }
    
    func addNameToYourTeam() -> String {
        var name: String?
        
        repeat {
            print("Please enter a name") //
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
                print("Player \(i), please enter your team´s name")
                
                name = addNameToYourTeam()
              
            } while isTeamNameIsUnique(name: name) == false
            
            let team = Team(name: name, game: self)
            // add the name in an array.
            teams.append(team)
            team.addTeamMembers()
        }
    }
    
//    func presentationBeforeFightTeam1() {
//
//        print("Team: \(teams[1].name)"
//            + "\nThe Enemy team is composed of: "
//            // Add the characteristics
//            + "\n \(teams[2].characters[0])"
//            + "\n \(teams[2].characters[1])"
//            + "\n \(teams[2].characters[2])"
//            + "\n Your team is composed of "
//            + "\n1 \(teams[1].characters[0])"
//            + "\n2 \(teams[1].characters[1])"
//            + "\n3 \(teams[1].characters[2])"
//            + "\n please choose your character(1-3)" )
//
//        //action()
//    }
//
//    func presentationBeforeFightTeam2(team: Team) {
//
//        print("Team: \(teams[2].name)"
//            + "\nThe Enemy team is composed of: "
//            // Add the characteristics
//            + "\n1 \(teams[1].characters[0])"
//            + "\n2 \(teams[1].characters[1])"
//            + "\n3 \(teams[1].characters[2])"
//            + "\n Your team is composed of: "
//            + "\n1 \(teams[2].characters[0])"
//            + "\n2 \(teams[2].characters[1])"
//            + "\n3 \(teams[2].characters[2])"
//            + "\n please choose your character(1-3)")
//
//        //action()
//    }





//func action (team: Team) {
//
//    let choose = input()
//    var lifePointAfterAction : Int
//
//    if choose > 0 && choose < 4 {
//
//    switch choose {
//
//    case Character.Magus:
//        // select character of your team to give life point to him
//        lifePointAfterAction = .live + .damages
//    case .:
//        // select a character of the enemy team took life point
//        lifePointAfterAction = .live + damages
//    default:
//        <#code#>
//    }
//}


}
