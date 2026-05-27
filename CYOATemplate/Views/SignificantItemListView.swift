//
//  Untitled.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-26.
//

import SwiftUI

struct SignificantItemListView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // The list of significant items
    @State var significantItems: [SignificantItem]
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(significantItems) { significantItem in
                    NavigationLink(destination: SignificantItemView()) {
                        Text("")
                    }
                }
            }
        }
    }
    
}

#Preview {
    SignificantItemListView(showing: Binding.constant(true))
}
