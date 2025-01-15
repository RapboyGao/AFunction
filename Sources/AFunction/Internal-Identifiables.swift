import Foundation

struct TheIdentifiable<OriginalValue: Hashable & Sendable & Codable>: Identifiable {
    let id: UUID
    var value: OriginalValue
    init(_ value: OriginalValue) {
        self.value = value
        self.id = UUID()
    }
}
