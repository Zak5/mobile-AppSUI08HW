//
//  Settings.swift
//  AppSUI08HW
//
//  Created by Konstantin Zaharev on 09.03.2022.
//

import Foundation

struct Settings {
    var winScore: Int = 10
    
    init() {}
    
    init(winScore: Int) {
        self.winScore = winScore
    }
}
