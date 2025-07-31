import AUnit
import Foundation

extension AFunction {
    public enum Part: Codable, Sendable, Hashable, CaseIterable {
        case math
        case airData
        case points
        case geography
        case strings

        public var systemImage: String {
            switch self {
            case .math:
                return "angle"
            case .airData:
                return "airplane"
            case .points:
                return "chart.xyaxis.line"
            case .geography:
                return "globe.desk"
            case .strings:
                return "textformat"
            }
        }

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
            case .strings:
                return I18n.stringsPartShortName
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
            case .strings:
                return I18n.stringsPartIntroduction
            }
        }
    }
}
