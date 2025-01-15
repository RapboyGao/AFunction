import AValue
import Foundation

public extension AFunction {
    struct ExampleArgs: Codable, Sendable, Hashable, Identifiable {
        public let id: UUID
        public let values: [AValue]
        public let valueElements: [AValueArrayElement]

        public init(_ values: [AValue]) {
            id = UUID()
            self.values = values
            valueElements = [AValueArrayElement](values)
        }

        public init(_ values: [AValue], arguments: AFunction.Arguments) {
            id = UUID()
            self.values = values
            var valuesElements = [AValueArrayElement](values)
            for index in valuesElements.indices {
                valuesElements[index].unit = arguments.getUnit(index: index)
            }
            self.valueElements = valuesElements
        }
    }
}
