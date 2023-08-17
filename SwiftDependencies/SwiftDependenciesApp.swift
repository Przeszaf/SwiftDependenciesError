//
//  SwiftDependenciesApp.swift
//  SwiftDependencies
//
//  Created by Przemyslaw Szafulski on 17/08/2023.
//

import SwiftUI

@main
struct SwiftDependenciesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: .init())
        }
    }
}
