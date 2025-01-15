import AUnit

public extension AFunction {
    enum Arguments: Codable, Sendable, Hashable, CustomStringConvertible {
        case finite([Argument])
        case withOptional([Argument], optionals: [Argument])
        case withInfinite([Argument], infinite: Argument)

        public var description: String {
            switch self {
            case .finite(let array):
                return array.map(\.name).joined(separator: ",")
            case .withOptional(let array, let optionals):
                let totalArray = array.map(\.name) + optionals.map { $0.name + "?" }
                return totalArray.joined(separator: ",")
            case .withInfinite(let array, let infinite):
                let totalArray = array.map(\.name) + [infinite.name + ".."]
                return totalArray.joined(separator: ",")
            }
        }
    }
}

public extension AFunction.Arguments {
    func get(index: Int) -> AFunction.Argument? {
        guard index >= 0 else { return nil }
        switch self {
        case .finite(let array):
            guard index < array.count else { return nil }
            return array[index]
        case .withOptional(let array, let optionals):
            let allArgs = array + optionals
            guard index < allArgs.count else { return nil }
            return allArgs[index]
        case .withInfinite(let array, let infiniteArg):
            guard index < array.count else { return infiniteArg }
            return array[index]
        }
    }

    func getUnit(index: Int) -> AUnit? {
        get(index: index)?.unit
    }
}
