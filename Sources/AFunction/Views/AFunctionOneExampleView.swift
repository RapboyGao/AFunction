import AUnit
import AValue
import AViewUI
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AFunctionOneExampleView: View {
    var name: String
    var instance: ([AValue]) throws -> AValue
    var args: AFunction.ExampleArgs
    var precision: NumberFormatStyleConfiguration.Precision
    var returningUnit: AUnit?

    var result: AValue? {
        try? instance(args.values)
    }

    public var body: some View {
        AWrappingStack {
            Text(name + "(")
            ForEach(args.valueElements) { value in
                AValueElementArrayView(value: value, precision: precision)
            }
            Text(") = ")
            if let result = result {
                AValueAsArgumentView(value: result, precision: precision, unit: returningUnit, name: name)
            } else {
                Text("?")
            }
        }
    }

    public init(name: String, _ values: [AValue], arguments: AFunction.Arguments, precision: NumberFormatStyleConfiguration.Precision, unitOfReturn: AUnit?, instance: @escaping ([AValue]) throws -> AValue) {
        self.name = name
        self.instance = instance
        self.args = AFunction.ExampleArgs(values, arguments: arguments)
        self.precision = precision
        self.returningUnit = unitOfReturn
    }

    public init(name: String, _ example: AFunction.ExampleArgs, precision: NumberFormatStyleConfiguration.Precision, unitOfReturn: AUnit?, instance: @escaping ([AValue]) throws -> AValue) {
        self.name = name
        self.instance = instance
        self.args = example
        self.precision = precision
        self.returningUnit = unitOfReturn
    }

    public init(func function: AFunction, precision: NumberFormatStyleConfiguration.Precision, exampleIndex: Int) {
        self.name = function.shortName
        self.instance = function.instance
        self.args = function.examples[exampleIndex]
        self.precision = precision
        self.returningUnit = function.returnValue.unit
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    List {
        AFunctionOneExampleView(func: .pointDistance, precision: .fractionLength(0 ... 5), exampleIndex: 1)
    }
}
