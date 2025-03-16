import SwiftUI

#if os(iOS)
@available(iOS 16.0, *)
public struct AArgumentTypeImages: View {
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
            AArgumentTypeImages(.anything)
        }
        HStack {
            AArgumentTypeImages(.collection([.minutes, .number, .boolean]))
        }
        HStack {
            AArgumentTypeImages(.one(.calendar))
        }
    }
    .foregroundColor(.blue)
}

#endif
