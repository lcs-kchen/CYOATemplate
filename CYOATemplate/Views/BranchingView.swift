//
//  BranchingView.swift
//  CYOATemplate
//
//  Created by Haowen Chen on 2026-05-27.
//

import SwiftUI

struct BranchingView: View {
    //Stored property
    @Environment(SharedAuthenticationStore.self) var sharedAuthenticationStore
    
    var body: some View {
        
        VStack(spacing: 0) {
            if sharedAuthenticationStore.playerIsSignedIn {
                AppEntryView()
            } else {
                SignInView()
            }
        }
        .animation(
            Animation.easeInOut(
                duration: 1
            )
        , value: sharedAuthenticationStore.playerIsSignedIn)
        
        
    }
}

#Preview {
    BranchingView()
        .environment(SharedAuthenticationStore())
}
