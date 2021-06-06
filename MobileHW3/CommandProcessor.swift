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
            if commandNum == 0{
                print("invalid input. try again later.")
                continue
            }
            
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
}
