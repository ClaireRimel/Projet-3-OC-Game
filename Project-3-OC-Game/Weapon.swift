//
//  Weapon.swift
//  Project-3-OC-Game
//
//  Created by Claire Sivadier on 10/02/2019.
//  Copyright © 2019 Claire Sivadier. All rights reserved.
//

import Foundation

class Weapon{
    var damages: Int
    
    init(damages: Int){
        self.damages = damages
    }
}

class Sword: Weapon{
    init(){
        super.init(damages: 10)
    }
}

class MagicPotion: Weapon {
    init(){
        super.init(damages: 25)
    }
}

class IronGlove: Weapon {
    init(){
        super.init(damages: 6)
    }
}

class Axe: Weapon {
    init(){
        super.init(damages: 30)
    }
}
