class TodoAppManager {
    // MARK: Singleton Pattern

    static let instance = TodoAppManager()
    
    private init() {}

    // MARK: Actions

    func run() {
        WelcomeManager.addCommands()
        WelcomeManager.welcome()
        WelcomeManager.help()
        while let input = readLine() {
            let commandNum = Int(input) ?? 0
            guard commandNum != WelcomeManager.commands.count else {
                print("Good Bye!")
                break
            }
            if commandNum <= 0 || commandNum > WelcomeManager.commands.count {
                print("Invalid input. Try again later.")
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
            WelcomeManager.help()
        }
    }

    func addTodo(){
        print("Enter title:")
        guard let title = readLine() else { return }
        print("Enter content:")
        guard let content = readLine() else { return }
        print("Enter priority:")
        guard let priority = Assistant.readNumber(from: 0, to: 1000000) else { return }
        DataManager.shared.addTodo(title: title, content: content, priority: priority)
        print("Successfully created Todo with title \(title)")
    }

    func showTodos(todos: [Todo] = DataManager.shared.todos) {
        guard !todos.isEmpty else {
            print("No Todo found :(")
            return
        }
        var i = 1
        print("-----------------------------")
        for todo in todos {
            print("\(i)- id: \(todo.id)\n\ttitle: \(todo.title)\n\tcontent: \(todo.content)\n\tpriority: \(todo.priority)\n\tdate: \(todo.dateCreated.description(with: .current))")
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
            print("\(i)- title: \(category.title)\n\tnumber of todos: \(category.todos.count)")
            i += 1
        }
        print("-----------------------------")
    }

    func editTodo(){
        showTodos()
        print("Enter the Todo ID you want to edit:")
        guard let id = readLine() else { return }
        guard let todo = DataManager.shared.todo(id: id) else {
            print("No Todo with the given ID found")
            return
        }
        print("Enter new title (if you don't want to change, just press enter):")
        if let title = readLine(), title != "" {
            DataManager.shared.editTitle(todo: todo , to: title)
            print("Successfully edited title of Todo.")
        }
        print("Enter new content (if you don't want to change, just press enter):")
        if let content = readLine(), content != "" {
            DataManager.shared.editContent(todo: todo , to: content)
            print("Successfully edited content of Todo.")
        }
        print("Enter new priority (if you don't want to change, just press 0):")
        if let priority = Assistant.readNumber(from: 0, to: 1000000), priority != 0 {
            DataManager.shared.editPriority(todo: todo , to: priority)
            print("Successfully edited priority of Todo.")
        }
    }

    func deleteTodo(){
        showTodos()
        print("Enter the Todo ID that you want to delete:")
        guard let id = readLine() else { return }
        guard let todo = DataManager.shared.todo(id: id) else {
            print("No Todo with the given ID found")
            return
        }
        DataManager.shared.remove(todo: todo)
        print("Successfully deleted Todo.")
    }

    func sortTodos(){
        guard !DataManager.shared.todos.isEmpty else {
            print("No Todo found :(")
            return
        }
        print("Enter sorting order (1/2):\n1. Ascending\n2. Descending")
        guard let order = Assistant.readNumber(from: 1, to: 2), let sortingOrder = DataManager.SortingOrder(rawValue: order) else {
            print("Sorting order number is invalid")
            return
        }
        print("Enter sorting property (1/2/3):\n1. Date\n2. Title\n3. Priority")
        guard let property = Assistant.readNumber(from: 1, to: 3), let sortingProperty = DataManager.TodoSortingProperty(rawValue: property) else {
            print("Sorting property number is invalid")
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

    func addTodosToCategory() {
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
        print("Current category \(selectedCategory.title)'s Todos:")
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
        print("Enter Todo ID: ")
        guard let todoIDInput = readLine(), let selectedTodo = DataManager.shared.todo(id: todoIDInput) else {
            print("No Todo with this ID is found.")
            return
        }
        showCategories(categories: selectedTodo.categories)
    }
}
