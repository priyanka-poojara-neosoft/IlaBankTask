//
//  IlaBankTaskSwiftUIApp.swift
//  IlaBankTaskSwiftUI
//
//  Created by Priyanka on 31/08/24.
//

import SwiftUI

@main
struct IlaBankTaskSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationView {
                CarouselListView(viewModel: CarouselListViewModel())
            }
        }
    }
}
