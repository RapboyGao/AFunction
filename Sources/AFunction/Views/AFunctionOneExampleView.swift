import AValue
import AViewUI
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AFunctionOneExampleView: View {
    var name: String
    var values: [AValue]
    var instance: ([AValue]) throws -> AValue
    let values2: [TheIdentifiable<AValue>]

    var result: AValue? {
        try? instance(values)
    }

    public var body: some View {
        AWrappingStack {
            Text(name + "(")
            ForEach(values2) { value in
                Text(verbatim: value.value.description)
            }
        }
    }
    
    public init(name: String, values: [AValue], instance: @escaping ([AValue]) throws -> AValue) {
        self.name = name
        self.values = values
        self.instance = instance
        self.values2 = values.map { TheIdentifiable($0) }
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    List {
        AFunctionOneExampleView(name: "sin", values: [30], instance: AFunction.sinFunction.instance)
    }
}
