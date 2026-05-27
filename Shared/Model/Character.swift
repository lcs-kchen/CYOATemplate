//
//  Character.swift
//  CYOATemplate
//
//  Created by Veda Niav Cunniffe on 2026-05-27.
//

import Foundation

struct Character: Identifiable, Codable {
    
    // MARK: Stored properties
    var id: Int
    var name: String
    var description: String
    var image: String?
    var pageFirstFound: Int
    
    // Translating snake_case into camelCase
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case image
        case pageFirstFound = "page_first_found"
    }
    
    

    
    // MARK: Computed properties
    // Computed properties calculate or derive a value using stored properties
    
    
    
    // MARK: Functions
    // Functions take action using information provided through parameters
    
    

}

// Create several instances of your structure...


// Now create an array containing the instances above
