//
//  Untitled.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-26.
//

import Supabase
import SwiftUI

struct SignificantItemListView: View {
    
    // MARK: Stored properties
    
    // Whether this view is showing in the sheet right now
    @Binding var showing: Bool
    
    // The list of significant items
    @State var significantItems: [SignificantItem] = []
    
    // MARK: Computed properties
    var body: some View {
        NavigationStack {
            List(significantItems) { item in
                NavigationLink(destination: SignificantItemView(item: item)) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.description)
                                .font(.subheadline)
                                .lineLimit(1)
                        }
                    }
                }
            }
            .navigationTitle("Items You Encountered")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Done") {
                        showing = false
                    }
                }
            }
            .task {
                await fetchSignificantItems()
            }
        }
    }
    
    // MARK: Functions
    
    func fetchSignificantItems() async {
        do {
            let items: [SignificantItem] = try await supabase
                .from("significant_item")
                .select()
                .order("pageFirstFound", ascending: true)
                .execute()
                .value
            
            self.significantItems = items
        } catch {
            debugPrint(error)
        }
    }
    
}

#Preview {
    SignificantItemListView(showing: Binding.constant(true))
}
