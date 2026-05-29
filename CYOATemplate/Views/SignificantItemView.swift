//
//  CharacterView.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-27.
//

import SwiftUI

struct SignificantItemView: View {
    
    // MARK: Stored properties
    var item: SignificantItem
    
    // MARK: Computed properties
    // Computed properties calculate or derive a value using stored properties
    
    // This is the user interface
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(item.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                if let imageName = item.image {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(10)
                        .shadow(radius: 5)
                }
                
                Text(item.description)
                    .font(.body)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    SignificantItemView(item: SignificantItem(id: 1234, name: "Mr. Gordon's iPhone", description: "A strange device capable of unexplicable feats of memory usage", image: "node-1", pageFirstFound: 67))
}
