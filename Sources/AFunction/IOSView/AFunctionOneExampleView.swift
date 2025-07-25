import AUnit
import AValue
import AViewUI
import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AFunctionOneExampleView: View {
    var name: String
    var args: AFunction.ExampleArgs
    var precision: NumberFormatStyleConfiguration.Precision
    var returningUnit: AUnit?
    var result: AValue?

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
        self.args = AFunction.ExampleArgs(values, arguments: arguments)
        self.precision = precision
        self.returningUnit = unitOfReturn
        self.result = try? instance(values)
    }

    public init(name: String, _ example: AFunction.ExampleArgs, precision: NumberFormatStyleConfiguration.Precision, unitOfReturn: AUnit?, instance: @escaping ([AValue]) throws -> AValue) {
        self.name = name
        self.args = example
        self.precision = precision
        self.returningUnit = unitOfReturn
        self.result = try? instance(example.values)
    }

    public init(func function: AFunction, precision: NumberFormatStyleConfiguration.Precision, exampleIndex: Int) {
        self.name = function.shortName
        self.args = function.examples[exampleIndex]
        self.precision = precision
        self.returningUnit = function.returnValue.unit
        self.result = try? function.instance(function.examples[exampleIndex].values)
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        AFunctionOneExampleView(func: .pointDistance, precision: .fractionLength(0 ... 5), exampleIndex: 1)
    }
}

#endif
