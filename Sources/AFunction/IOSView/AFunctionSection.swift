import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AFunctionSection: View {
    @Binding var isExpanded: Bool
    var function: AFunction

    public var body: some View {
        Section {
            VStack(alignment: .leading, spacing: 10) {
                Text(function.shortName)
                    .font(.title)
                ScrollView(.horizontal) {
                    HStack(spacing: 0) {
                        Text("(")
                        Text(function.arguments.description)
                        Text(")")
                        Text(" = ")
                        Text(function.returnValue.name)
                    }
                    .foregroundColor(.gray)
                }
                .scrollIndicators(.hidden)
            }
            AArgumentsContent(function.arguments)
            AArgumentView(argument: function.returnValue, finiteOpt: .finite)
            DisclosureGroup(isExpanded: $isExpanded) {
                AFunctionAllExamplesView(func: function, precision: .fractionLength(0 ... 5))
            } label: {
                Text("Examples")
            }
        } header: {
            Text(function.shortName)
        } footer: {
            Text(function.description)
        }
    }

    public init(isExpanded: Binding<Bool>, function: AFunction) {
        self._isExpanded = isExpanded
        self.function = function
    }

    public init(_ function: AFunction) {
        self.function = function
        let state = State(initialValue: true)
        self._isExpanded = state.projectedValue
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        ForEach(AFunction.allCases) { someFunc in
            AFunctionSection(someFunc)
        }
    }
}

#endif
