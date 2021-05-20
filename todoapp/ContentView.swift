//
//  ContentView.swift
//  todoapp
//
//  Created by Atsushi on 2021/04/05.
//

import SwiftUI
import Combine

struct ContentView: View, InputViewDelegate, EditViewDelegate {
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottomTrailing) {
                List {
                    // Todo変数のデータを一覧表示します
                }
                
                NavigationLink(destination: InputView(delegate: self, text: "")) {
                    Text("Add")
                        .foregroundColor(Color.white)
                        .font(Font.system(size: 20))
                }
                .frame(width: 60, height: 60)
                .background(Color.blue)
                .cornerRadius(30)
                .padding()
                
            }
            .onAppear {
                // 画面表示された際のイベントです
            }
            .navigationTitle("TODO")
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    // タスクの削除処理です
    func delete(at offsets: IndexSet) {
    }
    
    // タスクの追加処理です
    func addTodo(text: String) {
    }
    
    // タスクの編集処理です
    func editTodo(text: String, objectId: String) {
    }
}

// 編集画面からのイベントを受け取るDelegate
protocol EditViewDelegate {
    func editTodo(text: String, objectId: String)
}

// 編集画面
struct EditView: View {
    @Environment(\.presentationMode) var presentation
    let delegate: EditViewDelegate
    // 処理対象のデータストアオブジェクトID
    @State var objectId: String
    // タスク本文
    @State var text: String
    // 画面に関する設定
    var body: some View {
        VStack(spacing: 16) {
            TextField("タスクを編集してください", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("編集") {
                // 保存ボタンを押したらeditTodoに遷移する
                delegate.editTodo(text: text, objectId: objectId)
                presentation.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}

// タスク追加画面に関するDelegate
protocol InputViewDelegate {
    func addTodo(text: String)
}

// 入力画面
struct InputView: View {
    @Environment(\.presentationMode) var presentation
    let delegate: InputViewDelegate
    // タスク本文
    @State var text: String
    // 画面に関する設定
    var body: some View {
        VStack(spacing: 16) {
            TextField("タスクを追加してください", text: $text)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("追加") {
                // 追加ボタンを押したらaddTodoを実行する
                delegate.addTodo(text: text)
                presentation.wrappedValue.dismiss()
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
