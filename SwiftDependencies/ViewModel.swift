//
//  ViewModelRoot.swift
//  SwiftDependencies
//
//  Created by Przemyslaw Szafulski on 17/08/2023.
//

import Foundation
import PackageDependency
import Dependencies

class ViewModel: ObservableObject {
    @Dependency(\.packageDependency) private var packageDependency

    @Published private(set) var packageInt = 0

    public func updateInts() {
        packageInt = packageDependency.getInt()
    }

    public func packageIncrement() {
        packageDependency.increment()
    }

    public func packageDecrement() {
        packageDependency.decrement()
    }
}
