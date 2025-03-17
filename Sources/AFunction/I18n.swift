import Foundation

/// 所有的字符串都由这里产生
enum I18n {
    // Functions descriptions
    static let cosFunctionDescription = NSLocalizedString("cos_function_description", comment: "Description of cosine function")
    static let sinFunctionDescription = NSLocalizedString("sin_function_description", comment: "Description of sine function")
    static let maxFunctionDescription = NSLocalizedString("max_function_description", comment: "Description of max function")
    static let distanceFunctionDescription = NSLocalizedString("distance_function_description", comment: "Description of distance function")
    static func functionDescription(name: String) -> String {
        return String(format: NSLocalizedString("function_description_format", comment: "Function description format"), name)
    }

    // Argument names and details
    static let angleArgumentName = NSLocalizedString("angle_argument_name", comment: "Name for angle argument")
    static let angleArgumentDetail = NSLocalizedString("angle_argument_detail", comment: "Detail for angle argument")

    static let value1ArgumentName = NSLocalizedString("value1_argument_name", comment: "Name for first value argument")
    static let value1ArgumentDetail = NSLocalizedString("value1_argument_detail", comment: "Detail for first value argument")

    static let value2ArgumentName = NSLocalizedString("value2_argument_name", comment: "Name for second value argument")
    static let value2ArgumentDetail = NSLocalizedString("value2_argument_detail", comment: "Detail for second value argument")

    static let location1ArgumentName = NSLocalizedString("location1_argument_name", comment: "Name for first location argument")
    static let location1ArgumentDetail = NSLocalizedString("location1_argument_detail", comment: "Detail for first location argument")

    static let location2ArgumentName = NSLocalizedString("location2_argument_name", comment: "Name for second location argument")
    static let location2ArgumentDetail = NSLocalizedString("location2_argument_detail", comment: "Detail for second location argument")
}
