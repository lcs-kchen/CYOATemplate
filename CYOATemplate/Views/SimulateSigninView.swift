//
//  SimulateSigninView.swift
//  CYOATemplate
//
//  Created by Haowen Chen on 2026-05-26.
//

import SwiftUI

struct SimulateSignInView: View {
    
    @Environment(SharedAuthenticationStore.self) var sharedAuthenticationStore

    @Binding var showing: Bool
    
    @State private var selectedPlayer: Player?
    //Stored
    var body: some View {
        NavigationStack {
            VStack {
                if sharedAuthenticationStore.players.isEmpty {
                    //?
                    ProgressView()
                } else {
                    Picker("Select a player:", selection: $selectedPlayer) {
                        ForEach(sharedAuthenticationStore.players) {
                            player in
                            Text(player.email).tag(player)
                        }
                    }
                    .pickerStyle(.inline)
                }
            }
            .toolbar {
                ToolbarItem {
                    Button {
                        //"sign in"
                        sharedAuthenticationStore.setSignedInPlayer(to: selectedPlayer!)
                        showing = false
                    } label: {
                        Text("Sign In")
                    }
                    .disabled(selectedPlayer == nil)
                }
            }
            .navigationTitle("Simulate sign-in")
        }
    }
}

#Preview {
    @Previewable @State var sharedAuthenticationStore = SharedAuthenticationStore()
    @Previewable @State var sheetIsShowing = true
    
    Text("View that appears behind this one")
        .sheet(isPresented: $sheetIsShowing) {
            SimulateSignInView(showing: $sheetIsShowing)
                .presentationDetents([.fraction(0.3), .medium])
                .environment(sharedAuthenticationStore)
        }
}
