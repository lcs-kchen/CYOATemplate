//
//  CYOATemplateApp.swift
//  CYOATemplate
//
//  Created by Russell Gordon on 2023-05-29.
//

import SwiftUI

@main
struct CYOATemplateApp: App {

    @State private var sharedAuthenticationStore = SharedAuthenticationStore()

    var body: some Scene {

        WindowGroup {

            BranchingView()
                .environment(sharedAuthenticationStore)
        }
    }
}
