import AUnit
import Foundation

public extension AFunction {
    enum Part: Codable, Sendable, Hashable {
        case math
        case airData
        case points
        case geography

        /// 本地化的短名称
        public var shortName: String {
            switch self {
            case .math:
                return I18n.mathPartShortName
            case .airData:
                return I18n.airDataPartShortName
            case .points:
                return I18n.pointsPartShortName
            case .geography:
                return I18n.geographyPartShortName
            }
        }

        /// 本地化的详细介绍
        public var introduction: String {
            switch self {
            case .math:
                return I18n.mathPartIntroduction
            case .airData:
                return I18n.airDataPartIntroduction
            case .points:
                return I18n.pointsPartIntroduction
            case .geography:
                return I18n.geographyPartIntroduction
            }
        }
    }
}
