// Copyright © xDesign. All rights reserved.

import Dependencies

private struct PackageDependencyKey: DependencyKey {
    static var liveValue: PackageDependencyProtocol = PackageDependency()
}

public extension DependencyValues {
    var packageDependency: PackageDependencyProtocol {
        get { self[PackageDependencyKey.self] }
        set { self[PackageDependencyKey.self] = newValue }
    }
}

public protocol PackageDependencyProtocol {
    func getInt() -> Int
    func increment()
    func decrement()
}

public class PackageDependency: PackageDependencyProtocol {
    private var num = 0
    public func getInt() -> Int {
        num
    }

    public func increment() {
        num = num + 1
    }

    public func decrement() {
        num = num - 1
    }
}

// MARK: - PackageDependencyProtocolMock -

final class PackageDependencyProtocolMock: PackageDependencyProtocol {

   // MARK: - getInt

    var getIntCallsCount = 0
    var getIntCalled: Bool {
        getIntCallsCount > 0
    }
    var getIntReturnValue: Int!
    var getIntClosure: (() -> Int)?

    func getInt() -> Int {
        getIntCallsCount += 1
        return getIntClosure.map({ $0() }) ?? getIntReturnValue
    }

   // MARK: - increment

    var incrementCallsCount = 0
    var incrementCalled: Bool {
        incrementCallsCount > 0
    }
    var incrementClosure: (() -> Void)?

    func increment() {
        incrementCallsCount += 1
        incrementClosure?()
    }

   // MARK: - decrement

    var decrementCallsCount = 0
    var decrementCalled: Bool {
        decrementCallsCount > 0
    }
    var decrementClosure: (() -> Void)?

    func decrement() {
        decrementCallsCount += 1
        decrementClosure?()
    }
}
