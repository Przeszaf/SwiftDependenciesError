// Copyright © xDesign. All rights reserved.

import Dependencies
import XCTest
@testable import SwiftDependencies
import PackageDependency

final class SwiftDependenciesTests: XCTestCase {
    private var sut: ViewModel!
    private var mock: PackageDependencyProtocolMock!

    override func setUpWithError() throws {
        mock = .init()
        sut = withDependencies({
            $0.packageDependency = mock
        }, operation: {
            ViewModel()
        })
    }

    func testExample() throws {
        // Given
        mock.getIntReturnValue = 0

        // When
        sut.packageIncrement()
        sut.packageIncrement()
        sut.updateInts()

        // Then
        XCTAssertEqual(mock.incrementCallsCount, 2)
        XCTAssertEqual(mock.getIntCallsCount, 1)
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
