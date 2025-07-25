import Foundation

/// 所有的字符串都由这里产生
enum I18n {
    static let examples = NSLocalizedString(
        "title.examples.name", bundle: .module, comment: "Title for examples section")

    // Functions descriptions
    static let cosFunctionDescription = NSLocalizedString(
        "cos_function_description", bundle: .module, comment: "Description of cosine function")
    static let sinFunctionDescription = NSLocalizedString(
        "sin_function_description", bundle: .module, comment: "Description of sine function")
    static let maxFunctionDescription = NSLocalizedString(
        "max_function_description", bundle: .module, comment: "Description of max function")
    static let distanceFunctionDescription = NSLocalizedString(
        "distance_function_description", bundle: .module,
        comment: "Description of distance function")

    static func functionDescription(name: String) -> String {
        return String(
            format: NSLocalizedString(
                "function_description_format", bundle: .module,

                comment: "Function description format"), name)
    }

    // Argument names and details
    static let angleArgumentName = NSLocalizedString(
        "angle_argument_name", bundle: .module, comment: "Name for angle argument")
    static let angleArgumentDetail = NSLocalizedString(
        "angle_argument_detail", bundle: .module, comment: "Detail for angle argument")

    static let value1ArgumentName = NSLocalizedString(
        "value1_argument_name", bundle: .module, comment: "Name for first value argument")
    static let value1ArgumentDetail = NSLocalizedString(
        "value1_argument_detail", bundle: .module, comment: "Detail for first value argument")

    static let value2ArgumentName = NSLocalizedString(
        "value2_argument_name", bundle: .module, comment: "Name for second value argument")
    static let value2ArgumentDetail = NSLocalizedString(
        "value2_argument_detail", bundle: .module, comment: "Detail for second value argument")

    static let location1ArgumentName = NSLocalizedString(
        "location1_argument_name", bundle: .module, comment: "Name for first location argument")
    static let location1ArgumentDetail = NSLocalizedString(
        "location1_argument_detail", bundle: .module, comment: "Detail for first location argument")

    static let location2ArgumentName = NSLocalizedString(
        "location2_argument_name", bundle: .module, comment: "Name for second location argument")
    static let location2ArgumentDetail = NSLocalizedString(
        "location2_argument_detail", bundle: .module, comment: "Detail for second location argument"
    )

    static let locationDistanceArgumentName = NSLocalizedString(
        "location_distance_argument_name", bundle: .module,
        comment: "Name for location distance argument. Just use Distance for the word.")
    static let locationDistanceArgumentDetail = NSLocalizedString(
        "location_distance_argument_detail", bundle: .module,
        comment: "Detail for location distance argument")

    static let point1ArgumentName = NSLocalizedString(
        "point1_argument_name", bundle: .module, comment: "Name for first point argument")
    static let point1ArgumentDetail = NSLocalizedString(
        "point1_argument_detail", bundle: .module, comment: "Detail for first point argument")

    static let point2ArgumentName = NSLocalizedString(
        "point2_argument_name", bundle: .module, comment: "Name for second point argument")
    static let point2ArgumentDetail = NSLocalizedString(
        "point2_argument_detail", bundle: .module, comment: "Detail for second point argument")

    static let distanceArgumentName = NSLocalizedString(
        "distance_argument_name", bundle: .module, comment: "Name for distance argument")
    static let distanceArgumentDetail = NSLocalizedString(
        "distance_argument_detail", bundle: .module, comment: "Detail for distance argument")

    static let resultArgumentName = NSLocalizedString(
        "result_argument_name", bundle: .module, comment: "Name for result argument")
}
