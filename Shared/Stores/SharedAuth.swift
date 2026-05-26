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
        supabaseURL: URL(string: "https://mrdjbpjpvgtqxznsgtee.supabase.co")!,
        supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1yZGpicGpwdmd0cXh6bnNndGVlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTczMzIyMzgsImV4cCI6MjAzMjkwODIzOH0.kLM3U980_U3qjFvw-5kvUERqSsIiB_-HTHa2FlhM5wU"
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
