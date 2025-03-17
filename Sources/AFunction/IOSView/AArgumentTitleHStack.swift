import AValue
import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AArgumentTitleHStack: View {
    var name: String
    var unit: AUnit?
    var type: AFunction.ArgumentType
    var optFinite: AFunction.OptionalFinite
    var genericName: String?

    var titleText: Text {
        switch optFinite {
        case .optional:
            Text(name).bold() + Text("?").foregroundColor(.gray)
        case .finite:
            Text(name).bold()
        case .infinite:
            Text(name).bold() + Text("..").foregroundColor(.gray)
        }
    }

    public var body: some View {
        HStack {
            titleText
            if let unit = unit {
                Menu {
                    Label(unit.nameInMenu, systemImage: unit.unitType.systemImage)
                } label: {
                    Text(unit.shortName)
                        .font(.caption)
                }
            }
            Spacer()
            if let genericName = genericName {
                switch type {
                case .anything:
                    Text(genericName)
                        .foregroundColor(.accentColor)
                case .collection(let array):
                    Menu {
                        ForEach(array) { someType in
                            Label(someType.name, systemImage: someType.symbolName)
                        }
                    } label: {
                        Text(array.count, format: .number)
                            .foregroundColor(.gray)
                            .font(.caption)
                            +
                            Text(" *")
                            .foregroundColor(.gray)
                            .font(.caption)
                            +
                            Text(genericName)
                    }
                case .one:
                    AArgumentTypeIconMenus(type)
                }
            } else {
                AArgumentTypeIconMenus(type)
            }
        }
    }

    public init(name: String, unit: AUnit?, type: AFunction.ArgumentType, optFinite: AFunction.OptionalFinite, genericName: String?) {
        self.name = name
        self.unit = unit
        self.type = type
        self.genericName = genericName
        self.optFinite = optFinite
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        AArgumentTitleHStack(name: "Num1", unit: .meters, type: .collection([.calendar, .minutes, .number, .string]), optFinite: .finite, genericName: "类型1")
        AArgumentTitleHStack(name: "Num2", unit: nil, type: .one(.boolean), optFinite: .optional, genericName: "类型2")
        AArgumentTitleHStack(name: "Num3", unit: .meters, type: .one(.number), optFinite: .infinite, genericName: "类型2")
    }
}

#endif
