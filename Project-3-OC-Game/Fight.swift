//
//  Fight.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation


class fightManager : Team {
    
    func input() -> Int {
        let strData = readLine();

        return Int(strData!)!
    }

    //Create 2 teams
    func enterTeamName(team: Team) {
        
        for i in 1...2 {
            
            var name: String?
            
            //ask user a team's name
            repeat {
                print("Player \(i), please enter your team´s name")
                
                name = readLine()
                
                // add optinal binding, to extract the value form an optional if it exist
                if let value = name, value.count > 0 {
                    let name = Team(name: value)
                    // add the name in an array.
                    teams.append(name)
                }
            } while (name == nil || name?.count == 0)
        }
    }
    
func presentationBeforeFightTeam1() {
    
    print("Team: \(teams[1].name)"
        + "\nThe Enemy team is composed of: "
        // Add the characteristics
        + "\n \(teams[2].characters[0])"
        + "\n \(teams[2].characters[1])"
        + "\n \(teams[2].characters[2])"
        + "\n Your team is composed of "
        + "\n1 \(teams[1].characters[0])"
        + "\n2 \(teams[1].characters[1])"
        + "\n3 \(teams[1].characters[2])"
        + "\n please choose your character(1-3)" )

    //action()
    }

func presentationBeforeFightTeam2(team: Team) {
    
    print("Team: \(teams[2].name)"
        + "\nThe Enemy team is composed of: "
        // Add the characteristics
        + "\n1 \(teams[1].characters[0])"
        + "\n2 \(teams[1].characters[1])"
        + "\n3 \(teams[1].characters[2])"
        + "\n Your team is composed of: "
        + "\n1 \(teams[2].characters[0])"
        + "\n2 \(teams[2].characters[1])"
        + "\n3 \(teams[2].characters[2])"
        + "\n please choose your character(1-3)")
    
     //action()
    }





func action (team: Team) {

    let choose = input()
    var lifePointAfterAction : Int

    if choose > 0 && choose < 4 {

    switch choose {

    case Character.Magus:
        // select character of your team to give life point to him
        lifePointAfterAction = .live + .damages
    case .:
        // select a character of the enemy team took life point
        lifePointAfterAction = .live + damages
    default:
        <#code#>
    }
}


}
}
