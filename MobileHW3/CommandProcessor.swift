class CommandProcessor {
    // MARK: Singleton Pattern

    static let instance = CommandProcessor()
    
    private init() {}

    // MARK: Fields
    
    private var commands: [String] = []

    // MARK: Actions

    func run() {
        addCommands()
        help()
        while let input = readLine() {
            let commandNum = Int(input) ?? 0
            guard commandNum != commands.count else {
                print("Good bye.")
                break
            }
            if commandNum == 0 || commandNum > commands.count {
                print("invalid input. try again later.")
                continue
            }
            switch commandNum {
            case 1:
                addTodo()
            case 2:
                showAllTodos()
            case 3:
                editTodo()
            case 4:
                deleteTodo()
            case 5:
                sortTodos()
            case 6:
                addCategory()
            case 7:
                addTodosToCategory()
            case 8:
                showTodosOfCategory()
            default:
                continue
            }
        }
    }

    func addTodo(){
        print("Enter title:")
        let title = readLine()
        print("Enter content:")
        let content = readLine()
        print("Enter priority:")
        let priority = readNumber(from: 0, to: 1000000)
        if priority == nil{
            return
        }
        todo = DataManager.shared.addTodo(title: title, content: content , priority: priority)
        print("successfully created todo with id \(todo.id)")
    }

    func showAllTodos(){
        var i = 1
        print("-----------------------------")
        for todo in DataManager.shared.todos {
            print("\(i)- id: \(todo.id), title: \(todo.title), content: \(todo.content), priority: \(todo.priority)")
            i += 1
        }
        print("-----------------------------")
    }

    func editTodo(){
        showAllTodos()
        print("Enter item number that you want to edit:")
        let numb = readNumber(from: 0, to: DataManager.shared.todos.count)
        if numb == nil{
            return
        }
        todo = DataManager.shared.todos[numb]
        print("Enter new title (if you don't want to change just press enter):")
        let title = readLine()
        if title != "" {
            DataManager.shared.editTitle(todo:todo , to: title)
            print("successfully edited title of todo.")
        }
        print("Enter new content (if you don't want to change just press enter):")
        let content = readLine()
        if content != "" {
            DataManager.shared.editContent(todo:todo , to: content)
            print("successfully edited content of todo.")
        }
        print("Enter new priority (if you don't want to change just press 0):")
        let priority = readNumber(from: 0, to: 1000000)
        if priority == nil{
            return
        } 
        if priority != 0 {
            DataManager.shared.editPriority(todo:todo , to: priority)
            print("successfully edited priority of todo.")
        }
    }

    func deleteTodo(){
        showAllTodos()
        print("Enter item number that you want to delete:")
        let numb = readNumber(from: 0, to: DataManager.shared.todos.count)
        if numb == nil{
            return
        }
        todo = DataManager.shared.todos[numb]
        DataManager.shared.remove(todo: todo)
        print("successfully deleted todo.")
    }

    func sortTodos(){
        print("Enter sorting order(1/2):\n1. Ascending \n2.Descending")
        let order = readNumber(from: 1, to: 2)
        print("Enter sorting property(1/2/3): \n1.Date \n2.Title \n3.Priority")
        let property = readNumber(from: 1, to: 2)
        for todo in DataManager.sortedTodos(DataManager.sortingProperty(rawValue: property), DataManager.SortingOrder(rawValue: order)) {
            print("Id: \(todo.id) \n\tTitle: \(todo.title) \n\tDate: \(todo.dateCreated) \n\tContent: \(todo.content)")
        }
    }

    func addCategory(){
        print("Enter category name: ")
        let name = readLine()
        guard let createdCategory = new Category(name)
        else {
            print("Category with this title exists.")
            retrun;
        }
        DataManager.add(category: createdCategory)
        print("Category with title \(name) added successfully.")
    }

    func addTodosToCategory(){
        print("Enter Todo Id: \n")
        guard let selectedTodo = DataManager.todo(id: readLine())
        else {
            print("No Todo with this Id is found.")
            return
        }
        print("Enter Category title: ")
        guard let selectedCategory = DataManager.category(title: readLine())
        else {
            print("No Category with this title is found.")
            return
        }
        DataManager.add(todo: selectedTodo, to: selectedCategory)
        print("Successfully added to selected category")
    }

    func showTodosOfCategory(){
        print("Enter Category title: ")
        guard let selectedCategory = DataManager.category(title: readLine())
        else {
            print("No Category with this title is found.")
            return
        }
        for todo in selectedCategory.todos {
            print("Id: \(todo.id) \n\tTitle: \(todo.title) \n\tDate: \(todo.dateCreated) \n\tContent: \(todo.content)")
        }
    }

    func addCommands() {
        commands.append("Add a todo")
        commands.append("Show all todos")
        commands.append("Edit a todo")
        commands.append("Delete a todo")
        commands.append("Sort todos")
        commands.append("Add a category")
        commands.append("Add todos to categories")
        commands.append("Show todos of a category")
        commands.append("Exit")
    }

    func help() {
        print("welcome to todo list manager!")
        print("-----------------------------")
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
            retrun nil
        }
        return numb
    }
}
