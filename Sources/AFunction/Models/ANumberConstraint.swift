import Foundation

public enum ANumberConstraint: Codable, Sendable, Hashable {
    case range(RangeConstraint) // 区间约束
    case integer(IntegerConstraint) // 整数约束
    case realNumber(RealNumberConstraint) // 实数约束
    case step(StepConstraint) // 步长约束

    var description: String {
        switch self {
        case .range(let constraint):
            switch constraint {
            case .inclusive(let min, let max):
                return I18n.inclusiveRange(min: min, max: max)
            case .exclusiveMinInclusiveMax(let min, let max):
                return I18n.exclusiveMinInclusiveMaxRange(min: min, max: max)
            case .inclusiveMinExclusiveMax(let min, let max):
                return I18n.inclusiveMinExclusiveMaxRange(min: min, max: max)
            case .exclusive(let min, let max):
                return I18n.exclusiveRange(min: min, max: max)
            case .inclusiveWithStep(let min, let max, let step):
                return I18n.inclusiveRangeWithStep(min: min, max: max, step: step)
            case .exclusiveMinInclusiveMaxWithStep(let min, let max, let step):
                return I18n.exclusiveMinInclusiveMaxRangeWithStep(min: min, max: max, step: step)
            case .inclusiveMinExclusiveMaxWithStep(let min, let max, let step):
                return I18n.inclusiveMinExclusiveMaxRangeWithStep(min: min, max: max, step: step)
            case .exclusiveWithStep(let min, let max, let step):
                return I18n.exclusiveRangeWithStep(min: min, max: max, step: step)
            case .rangeExcluding(let min, let max, let exclude):
                return I18n.rangeExcluding(min: min, max: max, exclude: exclude)
            case .rangeExcludingWithStep(let min, let max, let exclude, let step):
                return I18n.rangeExcludingWithStep(min: min, max: max, exclude: exclude, step: step)
            }
        case .integer(let constraint):
            switch constraint {
            case .inclusive(let min, let max):
                return String(format: I18n.integerConstraintInclusive, min, max)
            case .positive:
                return I18n.integerConstraintPositive
            case .nonNegative:
                return I18n.integerConstraintNonNegative
            case .negative:
                return I18n.integerConstraintNegative
            case .nonPositive:
                return I18n.integerConstraintNonPositive
            case .nonZero:
                return I18n.integerConstraintNonZero
            case .rangeExcluding(let min, let max, let exclude):
                return String(format: I18n.integerConstraintRangeExcluding, min, max, exclude)
            case .singleValue(let value):
                return String(format: I18n.integerConstraintSingleValue, value)
            case .naturalNumber:
                return I18n.integerConstraintNaturalNumber
            case .evenNumber:
                return I18n.integerConstraintEvenNumber
            case .oddNumber:
                return I18n.integerConstraintOddNumber
            case .integerSet(let set):
                return String(format: I18n.integerConstraintIntegerSet, set)
            }
        case .realNumber(let constraint):
            switch constraint {
            case .positive:
                return I18n.realNumberConstraintPositive
            case .nonNegative:
                return I18n.realNumberConstraintNonNegative
            case .negative:
                return I18n.realNumberConstraintNegative
            case .nonPositive:
                return I18n.realNumberConstraintNonPositive
            case .nonZero:
                return I18n.realNumberConstraintNonZero
            case .singleValue(let value):
                return String(format: I18n.realNumberConstraintSingleValue, value)
            case .realNumber:
                return I18n.realNumberConstraintRealNumber
            case .rationalNumber:
                return I18n.realNumberConstraintRationalNumber
            case .infiniteRange:
                return I18n.realNumberConstraintInfiniteRange
            }
        case .step(let constraint):
            switch constraint {
            case .positive(let step):
                return String(format: I18n.stepConstraintPositive, step)
            case .nonNegative(let step):
                return String(format: I18n.stepConstraintNonNegative, step)
            case .negative(let step):
                return String(format: I18n.stepConstraintNegative, step)
            case .nonPositive(let step):
                return String(format: I18n.stepConstraintNonPositive, step)
            case .nonZero(let step):
                return String(format: I18n.stepConstraintNonZero, step)
            }
        }
    }

    @Sendable func validate(_ value: Double) -> Bool {
        switch self {
        case .range(let constraint):
            switch constraint {
            case .inclusive(let min, let max):
                return value >= min && value <= max
            case .exclusiveMinInclusiveMax(let min, let max):
                return value > min && value <= max
            case .inclusiveMinExclusiveMax(let min, let max):
                return value >= min && value < max
            case .exclusive(let min, let max):
                return value > min && value < max
            case .inclusiveWithStep(let min, let max, let step):
                return value >= min && value <= max && (value - min).truncatingRemainder(dividingBy: step) == 0
            case .exclusiveMinInclusiveMaxWithStep(let min, let max, let step):
                return value > min && value <= max && (value - min).truncatingRemainder(dividingBy: step) == 0
            case .inclusiveMinExclusiveMaxWithStep(let min, let max, let step):
                return value >= min && value < max && (value - min).truncatingRemainder(dividingBy: step) == 0
            case .exclusiveWithStep(let min, let max, let step):
                return value > min && value < max && (value - min).truncatingRemainder(dividingBy: step) == 0
            case .rangeExcluding(let min, let max, let exclude):
                return value >= min && value <= max && value != exclude
            case .rangeExcludingWithStep(let min, let max, let exclude, let step):
                return value >= min && value <= max && value != exclude && (value - min).truncatingRemainder(dividingBy: step) == 0
            }
        case .integer(let constraint):
            switch constraint {
            case .inclusive(let min, let max):
                return value >= Double(min) && value <= Double(max)
            case .positive:
                return value > 0
            case .nonNegative:
                return value >= 0
            case .negative:
                return value < 0
            case .nonPositive:
                return value <= 0
            case .nonZero:
                return value != 0
            case .rangeExcluding(let min, let max, let exclude):
                return value >= Double(min) && value <= Double(max) && value != Double(exclude)
            case .singleValue(let val):
                return value == Double(val)
            case .naturalNumber:
                return value >= 1 && floor(value) == value
            case .evenNumber:
                return value.truncatingRemainder(dividingBy: 2) == 0
            case .oddNumber:
                return value.truncatingRemainder(dividingBy: 2) != 0
            case .integerSet(let set):
                return set.contains(Int(value))
            }
        case .realNumber(let constraint):
            switch constraint {
            case .positive:
                return value > 0
            case .nonNegative:
                return value >= 0
            case .negative:
                return value < 0
            case .nonPositive:
                return value <= 0
            case .nonZero:
                return value != 0
            case .singleValue(let val):
                return value == val
            case .realNumber:
                return true
            case .rationalNumber:
                return true // 假设传入的所有数字都是有理数
            case .infiniteRange:
                return true
            }
        case .step(let constraint):
            switch constraint {
            case .positive(let step):
                return value > 0 && value.truncatingRemainder(dividingBy: step) == 0
            case .nonNegative(let step):
                return value >= 0 && value.truncatingRemainder(dividingBy: step) == 0
            case .negative(let step):
                return value < 0 && value.truncatingRemainder(dividingBy: step) == 0
            case .nonPositive(let step):
                return value <= 0 && value.truncatingRemainder(dividingBy: step) == 0
            case .nonZero(let step):
                return value != 0 && value.truncatingRemainder(dividingBy: step) == 0
            }
        }
    }
}

public extension ANumberConstraint {
    // 区间类型
    enum RangeConstraint: Codable, Sendable, Hashable {
        case inclusive(min: Double, max: Double) // 包含最小值和最大值
        case exclusiveMinInclusiveMax(min: Double, max: Double) // 不包含最小值但包含最大值
        case inclusiveMinExclusiveMax(min: Double, max: Double) // 包含最小值但不包含最大值
        case exclusive(min: Double, max: Double) // 不包含最小值和最大值
        case inclusiveWithStep(min: Double, max: Double, step: Double) // 包含最小值和最大值，且有步长
        case exclusiveMinInclusiveMaxWithStep(min: Double, max: Double, step: Double) // 不包含最小值但包含最大值，且有步长
        case inclusiveMinExclusiveMaxWithStep(min: Double, max: Double, step: Double) // 包含最小值但不包含最大值，且有步长
        case exclusiveWithStep(min: Double, max: Double, step: Double) // 不包含最小值和最大值，且有步长
        case rangeExcluding(min: Double, max: Double, exclude: Double) // 包含最小值和最大值，但排除某个值
        case rangeExcludingWithStep(min: Double, max: Double, exclude: Double, step: Double) // 包含最小值和最大值，但排除某个值，且有步长
    }

    // 整数类型
    enum IntegerConstraint: Codable, Sendable, Hashable {
        case inclusive(min: Int, max: Int) // 包含最小值和最大值
        case positive // 正数
        case nonNegative // 非负数
        case negative // 负数
        case nonPositive // 非正数
        case nonZero // 非零
        case rangeExcluding(min: Int, max: Int, exclude: Int) // 包含最小值和最大值，但排除某个值
        case singleValue(value: Int) // 单个值
        case naturalNumber // 自然数
        case evenNumber // 偶数
        case oddNumber // 奇数
        case integerSet(Set<Int>) // 整数集合
    }

    // 实数类型
    enum RealNumberConstraint: Codable, Sendable, Hashable {
        case positive // 正数
        case nonNegative // 非负数
        case negative // 负数
        case nonPositive // 非正数
        case nonZero // 非零
        case singleValue(value: Double) // 单个值
        case realNumber // 实数
        case rationalNumber // 有理数
        case infiniteRange // 无限区间
    }

    // 带步长的类型
    enum StepConstraint: Codable, Sendable, Hashable {
        case positive(step: Double) // 正步长
        case nonNegative(step: Double) // 非负步长
        case negative(step: Double) // 负步长
        case nonPositive(step: Double) // 非正步长
        case nonZero(step: Double) // 非零步长
    }
}
