//
//  Todo.swift
//  MobileHW3
//
//  Created by Seyyed Parsa Neshaei on 5/31/21.
//

import Foundation

class Todo {
    // MARK: Fields
    
    var id: String
    var title: String
    var content: String
    var priority: Int
    var dateCreated: Date
    
    init(title: String, content: String, priority: Int) {
        self.id = UUID().uuidString
        self.dateCreated = Date()
        self.title = title
        self.content = content
        self.priority = priority
    }
}
