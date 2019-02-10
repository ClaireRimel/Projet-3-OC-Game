//
//  main.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

print("Hi, welcome to Battle Game OC"
    + "\nThis game is simple, 2 teams and each team have to choose 3 characters"
    + "\nYou will have the choose between:"
    + "\n🤺 Warior, 100 life point, 10 inflicted by his Sword"
    + "\n🧞‍♂️ Magus, 75 life point, 8 points recoverded by his Magic Potion"
    + "\n🏋🏻‍♂️ Colossus, 150 life point, 6 inflicted by is Iron GLove"
    + "\n🧝🏻‍♂️ Midget, 50 life point, 30 inflicted by his Axe"
    + "\nwhen your team are constitued, let´s the game begin !!!"
    + "\n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
    + "\nOups, I fogot to tell you something... nothing is played in advance..."
    + "\n...Be aware...")

enterTeamName()

for team in teams {
    addTeamMember(team: team)
}


