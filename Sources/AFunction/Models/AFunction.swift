import AValue
import Foundation

public struct AFunction: Sendable, Identifiable, CustomStringConvertible {
    /// 唯一标识符
    public let id: Int
    /// 简短名称
    public let shortName: String
    /// 参数列表
    public let arguments: Arguments
    /// 返回值
    public let returnValue: Argument
    /// 所属部分
    public let part: Part
    /// 示例参数列表
    public let examples: [ExampleArgs]
    /// 实例函数
    public let instance: @Sendable ([AValue]) throws -> AValue

    public init(id: Int, shortName: String, arguments: Arguments, returnValue: Argument, part: Part, examples: [ExampleArgs], instance: @escaping @Sendable ([AValue]) throws -> AValue) {
        self.id = id
        self.shortName = shortName
        self.arguments = arguments
        self.returnValue = returnValue
        self.part = part
        self.examples = examples.map {
            AFunction.ExampleArgs($0.values, arguments: arguments)
        }
        self.instance = instance
    }

    public init(id: Int, shortName: String, arguments: Arguments, returnValue: Argument, part: Part, _ exampleValues: [[AValue]], instance: @escaping @Sendable ([AValue]) throws -> AValue) {
        self.id = id
        self.shortName = shortName
        self.arguments = arguments
        self.returnValue = returnValue
        self.part = part
        self.examples = exampleValues.map {
            AFunction.ExampleArgs($0, arguments: arguments)
        }
        self.instance = instance
    }

    public var description: String {
        "" + arguments.description + ":" + returnValue.name
    }
}
