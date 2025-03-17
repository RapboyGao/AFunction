import AValue

#if os(iOS)

@available(iOS 16.0, *)
public struct AArgumentsContent: View {
    var arguments: AFunction.Arguments

    public var body: some View {
        switch arguments {
        case .finite(let arguments):
            ForEach(arguments) { argument in
                AArgumentView(argument: argument, finiteOpt: .finite)
            }
        case .withInfinite(let arguments, infinite: let infiniteArgument):
            ForEach(arguments) { thisArgument in
                AArgumentView(argument: thisArgument, finiteOpt: .finite)
            }
            AArgumentView(argument: infiniteArgument, finiteOpt: .infinite)
        case .withOptional(let arguments, optionals: let optionalArguments):
            ForEach(arguments) { thisArgument in
                AArgumentView(argument: thisArgument, finiteOpt: .finite)
            }
            ForEach(optionalArguments) { thisArgument in
                AArgumentView(argument: thisArgument, finiteOpt: .optional)
            }
        }
    }

    public init(_ arguments: AFunction.Arguments) {
        self.arguments = arguments
    }

    public init(function: AFunction) {
        self.arguments = function.arguments
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        AArgumentsContent(function: AFunction.pointDistance)
    }
}

#endif
