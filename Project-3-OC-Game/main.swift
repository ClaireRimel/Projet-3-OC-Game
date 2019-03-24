//
//  main.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

let game = Game()
//game.start()
//game.startBattle()


//Test data
let teamA = Team(name: "Marvel", game: game)
let character1 = Character(name: "Thor", charactertype: .warrior)
let character2 = Character(name: "Dr Strange", charactertype: .wizard)
let character3 = Character(name: "Hulk", charactertype: .colossus)
//let character = Character(name: "Groot", charactertype: .midget)

teamA.characters = [character1, character2, character3]

let teamB = Team(name: "DC Comics", game: game)
let character4 = Character(name: "Batman", charactertype: .warrior)
let character5 = Character(name: "Dr Fate", charactertype: .wizard)
let character6 = Character(name: "Aquaman", charactertype: .colossus)
//let character = Character(name: "Robin", charactertype: .midget)

teamB.characters = [character4, character5, character6]

game.teams = [teamA, teamB]
game.startBattle()
