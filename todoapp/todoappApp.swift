//
//  todoappApp.swift
//  todoapp
//
//  Created by Atsushi on 2021/04/05.
//

import SwiftUI

@main
struct todoappApp: App {
    @Environment(\.scenePhase) private var scenePhase
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .onChange(of: scenePhase) { scene in
            switch scene {
            case .active:
                // NCMBの初期化処理をここに書きます
                print("これは不要です。削除してください")
            case .inactive:
                print("scenePhase: inactive")
            case .background:
                print("scenePhase: background")
            @unknown default: break
            }
        }
    }
}
