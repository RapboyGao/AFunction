import AUnit
import AValue
import AViewUI
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AValueElementArrayView: View {
    public var value: AValueArrayElement
    public var precision: NumberFormatStyleConfiguration.Precision
    @State private var selectedUnit: AUnit?

    public var format: FloatingPointFormatStyle<Double> {
        .number.grouping(.never).precision(precision)
    }

    public var body: some View {
        if !value.isFirst {
            Text(", ")
        }
        AValueAsArgumentView(value: value.value, precision: precision, unit: value.unit)
    }

    public init(value: AValueArrayElement, precision: NumberFormatStyleConfiguration.Precision) {
        self.value = value
        self.precision = precision
    }
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    List {
        AValueElementArrayView(value: .init(id: 1, value: 35, isLast: false, unit: .meters), precision: .fractionLength(0 ... 5))
        AValueElementArrayView(value: .init(id: 0, value: .point(x: 2, y: 5), isLast: true, unit: .meters), precision: .fractionLength(0 ... 5))
        AValueElementArrayView(value: .init(id: 0, value: .location(latitude: 40.126447, longitude: 113.15691), isLast: true, unit: .meters), precision: .fractionLength(0 ... 5))
        AValueElementArrayView(value: .init(id: 0, value: true, isLast: true, unit: .meters), precision: .fractionLength(0 ... 5))
        AValueElementArrayView(value: .init(id: 0, value: .groundWind(limit: .b737), isLast: true, unit: .metersPerSecond), precision: .fractionLength(0 ... 5))
    }
}
