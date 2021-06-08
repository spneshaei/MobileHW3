class CommandProcessor {
    // MARK: Singleton Pattern

    static let instance = CommandProcessor()
    
    private init() {}

    // MARK: Fields
    
    private var commands: [String] = []

    // MARK: Actions

    func run() {
        addCommands()
        welcome()
        help()
        while let input = readLine() {
            let commandNum = Int(input) ?? 0
            guard commandNum != commands.count else {
                print("Good bye.")
                break
            }
            if commandNum <= 0 || commandNum > commands.count {
                print("invalid input. try again later.")
                continue
            }
            switch commandNum {
            case 1:
                addTodo()
            case 2:
                showTodos()
            case 3:
                editTodo()
            case 4:
                deleteTodo()
            case 5:
                sortTodos()
            case 6:
                addCategory()
            case 7:
                showCategories()
            case 8:
                addTodosToCategory()
            case 9:
                showTodosOfCategory()
            case 10:
                showCategoriesOfTodo()
            default:
                continue
            }
            help()
        }
    }

    func addTodo(){
        print("Enter title:")
        guard let title = readLine() else { return }
        print("Enter content:")
        guard let content = readLine() else { return }
        print("Enter priority:")
        guard let priority = readNumber(from: 0, to: 1000000) else { return }
        DataManager.shared.addTodo(title: title, content: content, priority: priority)
        print("Successfully created todo with title \(title)")
    }

    func showTodos(todos: [Todo] = DataManager.shared.todos) {
        guard !todos.isEmpty else {
            print("No Todo found :(")
            return
        }
        var i = 1
        print("-----------------------------")
        for todo in todos {
            print("\(i)- id: \(todo.id), title: \(todo.title), content: \(todo.content), priority: \(todo.priority), date: \(todo.dateCreated.description(with: .current))")
            i += 1
        }
        print("-----------------------------")
    }
    
    func showCategories(categories: [Category] = DataManager.shared.categories) {
        guard !categories.isEmpty else {
            print("No category found :(")
            return
        }
        var i = 1
        print("-----------------------------")
        for category in categories {
            print("\(i)- title: \(category.title), number of todos: \(category.todos.count)")
            i += 1
        }
        print("-----------------------------")
    }

    func editTodo(){
        showTodos()
        print("Enter todo ID that you want to edit:")
        guard let id = readLine() else { return }
        guard let todo = DataManager.shared.todo(id: id) else {
            print("No todo with the given ID found")
            return
        }
        print("Enter new title (if you don't want to change just press enter):")
        if let title = readLine(), title != "" {
            DataManager.shared.editTitle(todo: todo , to: title)
            print("Successfully edited title of todo.")
        }
        print("Enter new content (if you don't want to change just press enter):")
        if let content = readLine(), content != "" {
            DataManager.shared.editContent(todo: todo , to: content)
            print("Successfully edited content of todo.")
        }
        print("Enter new priority (if you don't want to change just press 0):")
        if let priority = readNumber(from: 0, to: 1000000), priority != 0 {
            DataManager.shared.editPriority(todo: todo , to: priority)
            print("Successfully edited priority of todo.")
        }
    }

    func deleteTodo(){
        showTodos()
        print("Enter todo ID that you want to delete:")
        guard let id = readLine() else { return }
        guard let todo = DataManager.shared.todo(id: id) else {
            print("No todo with the given ID found")
            return
        }
        DataManager.shared.remove(todo: todo)
        print("Successfully deleted todo.")
    }

    func sortTodos(){
        print("Enter sorting order (1/2):\n1. Ascending\n2. Descending")
        guard let order = readNumber(from: 1, to: 2) else { return }
        print("Enter sorting property (1/2/3):\n1. Date\n2. Title\n3. Priority")
        guard let property = readNumber(from: 1, to: 3) else { return }
        guard let sortingOrder = DataManager.SortingOrder(rawValue: order) else {
            print("Sorting order number is invalid")
            return
        }
        guard let sortingProperty = DataManager.TodoSortingProperty(rawValue: property) else {
            print("Sorting property number is invalid")
            return
        }
        guard !DataManager.shared.todos.isEmpty else {
            print("No Todo found :(")
            return
        }
        showTodos(todos: DataManager.shared.sortedTodos(by: sortingProperty, order: sortingOrder))
    }

    func addCategory() {
        print("Enter category title: ")
        guard let title = readLine(), let createdCategory = Category(title: title) else {
            print("Category with this title exists.")
            return
        }
        DataManager.shared.add(category: createdCategory)
        print("Category with title \(title) added successfully.")
    }

    func addTodosToCategory(){
        showTodos()
        print("Enter Todo ID: \n")
        guard let todoIDInput = readLine(), let selectedTodo = DataManager.shared.todo(id: todoIDInput) else {
            print("No Todo with this ID is found.")
            return
        }
        showCategories()
        print("Enter Category title: ")
        guard let categoryTitleInput = readLine(), let selectedCategory = DataManager.shared.category(title: categoryTitleInput) else {
            print("No Category with this title is found.")
            return
        }
        DataManager.shared.add(todo: selectedTodo, to: selectedCategory)
        print("Successfully added to selected category")
        print("Current category \(selectedCategory.title)'s todos:")
        print(showTodos(todos: selectedCategory.todos))
    }

    func showTodosOfCategory(){
        showCategories()
        print("Enter Category title: ")
        guard let categoryTitleInput = readLine(), let selectedCategory = DataManager.shared.category(title: categoryTitleInput) else {
            print("No Category with this title is found.")
            return
        }
        showTodos(todos: selectedCategory.todos)
    }
    
    func showCategoriesOfTodo(){
        showTodos()
        print("Enter todo ID: ")
        guard let todoIDInput = readLine(), let selectedTodo = DataManager.shared.todo(id: todoIDInput) else {
            print("No todo with this ID is found.")
            return
        }
        showCategories(categories: selectedTodo.categories)
    }

    func addCommands() {
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
    
    func welcome() {
        print("Welcome to the Todo list manager!")
        print("-----------------------------")
    }

    func help() {
        print("\nAvailable commands:\n")
        var i = 1
        for command in commands{
            print("\(i)- \(command)")
            i += 1
        }
        print("-----------------------------")
    }

    func readNumber(from: Int , to: Int) -> Int?{
        let input = readLine()
        let numb = Int(input!) ?? (from - 1)
        if numb > to || numb < from{
            print("invalid number. try again later")
            return nil
        }
        return numb
    }
}
