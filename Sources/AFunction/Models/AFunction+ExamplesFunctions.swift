import AUnits
import AValue
import CoreLocation
import Foundation

// Example functions
extension AFunction {
    public static let cosFunction = AFunction(
        id: 1,
        shortName: "cos",
        arguments: .finite([
            .number(name: I18n.angleArgumentName, detail: I18n.angleArgumentDetail, unit: .degrees)
        ]),
        returnValue: Argument(
            name: I18n.resultArgumentName, detail: I18n.cosFunctionDescription, type: .one(.number)),
        part: .math,
        examples: [ExampleArgs([60]), ExampleArgs([45]), ExampleArgs([90]), ExampleArgs([-60])],
        instance: { args in
            let angle = try args.number(at: 0)
            let someAngle = AAngle(value: angle, unit: .degrees)
            return .number(someAngle.cos())
        }
    )

    public static let sinFunction = AFunction(
        id: 2,
        shortName: "sin",
        arguments: .finite([
            .number(name: I18n.angleArgumentName, detail: I18n.angleArgumentDetail, unit: .degrees)
        ]),
        returnValue: Argument(
            name: I18n.resultArgumentName, detail: I18n.sinFunctionDescription, type: .one(.number)),
        part: .math,
        examples: [ExampleArgs([60]), ExampleArgs([45]), ExampleArgs([90]), ExampleArgs([-60])],
        instance: { args in
            let angle = try args.number(at: 0)
            let someAngle = AAngle(value: angle, unit: .degrees)
            return .number(someAngle.sin())
        }
    )

    public static let maxFunction = AFunction(
        id: 3,
        shortName: "max",
        arguments: .finite([
            Argument(
                name: I18n.value1ArgumentName, detail: I18n.value1ArgumentDetail,
                type: .one(.number)),
            Argument(
                name: I18n.value2ArgumentName, detail: I18n.value2ArgumentDetail,
                type: .one(.number)),
        ]),
        returnValue: Argument(
            name: "result", detail: I18n.maxFunctionDescription, type: .one(.number)),
        part: .math,
        examples: [ExampleArgs([.number(1), .number(2)]), ExampleArgs([.number(3), .number(2)])],
        instance: { args in
            let value1 = try args.number(at: 0)
            let value2 = try args.number(at: 1)
            return .number(max(value1, value2))
        }
    )

    public static let distanceFunction = AFunction(
        id: 4,
        shortName: "distance",
        arguments: .finite([
            Argument(
                name: I18n.location1ArgumentName, detail: I18n.location1ArgumentDetail,
                type: .one(.location)),
            Argument(
                name: I18n.location2ArgumentName, detail: I18n.location2ArgumentDetail,
                type: .one(.location)),
        ]),
        returnValue: .number(
            name: I18n.locationDistanceArgumentName,
            detail: I18n.locationDistanceArgumentDetail,
            unit: .meters),
        part: .geography,
        examples: [
            ExampleArgs([
                .location(latitude: 37.7749, longitude: -122.4194),
                .location(latitude: 34.0522, longitude: -118.2437),
            ]),
            ExampleArgs([
                .location(latitude: 51.5074, longitude: -0.1278),
                .location(latitude: 48.8566, longitude: 2.3522),
            ]),
        ],
        instance: { args in
            let loc1 = try args.location(at: 0)
            let loc2 = try args.location(at: 1)
            let coord1 = CLLocation(latitude: loc1.latitude, longitude: loc1.longitude)
            let coord2 = CLLocation(latitude: loc2.latitude, longitude: loc2.longitude)
            return .number(coord1.distance(from: coord2))
        }
    )

    public static let pointDistance = AFunction(
        id: 5,
        shortName: "pointDistance",
        arguments: .finite([
            Argument(name: I18n.point1ArgumentName, detail: I18n.point1ArgumentDetail, type: .one(.point)),
            Argument(name: I18n.point2ArgumentName, detail: I18n.point2ArgumentDetail, type: .one(.point)),
        ]),
        returnValue: Argument(
            name: I18n.distanceArgumentName, detail: I18n.distanceArgumentDetail, type: .one(.number)),
        part: .points,
        examples: [
            ExampleArgs([.point(x: 0, y: 0), .point(x: 3, y: 4)]),
            ExampleArgs([.point(x: 1, y: 1), .point(x: 4, y: 5)]),
            ExampleArgs([.point(x: -1, y: -1), .point(x: 10, y: 2)]),
        ],
        instance: { args in
            let point1 = try args.point(at: 0)
            let point2 = try args.point(at: 1)
            let distance = sqrt(pow(point2.x - point1.x, 2) + pow(point2.y - point1.y, 2))
            return .number(distance)
        }
    )
}

// MARK: - All Cases

extension AFunction {
    public static var allCases: [AFunction] {
        return [
            .cosFunction,
            .sinFunction,
            .maxFunction,
            .distanceFunction,
            .pointDistance,
            // 将其他函数添加到此数组中
        ]
    }

    public static let functionInstances: [Int: @Sendable ([AValue]) throws -> AValue] = {
        var instances = [Int: @Sendable ([AValue]) throws -> AValue]()
        for function in AFunction.allCases {
            instances[function.id] = function.instance
        }
        return instances
    }()
}
