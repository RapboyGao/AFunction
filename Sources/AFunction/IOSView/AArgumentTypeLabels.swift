import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AArgumentTypeIconMenus: View {
    var argumentType: AFunction.ArgumentType

    public var body: some View {
        switch argumentType {
        case .anything:
            Menu {
                Text("Anything")
            } label: {
                Image(systemName: "checkmark.rectangle.stack")
            }

        case .collection(let array):
            ForEach(array) { someType in
                Menu {
                    Label(someType.name, systemImage: someType.symbolName)
                } label: {
                    Image(systemName: someType.symbolName)
                }
            }

        case .one(let someType):
            Menu {
                Label(someType.name, systemImage: someType.symbolName)
                Text(someType.introduction)
            } label: {
                Image(systemName: someType.symbolName)
            }
        }
    }

    public init(_ argumentType: AFunction.ArgumentType) {
        self.argumentType = argumentType
    }
}

@available(iOS 16.0, *)
#Preview {
    List {
        HStack {
            AArgumentTypeIconMenus(.anything)
        }
        HStack {
            AArgumentTypeIconMenus(.collection([.minutes, .number, .boolean]))
        }
        HStack {
            AArgumentTypeIconMenus(.one(.calendar))
        }
    }
    .foregroundColor(.blue)
}

#endif
