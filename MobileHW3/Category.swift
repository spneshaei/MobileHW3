//
//  Category.swift
//  MobileHW3
//
//  Created by Seyyed Parsa Neshaei on 5/31/21.
//

import Foundation

class Category: Equatable {

    // MARK: Fields
    
    var id: String
    var title: String
    var todos: [Todo] {
        DataManager.shared.todos.filter { $0.categories.contains(self) }
    }
    
    // MARK: Initializer
    
    init?(title: String) {
        guard !DataManager.shared.categories.contains(where: { $0.title == title }) else { return nil }
        self.id = UUID().uuidString
        self.title = title
    }
    
    // MARK: Equality Operator
    // Used for finding the current category's todos
    
    static func == (lhs: Category, rhs: Category) -> Bool {
        lhs.title == rhs.title
    }
}
