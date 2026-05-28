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
    var playerIsSignedIn: Bool {
        return signedInPlayer != nil
    }

    let client = SupabaseClient(
        supabaseURL: URL(string: "https://wwwqkzsnksxhycpxsfrt.supabase.co")!,
        supabaseKey: "sb_publishable_yEOJ08IUbclmSj0Zt1pXOw_J_atR_Gk"
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
