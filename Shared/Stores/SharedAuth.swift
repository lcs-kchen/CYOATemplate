//
//  SharedAuth.swift
//  CYOATemplate
//
//  Created by Haowen Chen on 2026-05-26.
//

import Foundation
import Supabase

@Observable
class SharedAuthenticationStore {

    var players: [Player] = []
    var signedInPlayer: Player?

    let client = SupabaseClient(
        supabaseURL: URL(string: "https://wwwqkzsnksxhycpxsfrt.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Ind3d3FrenNua3N4aHljcHhzZnJ0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NzkzNjEyNDksImV4cCI6MjA5NDkzNzI0OX0.XNadKgHq_emtFO5Ua270EIyyIji6C8i4MlsOAZjoFx8"
    )

    init() {
        Task {
            await loadPlayers()
        }
    }

    func loadPlayers() async {
        do {
            let response: [Player] = try await client
                .from("players")
                .select()
                .execute()
                .value

            self.players = response
        } catch {
            print("Error loading players:", error)
        }
    }

    func setSignedInPlayer(to player: Player) {
        signedInPlayer = player
    }
}
