import AValue
import AViewUI
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AFunctionOneExampleView: View {
    var name: String
    var instance: ([AValue]) throws -> AValue
    var args: AFunction.ExampleArgs

    var result: AValue? {
        try? instance(args.values)
    }

    public var body: some View {
        AWrappingStack {
            Text(name + "(")
            ForEach(args.valueElements) { value in
                Text(verbatim: value.value.description)
            }
        }
    }

    public init(name: String, _ values: [AValue], arguments: AFunction.Arguments, instance: @escaping ([AValue]) throws -> AValue) {
        self.name = name
        self.instance = instance
        self.args = AFunction.ExampleArgs(values, arguments: arguments)
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    List {
        AFunctionOneExampleView(name: AFunction.cosFunction.shortName, AFunction.cosFunction.examples[0].values, arguments: AFunction.cosFunction.arguments, instance: AFunction.cosFunction.instance)
    }
}
