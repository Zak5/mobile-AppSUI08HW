//
//  Match.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 07.03.2022.
//

import Foundation

enum Team: CaseIterable {
    case one, two
    var name: String {
        get {
            switch self {
            case .one:
                return "Team one"
            case .two:
                return "Team two"
            }
        }
    }
}
