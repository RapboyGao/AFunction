import AValue
import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AArgumentTitleHStack: View {
    var name: String
    var unit: AUnit?
    var type: AFunction.ArgumentType
    var genericName: String?

    public var body: some View {
        HStack {
            Text(name)
                .bold()
            if let unit = unit {
                Text(unit.shortName)
                    .font(.caption2)
                    .foregroundColor(.gray)
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
                        Text(genericName) +
                            Text(" *")
                            .foregroundColor(.gray)
                            .font(.caption2) +
                            Text(array.count, format: .number)
                            .foregroundColor(.gray)
                            .font(.caption2)
                    }
                case .one:
                    AArgumentTypeIconMenus(type)
                }
            } else {
                AArgumentTypeIconMenus(type)
            }
        }
    }

    public init(name: String, unit: AUnit?, type: AFunction.ArgumentType, genericName: String?) {
        self.name = name
        self.unit = unit
        self.type = type
        self.genericName = genericName
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        AArgumentTitleHStack(name: "Num1", unit: .meters, type: .collection([.calendar, .minutes, .number, .string]), genericName: "类型1")
        AArgumentTitleHStack(name: "Num2", unit: nil, type: .one(.boolean), genericName: "类型2")
    }
}

#endif
