//
//  Untitled.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-26.
//

import SwiftUI

struct CharactersView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // MARK: Computed properties
    var body: some View {
        Text("Hello, world!")
    }
    
}

#Preview {
    CharactersView(showing: Binding.constant(true))
}
