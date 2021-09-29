//
//  todoappApp.swift
//  todoapp
//
//  Created by Atsushi on 2021/04/05.
//

import SwiftUI

@main
struct todoappApp: App {
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView()
            }.onAppear() {
                // NCMBの初期化処理をここに書きます
                print("これは不要です。削除してください")
            }
        }
    }
}
