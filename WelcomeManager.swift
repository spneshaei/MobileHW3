//
//  WelcomeManager.swift
//  MobileHW3
//
//  Created by Seyyed Parsa Neshaei on 6/8/21.
//

import Foundation

class WelcomeManager {
    
    // MARK: Fields
    
    static var commands: [String] = []
    
    // MARK: Methods
    
    static func addCommands() {
        commands.append("Add a todo")
        commands.append("Show all todos")
        commands.append("Edit a todo")
        commands.append("Delete a todo")
        commands.append("Sort todos")
        commands.append("Add a category")
        commands.append("Show all categories")
        commands.append("Add todos to categories")
        commands.append("Show todos of a category")
        commands.append("Show categories of a todo")
        commands.append("Exit")
    }
    
    static func welcome() {
        print("Welcome to the Todo list manager!")
        print("-----------------------------")
    }

    static func help() {
        print("\nAvailable commands:\n")
        var i = 1
        for command in commands {
            print("\(i)- \(command)")
            i += 1
        }
        print("-----------------------------")
    }
}
