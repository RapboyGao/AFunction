import AUnit
import AValue
import Foundation

public extension AFunction {
    struct Argument: Codable, Sendable, Hashable, Identifiable {
        public var id = UUID()
        public var name: String
        public var introduction: String
        // 可以接受的数据类型
        public var type: ArgumentType
        public var unit: AUnit?
        public var genericName: String?

        public init(name: String, detail: String, type: ArgumentType, unit: AUnit? = nil, genericName: String? = nil) {
            self.name = name
            introduction = detail
            self.type = type
            self.unit = unit
            self.genericName = genericName
        }
    }
}

public extension AFunction.Argument {
    static func number(name: String, detail: String, unit: AUnit? = nil) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.number), unit: unit)
    }

    static func point(name: String, detail: String, unit: AUnit? = nil) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.point), unit: unit)
    }

    static func location(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.location))
    }

    static func string(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.string), unit: nil)
    }

    static func boolean(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.boolean), unit: nil)
    }

    static func groundWind(name: String, detail: String, unit: AUnit? = nil) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.groundWind), unit: unit)
    }

    static func minutes(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.minutes), unit: nil)
    }

    static func calendar(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.calendar), unit: nil)
    }

    static func dateDifference(name: String, detail: String) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .one(.dateDifference), unit: nil)
    }

    static func generic(name: String, detail: String, genericName: String, unit: AUnit?, allowedTypes: [AValueType]) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .collection(allowedTypes), unit: unit, genericName: genericName)
    }

    static func generic(name: String, detail: String, genericName: String, unit: AUnit?) -> AFunction.Argument {
        Self(name: name, detail: detail, type: .anything, unit: unit, genericName: genericName)
    }
}
