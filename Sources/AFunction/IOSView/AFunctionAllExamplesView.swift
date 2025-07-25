import AUnit
import AValue
import AViewUI
import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AFunctionAllExamplesView: View {
    var name: String
    var instance: ([AValue]) throws -> AValue
    var examples: [AFunction.ExampleArgs]
    var precision: NumberFormatStyleConfiguration.Precision
    var returningUnit: AUnit?

    public var body: some View {
        ForEach(examples) { example in
            AFunctionOneExampleView(name: name, example, precision: precision, unitOfReturn: returningUnit, instance: instance)
        }
    }

    public init(name: String, instance: @escaping ([AValue]) -> AValue, examples: [AFunction.ExampleArgs], precision: NumberFormatStyleConfiguration.Precision, returningUnit: AUnit? = nil) {
        self.name = name
        self.instance = instance
        self.examples = examples
        self.precision = precision
        self.returningUnit = returningUnit
    }

    public init(func aFunction: AFunction, precision: NumberFormatStyleConfiguration.Precision) {
        self.name = aFunction.shortName
        self.instance = aFunction.instance
        self.examples = aFunction.examples
        self.precision = precision
        self.returningUnit = aFunction.returnValue.unit
    }
}

@available(iOS 16.0, *)
#Preview {
    List(AFunction.allCases) { someFunction in
        AFunctionAllExamplesView(func: someFunction, precision: .fractionLength(0 ... 5))
    }
}

#endif
