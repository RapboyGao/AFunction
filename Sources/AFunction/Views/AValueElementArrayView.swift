import AValue
import AViewUI
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AValueElementArrayView: View {
    public var value: AValueArrayElement

    public var precision: FloatingPointFormatStyle.Configuration.Precision

    public var format: FloatingPointFormatStyle<Double> {
        .number.grouping(.never).precision(precision)
    }

    public var body: some View {
        if !value.isFirst {
            Text(", ")
        }
        switch value.value {
        case .number(let double):
            if let unit = value.unit {
                Menu {
                    ForEach(unit.unitType.allUnits) { thisUnit in
                        if let someValue = unit.convert(value: double, to: thisUnit) {
                            Text(someValue, format: format) + Text(" ") + Text(thisUnit.symbol)
                        } else {
                            Text("- ") + Text(thisUnit.symbol)
                        }
                    }
                } label: {
                    Text(double, format: format) + Text(unit.symbol)
                }

            } else {
                Text(double, format: format)
            }
        case .point(let x, let y):
            Text("(") + Text(x, format: format) + Text(",") + Text(y, format: format) + Text(")")
        case .location(let latitude, let longitude):
            Text(latitude, format: ALatitudeFormat.dM(digits: 1)) + Text(longitude, format: ALongitudeFormat.dM(digits: 1))
        case .boolean(let bool):
            Toggle("", isOn: .constant(bool)).labelsHidden()
        case .string, .groundWind, .minutes, .calendar, .dateDifference:
            Text(value.value.description)
        }
    }
}
