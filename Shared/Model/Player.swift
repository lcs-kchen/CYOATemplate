//
//  Player.swift
//  CYOATemplate
//
//  Created by Haowen Chen on 2026-05-26.
//

import Foundation

struct Player: Identifiable, Codable, Hashable {
    let id: UUID
    let email: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
    }
}
