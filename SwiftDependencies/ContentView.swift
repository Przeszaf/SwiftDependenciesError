// Copyright © xDesign. All rights reserved.

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: ViewModel

    var body: some View {
        VStack {
            Text("Package Dependency - \(viewModel.packageInt)")
            Button("Update package dependency") { viewModel.updateInts() }
            HStack {
                Button("+") { viewModel.packageIncrement() }
                Button("-") { viewModel.packageDecrement() }
            }
        }
        .padding()
    }
}
