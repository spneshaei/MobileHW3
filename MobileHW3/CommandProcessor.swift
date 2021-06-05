class CommandProcessor {
    // MARK: Singleton Pattern

    static let instance = CommandProcessor()
    
    private init() {}

    // MARK: Fields
    
    
    // MARK: Actions

    func run() {
        print("hi")
    }
}
