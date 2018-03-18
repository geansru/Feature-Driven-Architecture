//
//  BlogApp.swift
//  BlogApp
//
//  Created by Bohdan Orlov on 18/03/2018.
//  Copyright © 2018 Bohdan Orlov. All rights reserved.
//

import Foundation
import Platform
import Domain
import UI

public struct BlogApp { // Application acts as assembly point for Domain and UI, its a place for adaptors.
    public init() {
        _ = Platform()
        _ = Domain()
        _ = UI()
    }
}
