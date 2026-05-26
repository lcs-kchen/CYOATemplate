//
//  SigninView.swift
//  CYOATemplate
//
//  Created by Haowen Chen on 2026-05-26.
//

import SwiftUI

struct SignInView: View {
    
    //Stored
    @State private var showingSignInSheet = false
    
    //Computed
    
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(colors: [.white, .white, .blue], startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    Button {
                        showingSignInSheet = true
                    } label: {
                        Label("Sign in to get started", systemImage: "car.fill")
                            .padding()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.green)
                    .padding(.top)
                    
                    Spacer()
                }
                .font(.title2)
                .padding()
                .sheet(isPresented: $showingSignInSheet) {
                    SimulateSignInView(showing: $showingSignInSheet)
                    .presentationDetents([.fraction(0.3), .medium])
                }
            }
            .navigationTitle("CYOATemplate")
        }
    }
}

#Preview {
    SignInView()
        .environment(SharedAuthenticationStore())
}
