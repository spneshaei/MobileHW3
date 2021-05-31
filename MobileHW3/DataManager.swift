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
    private var allCategories: [Category] = []
    
    var todos: [Todo] {
        allTodos
    }
    
    var categories: [Category] {
        allCategories
    }
    
    // MARK: Query methods
    
    func category(title: String) -> Category? {
        allCategories.first { $0.title == title }
    }
    
    // MARK: Actions
    
    func add(category: Category) {
        allCategories.append(category)
    }
    
    func add(todo: Todo) {
        allTodos.append(todo)
    }
    
    func add(todo: Todo, to category: Category) {
        todo.add(to: category)
    }
    
    func editTitle(todo: Todo, to title: String) {
        todo.title = title
    }
    
    func editContent(todo: Todo, to content: String) {
        todo.content = content
    }
    
    func editPriority(todo: Todo, to priority: Int) {
        todo.priority = priority
    }
    
    func remove(todo: Todo) {
        allTodos.removeAll { $0.id == todo.id }
    }
    
    // MARK: Sorting todos
    
    enum TodoSortingProperty {
        case date, title, priority
    }
    
    enum SortingOrder {
        case ascending, descending
    }
    
    func sortedTodos(by sortingProperty: TodoSortingProperty, order: SortingOrder) -> [Todo] {
        allTodos.sorted { first, second in
            switch sortingProperty {
            case .date: return order == .ascending ? first.dateCreated < second.dateCreated : first.dateCreated < second.dateCreated
            case .title: return order == .ascending ? first.title < second.title : first.title < second.title
            case .priority: return order == .ascending ? first.priority < second.priority : first.priority < second.priority
            }
        }
    }
}
