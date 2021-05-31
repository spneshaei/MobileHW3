//
//  DataManager.swift
//  MobileHW3
//
//  Created by Seyyed Parsa Neshaei on 5/31/21.
//

import Foundation

class DataManager {
    // MARK: Singleton Pattern
    static let shared = DataManager()
    
    private init() {}
    
    // MARK: Fields
    
    private var allTodos: [Todo] = []
    
    var todos: [Todo] {
        allTodos
    }
}
