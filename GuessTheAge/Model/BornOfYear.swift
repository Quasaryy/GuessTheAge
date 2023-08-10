//
//  BornOfYear.swift
//  GuessTheAge
//
//  Created by Yury on 10/08/2023.
//

import Foundation

struct BornOfYear {
    let bornAge: String
}

extension BornOfYear {
    static func getBornOfYear() -> [BornOfYear] {
        [
            (BornOfYear(bornAge: "1932")),
            (BornOfYear(bornAge: "1930")),
            (BornOfYear(bornAge: "1934")),
            (BornOfYear(bornAge: "1928"))
        ]
    }
}
