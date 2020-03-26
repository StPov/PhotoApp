//
//  Core.swift
//  PhotoApp
//
//  Created by Stanislav Povolotskiy on 26.03.2020.
//  Copyright © 2020 Stanislav Povolotskiy. All rights reserved.
//

import Foundation

class Core {
    static let share = Core()
    
    func isNewUser() -> Bool{
        return !UserDefaults.standard.bool(forKey: "isNewUser")
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}
