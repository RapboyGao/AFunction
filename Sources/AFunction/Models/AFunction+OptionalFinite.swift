import Foundation

public extension AFunction {
    enum OptionalFinite: Hashable, Sendable, Codable, Identifiable {
        case optional
        case finite
        case infinite

        public var id: Self {
            self
        }
    }
}
