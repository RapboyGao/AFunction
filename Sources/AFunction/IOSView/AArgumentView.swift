import AValue

#if os(iOS)

@available(iOS 16.0, *)
public struct AArgumentView: View {
    var argument: AFunction.Argument
    var finiteOpt: AFunction.OptionalFinite

    public var body: some View {
        VStack(alignment: .leading) {
            AArgumentTitleHStack(name: argument.name, unit: argument.unit, type: argument.type, optFinite: finiteOpt, genericName: argument.genericName)
            Text(argument.introduction)
        }
    }

    public init(argument: AFunction.Argument, finiteOpt: AFunction.OptionalFinite) {
        self.argument = argument
        self.finiteOpt = finiteOpt
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        AArgumentView(argument: .number(name: "Arg1", detail: "Get there amazingly fast."), finiteOpt: .finite)
        AArgumentView(argument: .generic(name: "Arg2", detail: "This is the first arg to scale up to 2", genericName: "T", unit: .knots, allowedTypes: [.number, .calendar]), finiteOpt: .infinite)
    }
}
#endif
