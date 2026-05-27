//
//  CharacterView.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-27.
//

import SwiftUI

struct SignificantItemView: View {
    
    // MARK: Stored properties
    // Stored properties must be provided with a value by providing an argument when creating an instance of this structure, or, be initialized with a default value
    
    
    // MARK: Computed properties
    // Computed properties calculate or derive a value using stored properties
    
    // This is the user interface
    var body: some View {
        VStack {
            Text("character name placeholder")
                .font(.title)
//            if let image = character.image {
//                
//                Image(image)
//                    .resizable()
//                    .scaledToFit()
//                    .border(.black, width: 1)
//                    .padding(.vertical, 10)
//
//            }
            Text("description placeholder")
        }
    }
    
    // MARK: Functions
    // Functions take action using information provided through parameters

}

#Preview {
    SignificantItemView()
}
