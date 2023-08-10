//
//  Images.swift
//  GuessTheAge
//
//  Created by Yury on 10/08/2023.
//

import Foundation

struct Personality {
    let image: String
    let name: String
}

extension Personality {
    static func getPersonality() -> [Personality] {
        [
            (Personality(image: "Donald", name: "Donald Duck")),
            (Personality(image: "Mickey", name: "Mickey Mouse")),
            (Personality(image: "Goofy", name: "Goofy D.")),
            (Personality(image: "Pluto", name: "Pluto G."))
        ]
    }
}
