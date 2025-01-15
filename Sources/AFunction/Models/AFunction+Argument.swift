import AUnit
import Foundation

public extension AFunction {
    struct Argument: Codable, Sendable, Hashable, Identifiable {
        public var id = UUID()
        public var name: String
        public var introduction: String
        // 可以接受的数据类型
        public var type: ArgumentType
        public var constraint: ANumberConstraint
        public var unit: AUnit?
        public var genericName: String?

        public init(name: String, detail: String, type: ArgumentType, constraint: ANumberConstraint = .realNumber(.infiniteRange), unit: AUnit? = nil, genericName: String? = nil) {
            self.name = name
            self.introduction = detail
            self.type = type
            self.constraint = constraint
            self.unit = unit
            self.genericName = genericName
        }
    }
}
